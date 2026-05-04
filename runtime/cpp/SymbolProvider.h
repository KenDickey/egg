#ifndef _SYMBOLPROVIDER_H_
#define _SYMBOLPROVIDER_H_

#include <string>
#include <map>
#include "Egg.h"
#include "Utils/egg_string.h"
#include "GCedRef.h"

namespace Egg {

class Runtime;

class SymbolProvider {
public:
    virtual ~SymbolProvider() = default;
    virtual Object* symbolFor_(const Egg::string& name) = 0;
    virtual Object* existingSymbolFor_(const Egg::string& name) = 0;
};

class Bootstrapper;

class BootstrapSymbolProvider : public SymbolProvider {
    Bootstrapper* _bootstrapper;
    std::map<Egg::string, Object*> _symbols;
public:
    BootstrapSymbolProvider(Bootstrapper* bootstrapper) : _bootstrapper(bootstrapper) {}

    Object* symbolFor_(const Egg::string& name) override;
    Object* existingSymbolFor_(const Egg::string& name) override;

    std::map<Egg::string, Object*>& symbols() { return _symbols; }
};

class DynamicSymbolProvider : public SymbolProvider {
    Runtime* _runtime;
    GCedRef* _symbolTable;
    std::map<Egg::string, GCedRef*> _cache;
public:
    DynamicSymbolProvider(Runtime* runtime, HeapObject* symbolTable);

    Object* symbolFor_(const Egg::string& name) override;
    Object* existingSymbolFor_(const Egg::string& name) override;

    void symbolTable_(HeapObject* table) { _symbolTable->set_((Object*)table); }
    std::map<Egg::string, GCedRef*>& cache() { return _cache; }
};

}

#endif // _SYMBOLPROVIDER_H_
