/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#include "BlockScope.h"
#include "LocalBinding.h"
#include "../AST/SBlockNode.h"
#include "../AST/SMethodNode.h"
#include <algorithm>
#include <cassert>

namespace Egg {

BlockScope::BlockScope() : ScriptScope() {
}

Binding* BlockScope::captureArgument_(Binding* anArgumentBinding) {
    egg::string name = anArgumentBinding->name();
    auto it = _captured.find(name);
    if (it != _captured.end()) {
        return it->second;
    }
    
    auto transferred = parent_()->transferLocal_(name);
    auto copy = copyLocal_(transferred);
    _captured[name] = copy;
    return copy;
}

void BlockScope::captureEnvironment_(SParseNode* aScriptNode) {
    if (_script == aScriptNode) return;
    
    auto it = std::find(_environments.begin(), _environments.end(), aScriptNode);
    if (it != _environments.end()) return;
    
    realParent_()->captureEnvironment_(aScriptNode);
    
    if (aScriptNode->isMethod()) {
        _environments.insert(_environments.begin(), aScriptNode);
    } else {
        _environments.push_back(aScriptNode);
    }
}

Binding* BlockScope::captureLocal_(Binding* aLocalBinding) {
    if (defines_(aLocalBinding->name())) {
        return aLocalBinding;
    }
    
    if (aLocalBinding->kind() == Binding::Kind::Temporary) {
        return captureTemporary_(aLocalBinding);
    } else {
        return captureArgument_(aLocalBinding);
    }
}

void BlockScope::captureSelf_() {
    if (_captureSelf) return;
    _captureSelf = true;
    parent_()->captureSelf_();
}

Binding* BlockScope::captureTemporary_(Binding* aTemporaryBinding) {
    egg::string name = aTemporaryBinding->name();
    if (defines_(name)) {
        return aTemporaryBinding;
    }
    
    auto it = _captured.find(name);
    if (it != _captured.end()) {
        return it->second;
    }
    
    auto parent = parent_();
    auto declaration = parent->scriptDefining_(name);
    realScope_()->captureEnvironment_(declaration->realScript());
    
    auto transferred = parent->transferLocal_(name);
    auto copy = copyLocal_(transferred);
    
    // In Smalltalk: copy isInArray ifTrue: [aTemporaryBinding beInArray].
    // copyLocal_ for non-inlined blocks always marks the copy as inArray,
    // so this effectively always marks the original binding as inArray too.
    if (auto localCopy = dynamic_cast<LocalBinding*>(copy)) {
        if (localCopy->isInArray()) {
            if (auto localTemp = dynamic_cast<LocalBinding*>(aTemporaryBinding)) {
                localTemp->beInArray_();
            }
        }
    }
    
    _captured[name] = copy;
    return copy;
}

std::vector<Binding*> BlockScope::capturedArguments_() {
    std::vector<Binding*> result;
    for (auto& pair : _captured) {
        if (pair.second->kind() == Binding::Kind::Argument) {
            result.push_back(pair.second);
        }
    }
    return result;
}

int BlockScope::capturedEnvironmentIndexOf_(SScriptNode* aScriptNode) {
    auto realScript = aScriptNode->realScript();
    if (realScript == _script->realScript()) {
        return -1;  // Return special value for nullptr
    }
    
    auto it = std::find(_environments.begin(), _environments.end(), aScriptNode);
    assert(it != _environments.end());
    
    int index = std::distance(_environments.begin(), it) + 1;
    return capturesSelf() ? index + 1 : index;
}

bool BlockScope::capturesHome_() {
    return home_() != nullptr;
}

Binding* BlockScope::copyLocal_(Binding* binding) {
    if (static_cast<SBlockNode*>(_script)->isInlined()) {
        return binding;
    } else {
        auto copy = binding->copy_();
        if (auto localCopy = dynamic_cast<LocalBinding*>(copy)) {
            localCopy->beInArray_();
        }
        return copy;
    }
}

int* BlockScope::environmentIndexOf_(SScriptNode* aScriptNode) {
    if (!aScriptNode->isMethod() && !aScriptNode->isBlock()) {
        assert(false);
        return nullptr;
    }
    
    int index = capturedEnvironmentIndexOf_(aScriptNode);
    if (index < 0) return nullptr;
    
    static int result;
    result = index;
    return &result;
}

int BlockScope::environmentSizeUpToCapturedArguments_() {
    return environmentSizeUpToEnvironments_() + capturedArguments_().size();
}

int BlockScope::environmentSizeUpToEnvironments_() {
    int receiver = capturesSelf() ? 1 : 0;
    return receiver + _environments.size();
}

std::vector<SParseNode*> BlockScope::environments_() {
    if (_environments.empty()) {
        return std::vector<SParseNode*>();
    }
    
    auto first = _environments[0];
    if (first->isMethod()) {
        return std::vector<SParseNode*>(_environments.begin() + 1, _environments.end());
    }
    return _environments;
}

SParseNode* BlockScope::home_() {
    if (_environments.empty()) {
        return nullptr;
    }
    
    auto first = _environments[0];
    return first->isMethod() ? first : nullptr;
}

std::vector<Binding*> BlockScope::localBindings_() {
    auto result = ScriptScope::localBindings_();
    for (auto& pair : _captured) {
        result.push_back(pair.second);
    }
    return result;
}

ScriptScope* BlockScope::parent_() {
    if (!_script) return nullptr;
    auto blockNode = static_cast<SBlockNode*>(_script);
    auto parent = blockNode->parent();
    return parent ? parent->scope() : nullptr;
}

void BlockScope::positionCapturedArgument_(Binding* anArgumentBinding) {
    if (auto localBinding = dynamic_cast<LocalBinding*>(anArgumentBinding)) {
        localBinding->index_(growEnvironment_());
    }
}

void BlockScope::positionCapturedLocals_() {
    if (static_cast<SBlockNode*>(_script)->isInlined()) {
        return;
    }
    
    _envSize = environmentSizeUpToEnvironments_();
    for (auto& pair : _captured) {
        auto binding = pair.second;
        if (binding->kind() == Binding::Kind::Argument) {
            positionCapturedArgument_(binding);
        } else {
            positionCapturedTemporary_(binding);
        }
    }
}

void BlockScope::positionCapturedTemporary_(Binding* aTemporaryBinding) {
    auto outest = scriptDefining_(aTemporaryBinding->name());
    int index = capturedEnvironmentIndexOf_(outest->realScript());
    
    if (auto localTemp = dynamic_cast<LocalBinding*>(aTemporaryBinding)) {
        localTemp->environmentIndex_(index);
        
        auto declaration = outest->scope()->resolve_(aTemporaryBinding->name());
        if (auto localDecl = dynamic_cast<LocalBinding*>(declaration)) {
            assert(localDecl->index() >= 0);
            localTemp->index_(localDecl->index());
        }
    }
}

void BlockScope::positionDefinedArgumentsIn_(ScriptScope* aScriptScope) {
    for (auto& pair : _arguments) {
        auto binding = pair.second;
        if (auto localBinding = dynamic_cast<LocalBinding*>(binding)) {
            int index = localBinding->isInArray() ?
                aScriptScope->growEnvironment_() :
                aScriptScope->growStack_();
            localBinding->index_(index);
        }
    }
}

void BlockScope::positionDefinedLocals_() {
    auto blockNode = static_cast<SBlockNode*>(_script);
    if (blockNode->isInlined()) {
        auto real = realScope_();
        positionDefinedTemporariesIn_(real);
        positionDefinedArgumentsIn_(real);
    } else {
        ScriptScope::positionDefinedLocals_();
    }
}

void BlockScope::positionLocals_() {
    positionCapturedLocals_();
    ScriptScope::positionLocals_();
}

ScriptScope* BlockScope::realParent_() {
    if (!_script) return nullptr;
    auto blockNode = static_cast<SBlockNode*>(_script);
    auto parent = blockNode->parent();
    if (!parent) return nullptr;
    auto realParent = parent->realScript();
    return realParent ? realParent->scope() : nullptr;
}

Binding* BlockScope::resolve_(const egg::string& aString) {
    auto local = resolveLocal_(aString);
    if (local) return local;
    return parent_()->resolve_(aString);
}

Binding* BlockScope::resolveLocal_(const egg::string& aString) {
    auto local = ScriptScope::resolveLocal_(aString);
    if (local) return local;
    
    auto it = _captured.find(aString);
    return (it != _captured.end()) ? it->second : nullptr;
}

SScriptNode* BlockScope::scriptDefining_(const egg::string& aString) {
    if (defines_(aString)) {
        return _script;
    }
    return parent_()->scriptDefining_(aString);
}

Binding* BlockScope::transferLocal_(const egg::string& name) {
    auto binding = resolveLocal_(name);
    if (binding) return binding;
    
    binding = parent_()->transferLocal_(name);
    auto copy = copyLocal_(binding);
    _captured[name] = copy;
    return copy;
}

} // namespace Egg
