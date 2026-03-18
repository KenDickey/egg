/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#include "MethodScope.h"
#include "PseudoVariableBindings.h"
#include "../AST/SScriptNode.h"
#include <cassert>

namespace Egg {

MethodScope::MethodScope() : ScriptScope() {
    initializePseudoVars_();
}

void MethodScope::initializePseudoVars_() {
    _pseudo["nil"] = new NilBinding();
    _pseudo["true"] = new TrueBinding();
    _pseudo["false"] = new FalseBinding();
    _pseudo["self"] = new SelfBinding();
    _pseudo["super"] = new SuperBinding();
}

void MethodScope::captureEnvironment_(SParseNode* aScriptNode) {
    assert(aScriptNode == _script);
}

Binding* MethodScope::captureLocal_(Binding* aLocalBinding) {
    assert(resolveLocal_(aLocalBinding->name()) != nullptr);
    return aLocalBinding;
}

void MethodScope::captureSelf_() {
    _captureSelf = true;
}

int* MethodScope::environmentIndexOf_(SScriptNode* aScriptNode) {
    assert(aScriptNode == _script);
    return nullptr;
}

Binding* MethodScope::resolve_(const Egg::string& aString) {
    auto local = resolveLocal_(aString);
    if (local) return local;
    
    auto pseudo = resolvePseudo_(aString);
    if (pseudo) return pseudo;
    
    return DynamicBinding::named_(aString);
}

Binding* MethodScope::resolvePseudo_(const Egg::string& aString) {
    auto it = _pseudo.find(aString);
    return (it != _pseudo.end()) ? it->second : nullptr;
}

SScriptNode* MethodScope::scriptDefining_(const Egg::string& aString) {
    if (resolveLocal_(aString)) {
        return _script;
    }
    assert(false);
    return nullptr;
}

Binding* MethodScope::transferLocal_(const Egg::string& name) {
    return resolveLocal_(name);
}

} // namespace Egg
