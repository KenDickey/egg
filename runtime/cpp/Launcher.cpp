/*
    Copyright (c) 2019-2023 Javier Pimás, Jan Vrany, Labware. 
    See (MIT) license in root directory.
 */

#include <vector>
#include <filesystem>

#include "Launcher.h"
#include "Util.h"
#include "Loader.h"
#include "GCedRef.h"

#include "Evaluator/Runtime.h"

using namespace Egg;

int
Launcher::main(const int argc, const char** argv)
{
    if (argc != 2) {
        printf("Usage: %s <module name>\n", argv[0]);
        return 1;
    }

    Egg::Initialize();

    // Determine modules directory from the module path argument
    std::filesystem::path modulePath(argv[1]);
    std::string modulesDir;
    if (modulePath.has_parent_path()) {
        modulesDir = modulePath.parent_path().string();
    } else {
        modulesDir = "modules";
    }

    auto loader = new Loader(modulesDir);
    Runtime* runtime = loader->loadKernel();
    if (!runtime) {
        return 1;
    }

    // Extract module name from path
    auto moduleName = modulePath.filename().string();

    auto kernelModule = (Object*)runtime->_kernel->_exports["__module__"];
    runtime->sendLocal_to_("useHostModuleLoader", kernelModule);
    auto moduleNameSym = (Object*)runtime->addSymbol_(moduleName);
    auto module = runtime->sendLocal_to_with_("load:", kernelModule, moduleNameSym);
    GCedRef moduleRef(module);
    auto args = std::vector<Object*>();
    for (int i = 0; i < argc; i++)
        args.push_back((Object*)runtime->newString_(argv[i]));
    auto array = runtime->newArray_(args);
    runtime->sendLocal_to_with_("main:", moduleRef.get(), (Object*)array);

    return 0;
}

void start(Runtime *runtime, HeapObject *kernel, std::vector<Object*> &args) {
    HeapObject *name = runtime->sendLocal_to_("name", (Egg::Object*)kernel)->asHeapObject();
    std::cout << "The name of kernel module is " << name->asLocalString() << std::endl;

    std::cout << "Loading module " << args[1]->asHeapObject()->asLocalString() << std::endl;
    auto module = runtime->sendLocal_to_with_("load:", (Object*)kernel, (Object*)args[1]);

    name = runtime->sendLocal_to_("name", module)->asHeapObject();
    std::cout << "The name of loaded module is " << name->asLocalString() << std::endl;

    auto array = runtime->newArray_(args);
    runtime->sendLocal_to_with_("main:", module, (Object*)array);

}

void runBareTests(Runtime *runtime, HeapObject *kernel, std::vector<Object*> &args)
{
    auto segment = runtime->_bootstrapper->bareLoadModuleFromFile("Kernel.BareTests.ems");
    segment->dumpObjects();
    auto module = segment->_exports["__module__"];
    auto methodDict = runtime->behaviorMethodDictionary_(runtime->behaviorOf_((Object*)module));
    auto table = runtime->dictionaryTable_(methodDict);
    std::vector<HeapObject*> methods;
    for (int index = 2; index < table->size(); index += 2) {
        auto symbol = table->slotAt_(index)->asHeapObject();
        if (symbol != runtime->_nilObj && symbol->asLocalString().starts_with("test"))
            methods.push_back(table->slotAt_(index + 1)->asHeapObject());
    }

    std::sort(methods.begin(), methods.end(),
        [runtime](HeapObject *a, HeapObject *b) {
            return std::strcmp((char*)runtime->methodSelector_(a), (char*)runtime->methodSelector_(b)) < 0;
    });

    for (auto method : methods) {
       // auto result = runtime->_evaluator->invoke_with_(method, (Object*)runtime->_nilObj);
        //runtime->_evaluator->evaluate();
        auto selector = runtime->methodSelector_(method)->printString();
       // if (selector == "test161CreateDictionary")
        {
            auto result = runtime->sendLocal_to_(selector, (Object*)module);
            ASSERT(result == (Object*)runtime->_trueObj);
        }
    }
}