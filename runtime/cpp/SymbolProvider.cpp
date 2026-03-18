#include "SymbolProvider.h"
#include "Evaluator/Runtime.h"
#include "Bootstrap/Bootstrapper.h"

namespace Egg {

Object* BootstrapSymbolProvider::symbolFor_(const Egg::string& name) {
    auto it = _symbols.find(name);
    if (it != _symbols.end())
        return it->second;
    auto symbol = _bootstrapper->newSymbol_(name);
    _symbols[name] = symbol;
    return symbol;
}

Object* BootstrapSymbolProvider::existingSymbolFor_(const Egg::string& name) {
    auto it = _symbols.find(name);
    return it != _symbols.end() ? it->second : nullptr;
}

DynamicSymbolProvider::DynamicSymbolProvider(Runtime* runtime, HeapObject* symbolTable)
    : _runtime(runtime), _symbolTable(symbolTable) {}

Object* DynamicSymbolProvider::existingSymbolFor_(const Egg::string& name) {
    auto it = _cache.find(name);
    if (it != _cache.end())
        return it->second->get();

    bool isLatin1 = name.isLatin1();
    const char* bytes;
    if (isLatin1) {
        bytes = name.toBytes();
    } else {
        bytes = reinterpret_cast<const char*>(name.c_str());
    }

    std::string bytesStr(bytes, isLatin1 ? name.size() : name.size() * 4);

    // Linear scan of symbol table (HashTable with 'policy' ivar at slot 1, elements from slot 2)
    HeapObject* table = _symbolTable->slotAt_(2)->asHeapObject();
    for (int i = 2; i <= table->size(); i++) {
        auto symbol = table->slotAt_(i);
        if (symbol != (Object*)_runtime->_nilObj) {
            if (symbol->asHeapObject()->sameBytesThan(bytesStr)) {
                if (isLatin1) delete[] bytes;
                _cache[name] = new GCedRef(symbol);
                return symbol;
            }
        }
    }

    if (isLatin1) delete[] bytes;
    return nullptr;
}

Object* DynamicSymbolProvider::symbolFor_(const Egg::string& name) {
    auto existing = existingSymbolFor_(name);
    if (existing)
        return existing;

    auto stringObj = _runtime->newString_(name.toUtf8());
    auto result = _runtime->sendLocal_to_("asSymbol", (Object*)stringObj);
    _cache[name] = new GCedRef(result);
    return result;
}

}
