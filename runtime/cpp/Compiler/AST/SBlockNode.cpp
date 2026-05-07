/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SBlockNode.h"
#include "SIdentifierNode.h"
#include "SParseNodeVisitor.h"
#include "../Binding/ScriptScope.h"
#include "../Binding/BlockScope.h"
#include "../Binding/ArgumentBinding.h"

namespace Egg {

SBlockNode::SBlockNode(SSmalltalkCompiler* compiler) 
    : SScriptNode(compiler), _inlined(false), _index(0), _parent(nullptr) {
    // Matching Smalltalk's SBlockNode >> initialize which does:
    //   scope := BlockScope on: self
    auto scope = new BlockScope();
    scope->script_(this);
    _scope = scope;
}

void SBlockNode::beInlined_() {
    _inlined = true;
    for (auto arg : _arguments) {
        auto argBinding = dynamic_cast<ArgumentBinding*>(arg->binding());
        if (argBinding) {
            argBinding->beInlined_();
        }
    }
}

void SBlockNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitBlock_(this);
}

void SBlockNode::parent_(SScriptNode* p) {
    _parent = p;
    if (p) p->addChild_(this);
}

SScriptNode* SBlockNode::realScript() {
    return _inlined ? (_parent ? _parent->realScript() : nullptr) : this;
}

void SBlockNode::captureHome() {
    if (_scope) {
        _scope->captureEnvironment_(ast());
    }
}

bool SBlockNode::usesHome() const {
    if (_inlined) {
        for (auto child : _children) {
            auto block = static_cast<SBlockNode*>(child);
            if (block->usesHome()) {
                return true;
            }
        }
        return false;
    } else {
        auto blockScope = dynamic_cast<BlockScope*>(_scope);
        return blockScope && blockScope->capturesHome_();
    }
}

} // namespace Egg
