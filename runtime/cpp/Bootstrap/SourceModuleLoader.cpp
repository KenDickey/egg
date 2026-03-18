/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SourceModuleLoader.h"
#include "TonelReader.h"
#include "../Compiler/SSmalltalkCompiler.h"
#include "../Compiler/LiteralValue.h"
#include "../Compiler/Backend/SCompiledMethod.h"
#include "../Compiler/CompilationResult.h"
#include "../Evaluator/Runtime.h"
#include "../KnownConstants.h"
#include "../GCedRef.h"
#include <cstring>
#include <set>
#include <filesystem>
#include <fstream>
#include <iostream>

namespace Egg {

SourceModuleLoader::SourceModuleLoader(Runtime* runtime)
    : _runtime(runtime) {
    _compiler = std::make_unique<SSmalltalkCompiler>();
}

SourceModuleLoader::~SourceModuleLoader() {
}

Object* SourceModuleLoader::kernelNamespace_() {
    auto kernelModule = (Object*)_runtime->_kernel->_exports["__module__"];
    auto ns = _runtime->sendLocal_to_("namespace", kernelModule);
    return ns;
}

Object* SourceModuleLoader::lookupClass_(const Egg::string& name) {
    auto namespace_ = kernelNamespace_();
    auto symbol = (Object*)_runtime->addSymbol_(name.toUtf8());
    return _runtime->sendLocal_to_with_("at:", namespace_, symbol);
}

HeapObject* SourceModuleLoader::loadModuleFromSource(const std::string& modulePath) {
    namespace fs = std::filesystem;
    TonelReader reader;

    // Phase 1: Parse all .st files in the module directory
    std::vector<Egg::string> newClassNames;
    for (const auto& entry : fs::directory_iterator(modulePath)) {
        if (entry.path().extension() == ".st") {
            std::string filename = entry.path().filename().string();
            std::string className = filename.substr(0, filename.length() - 3);
            if (className == "package") continue;

            std::ifstream file(entry.path());
            if (!file.is_open()) continue;
            std::string source((std::istreambuf_iterator<char>(file)),
                               std::istreambuf_iterator<char>());

            ClassSpec* spec = reader.parseFile(source);
            _moduleSpec.addClass(spec);
            newClassNames.push_back(spec->name());
        }
    }

    // Phase 2: Find module class (subclass of Module)
    Egg::string moduleClassName;
    for (const auto& name : newClassNames) {
        ClassSpec* spec = _moduleSpec.resolveClass(name);
        Egg::string sup = spec->supername();
        while (!sup.empty() && sup != "nil") {
            if (sup == "Module") {
                moduleClassName = name;
                break;
            }
            ClassSpec* superSpec = _moduleSpec.resolveClass(sup);
            if (!superSpec) break;
            sup = superSpec->supername();
        }
        if (!moduleClassName.empty()) break;
    }

    if (moduleClassName.empty()) {
        std::cerr << "ERROR: No Module subclass found in " << modulePath << std::endl;
        std::exit(1);
    }

    // Phase 3: Create module class and instance
    auto moduleSpec = _moduleSpec.resolveClass(moduleClassName);
    auto moduleClass = createNewClassFrom_(moduleSpec, nullptr);

    GCedRef moduleClassRef(moduleClass);
    createMethodsOf_(moduleClassRef.get(), moduleSpec);
    auto moduleInstance = _runtime->sendLocal_to_("new", moduleClassRef.get());
    GCedRef moduleRef(moduleInstance);
    std::string modName = fs::path(modulePath).filename().string();
    auto nameObj = (Object*)_runtime->newString_(modName);
    _runtime->sendLocal_to_with_("name:", moduleRef.get(), nameObj);

    // Now set the module class's module to the new instance
    _runtime->sendLocal_to_with_("module:", moduleClassRef.get(), moduleRef.get());
    _runtime->sendLocal_to_with_("addClass:", moduleRef.get(), moduleClassRef.get());

    // Phase 4: Create remaining classes (sorted so superclasses come first)
    // Simple topological sort: process classes whose superclass is already available
    std::vector<Egg::string> remaining;
    // Collect module-defined class names for dependency checking
    std::set<Egg::string> moduleClassNames;
    for (const auto& name : newClassNames) {
        moduleClassNames.insert(name);
        if (name != moduleClassName)
            remaining.push_back(name);
    }

    std::vector<Egg::string> sorted;
    std::set<Egg::string> created;
    created.insert(moduleClassName); // Module class already created

    while (!remaining.empty()) {
        bool progress = false;
        for (auto it = remaining.begin(); it != remaining.end(); ) {
            auto spec = _moduleSpec.resolveClass(*it);
            auto sup = spec->supername();
            // Superclass is available if it's already created or is not a module class
            // (i.e., it's a kernel class, which is always available)
            bool available = !moduleClassNames.count(sup) || created.count(sup);
            if (available) {
                sorted.push_back(*it);
                created.insert(*it);
                it = remaining.erase(it);
                progress = true;
            } else {
                ++it;
            }
        }
        if (!progress) {
            // Remaining classes have unresolved superclasses, add them anyway
            for (const auto& name : remaining)
                sorted.push_back(name);
            break;
        }
    }

    for (const auto& name : sorted) {
        ClassSpec* spec = _moduleSpec.resolveClass(name);
        auto cls = createNewClassFrom_(spec, moduleRef.get());
        GCedRef clsRef(cls);
        createMethodsOf_(clsRef.get(), spec);
    }

    // Phase 5: Set up module namespace and finalize
    _runtime->sendLocal_to_("bindKernelExports", moduleRef.get());
    _runtime->sendLocal_to_("importRequiredModules", moduleRef.get());
    _runtime->sendLocal_to_("justLoaded", moduleRef.get());

    return moduleRef.get()->asHeapObject();
}

Object* SourceModuleLoader::createNewClassFrom_(ClassSpec* spec, Object* module) {
    // Look up superclass
    auto supername = spec->supername();
    Object* superclass;
    if (module) {
        auto namespace_ = _runtime->sendLocal_to_("namespace", module);
        auto superSymbol = (Object*)_runtime->addSymbol_(supername.toUtf8());
        superclass = _runtime->sendLocal_to_with_("at:", namespace_, superSymbol);
    } else {
        superclass = lookupClass_(supername);
    }

    // Create class: Class newSubclassOf: superclass
    auto classClass = lookupClass_("Class");
    auto newClass = _runtime->sendLocal_to_with_("newSubclassOf:", classClass, superclass);
    GCedRef classRef(newClass);

    // Set name
    auto nameStr = (Object*)_runtime->newString_(spec->name().toUtf8());
    _runtime->sendLocal_to_with_("name:", classRef.get(), nameStr);

    // Set instance variables
    const auto& ivarNames = spec->instVarNames();
    if (!ivarNames.empty()) {
        std::vector<Object*> ivars;
        for (const auto& ivar : ivarNames) {
            ivars.push_back((Object*)_runtime->addSymbol_(ivar.toUtf8()));
        }
        auto ivarArray = (Object*)_runtime->newArray_(ivars);
        _runtime->sendLocal_to_with_("instVarNames:", classRef.get(), ivarArray);
    }

    // Set bytes flag if needed
    if (!spec->isPointers()) {
        _runtime->sendLocal_to_("beBytes", classRef.get());
    }

    // Set class variables
    const auto& classVarNames = spec->classVarNames();
    if (!classVarNames.empty()) {
        auto namespaceClass = lookupClass_("Namespace");
        auto ns = _runtime->sendLocal_to_("new", namespaceClass);
        GCedRef nsRef(ns);
        for (const auto& cvar : classVarNames) {
            auto key = (Object*)_runtime->addSymbol_(cvar.toUtf8());
            _runtime->sendLocal_to_with_with_("at:put:", nsRef.get(), key, (Object*)_runtime->_nilObj);
        }
        _runtime->sendLocal_to_with_("classVariables:", classRef.get(), nsRef.get());
    }

    // Add class to module
    if (module) {
        _runtime->sendLocal_to_with_("addClass:", module, classRef.get());
        _runtime->sendLocal_to_with_("module:", classRef.get(), module);
    }

    return classRef.get();
}

void SourceModuleLoader::createMethodsOf_(Object* cls, ClassSpec* spec) {
    GCedRef clsRef(cls);

    // Instance methods
    for (const auto& method : spec->methods()) {
        createNewMethod_(method.source(), clsRef.get());
    }

    // Class methods
    auto metaclass = _runtime->sendLocal_to_("class", clsRef.get());
    GCedRef metaRef(metaclass);
    for (const auto& method : spec->metaclass()->methods()) {
        createNewMethod_(method.source(), metaRef.get());
    }
}

void SourceModuleLoader::createNewMethod_(const Egg::string& source, Object* species) {
    CompilationResult* result = _compiler->compileMethod_(source);
    SCompiledMethod* smethod = static_cast<SCompiledMethod*>(result->method());
    if (!smethod) {
        std::cerr << "ERROR: Failed to compile method from source: '"
                  << source.substr(0, std::min(source.length(), size_t(60))) << "...'" << std::endl;
        return;
    }

    GCedRef speciesRef(species);

    const auto& treecodes = smethod->treecodes();
    const auto& literals = smethod->literals();
    uint32_t literalCount = literals.size();

    // Create compiled method: CompiledMethod new: literalCount
    auto cmClass = lookupClass_("CompiledMethod");
    auto size = (Object*)_runtime->newInteger_(literalCount);
    auto method = _runtime->sendLocal_to_with_("new:", cmClass, size);
    GCedRef methodRef(method);

    // Set method fields
    auto format = (Object*)_runtime->newInteger_(smethod->format());
    _runtime->sendLocal_to_with_("format:", methodRef.get(), format);

    auto selector = (Object*)_runtime->addSymbol_(smethod->selector().toUtf8());
    _runtime->sendLocal_to_with_("selector:", methodRef.get(), selector);

    // Create treecodes ByteArray
    auto baClass = _runtime->_kernel->_exports["ByteArray"];
    auto ba = _runtime->newBytes_size_(baClass, treecodes.size());
    std::memcpy((void*)ba, treecodes.data(), treecodes.size());
    _runtime->sendLocal_to_with_("treecodes:", methodRef.get(), (Object*)ba);

    _runtime->sendLocal_to_with_("classBinding:", methodRef.get(), speciesRef.get());

    auto sourceObj = (Object*)_runtime->newString_(source.toUtf8());
    _runtime->sendLocal_to_with_("sourceObject:", methodRef.get(), sourceObj);

    // Transfer literals
    for (uint32_t i = 0; i < literalCount; i++) {
        auto literal = transferLiteral_(literals[i], methodRef.get());
        methodRef.get()->asHeapObject()->slot(Offsets::MethodInstSize + i) = literal;
    }

    // Install method: species addSelector: selector withMethod: method
    _runtime->sendLocal_to_with_with_("addSelector:withMethod:", speciesRef.get(), selector, methodRef.get());
}

Object* SourceModuleLoader::transferLiteral_(const LiteralValue& lit, Object* method) {
    switch (lit.tag) {
        case LiteralValue::Symbol:
            return (Object*)_runtime->addSymbol_(lit.asString().toUtf8());
        case LiteralValue::String:
            return (Object*)_runtime->newString_(lit.asString().toUtf8());
        case LiteralValue::Integer:
            return (Object*)_runtime->newInteger_(lit.asInteger());
        case LiteralValue::Float:
            return (Object*)_runtime->newDouble_(lit.asFloat());
        case LiteralValue::Character:
            return (Object*)_runtime->newInteger_((intptr_t)lit.asCharacter());
        case LiteralValue::Boolean:
            return (Object*)(lit.asBoolean() ? _runtime->_trueObj : _runtime->_falseObj);
        case LiteralValue::Nil:
            return (Object*)_runtime->_nilObj;
        case LiteralValue::Array:
            return (Object*)transferArray_(lit.asArray());
        case LiteralValue::ByteArray: {
            auto& bytes = lit.asByteArray();
            auto baClass = _runtime->_kernel->_exports["ByteArray"];
            auto ba = _runtime->newBytes_size_(baClass, bytes.size());
            std::memcpy((void*)ba, bytes.data(), bytes.size());
            return (Object*)ba;
        }
        case LiteralValue::Block:
            return transferBlock_(lit.asBlock(), method);
        default:
            error("transferLiteral_: unimplemented literal tag");
            return (Object*)_runtime->_nilObj;
    }
}

Object* SourceModuleLoader::transferArray_(const std::vector<LiteralValue>& elements) {
    auto arr = _runtime->newArraySized_(elements.size());
    GCedRef arrRef((Object*)arr);
    auto arrayBehavior = _runtime->speciesInstanceBehavior_(_runtime->_kernel->_exports["Array"]);
    arrRef.get()->asHeapObject()->behavior(arrayBehavior);
    for (size_t i = 0; i < elements.size(); i++) {
        arrRef.get()->asHeapObject()->slot(i) = transferLiteral_(elements[i], nullptr);
    }
    return arrRef.get();
}

Object* SourceModuleLoader::transferBlock_(const LiteralValue::BlockInfo& info, Object* method) {
    auto blockClass = _runtime->_kernel->_exports["CompiledBlock"];
    auto block = _runtime->newSlotsOf_(blockClass);
    GCedRef blockRef((Object*)block);

    uint32_t format = (info.argCount & 0x3F)
                    | ((info.tempCount & 0xFF) << 6)
                    | ((info.id & 0xFF) << 14)
                    | (info.capturesSelf ? 0x400000 : 0)
                    | (info.capturesHome ? 0x800000 : 0)
                    | ((info.envCount & 0x7F) << 24);

    blockRef.get()->asHeapObject()->slot(Offsets::BlockFormat) = (Object*)_runtime->newInteger_(format);
    blockRef.get()->asHeapObject()->slot(Offsets::BlockExecutableCode) = (Object*)_runtime->_nilObj;
    blockRef.get()->asHeapObject()->slot(Offsets::BlockMethod) = method;

    return blockRef.get();
}

} // namespace Egg
