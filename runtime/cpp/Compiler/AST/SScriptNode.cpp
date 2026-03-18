/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SScriptNode.h"
#include "SIdentifierNode.h"
#include "../Binding/Binding.h"
#include "../Binding/ScriptScope.h"

namespace Egg {

SScriptNode::SScriptNode(SSmalltalkCompiler* compiler) 
    : SParseNode(compiler), _scope(nullptr) {
}

bool SScriptNode::hasAssign() const {
    for (auto stmt : _statements) {
        if (stmt && stmt->hasAssign()) return true;
    }
    return false;
}

void SScriptNode::nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations) {
    SParseNode::nodesDo_(block, includeDeclarations);
    if (includeDeclarations) {
        for (auto arg : _arguments) {
            if (arg) arg->nodesDo_(block, includeDeclarations);
        }
        for (auto temp : _temporaries) {
            if (temp) temp->nodesDo_(block, includeDeclarations);
        }
    }
    for (auto stmt : _statements) {
        if (stmt) stmt->nodesDo_(block, includeDeclarations);
    }
}

void SScriptNode::reference_(Binding* aBinding) {
    if (aBinding) {
        aBinding->beReferencedFrom_(this);
    }
}

void SScriptNode::useSelf_() {
    _scope->captureSelf_();
}

void SScriptNode::bindLocals() {
    if (_scope) {
        for (auto arg : _arguments) {
            if (arg) arg->defineArgumentIn_(_scope);
        }
        for (auto temp : _temporaries) {
            if (temp) {
                temp->checkLowercase();
                temp->defineTemporaryIn_(_scope);
            }
        }
    }
    for (auto child : _children) {
        if (child) child->bindLocals();
    }
}

void SScriptNode::positionLocals() {
    if (_scope) {
        _scope->positionLocals_();
    }
    for (auto child : _children) {
        if (child) child->positionLocals();
    }
}

} // namespace Egg
