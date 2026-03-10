/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "CodeSpecs.h"
#include <algorithm>

namespace Egg {

// ---- ModuleSpec ----

ModuleSpec::~ModuleSpec() {
    for (auto& [_, cls] : _classes) {
        delete cls->metaclass();
        delete cls;
    }
}

void ModuleSpec::addClass(ClassSpec* cls) {
    _classes[cls->name()] = cls;
    cls->module(this);
}

ClassSpec* ModuleSpec::resolveClass(const egg::string& name) const {
    auto it = _classes.find(name);
    return (it != _classes.end()) ? it->second : nullptr;
}

// ---- ClassSpec ----

ClassSpec* ClassSpec::superclass() const {
    if (_supername.empty() || _supername == U"nil") return nullptr;
    if (!_module) return nullptr;
    return _module->resolveClass(_supername);
}

// ---- MetaclassSpec ----

const egg::string& MetaclassSpec::name() const {
    static const egg::string empty;
    if (!_instanceClass) return empty;
    return _instanceClass->name();
}

ClassSpec* MetaclassSpec::superclass() const {
    if (!_instanceClass) return nullptr;
    return _instanceClass->superclass();
}

// ---- SpeciesSpec ----

uint32_t SpeciesSpec::instSize() const {
    uint32_t count = _instanceVariables.size();
    auto super = superclass();
    while (super) {
        count += super->instVarNames().size();
        super = super->superclass();
    }
    return count;
}

std::vector<egg::string> SpeciesSpec::allInstVarNames() const {
    std::vector<const SpeciesSpec*> chain;
    for (auto s = this; s != nullptr;
         s = static_cast<const SpeciesSpec*>(s->superclass()))
        chain.push_back(s);
    std::reverse(chain.begin(), chain.end());
    std::vector<egg::string> result;
    for (auto s : chain)
        for (auto& iv : s->instVarNames())
            result.push_back(iv);
    return result;
}

} // namespace Egg
