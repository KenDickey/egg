/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SMessageNode.h"
#include "SParseNodeVisitor.h"
#include "SIdentifierNode.h"
#include "SSelectorNode.h"
#include "../Binding/Binding.h"
#include "../SSmalltalkCompiler.h"

namespace Egg {

SMessageNode::SMessageNode(SSmalltalkCompiler* compiler) 
    : SParseNode(compiler), _receiver(nullptr), _selector(nullptr), _inlined(false) {
}

void SMessageNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitMessage_(this);
}

bool SMessageNode::hasAssign() const {
    if (_receiver && _receiver->hasAssign()) return true;
    for (auto arg : _arguments) {
        if (arg && arg->hasAssign()) return true;
    }
    return false;
}

bool SMessageNode::hasVolatileArguments() const {
    for (auto arg : _arguments) {
        if (!arg) continue;
        if (arg->isIdentifier()) {
            auto id = static_cast<SIdentifierNode*>(arg);
            if (id->binding() && id->binding()->canBeAssigned()) {
                return true;
            }
        } else {
            if (!arg->isBlock() && !arg->isLiteral()) {
                return true;
            }
        }
    }
    return false;
}

bool SMessageNode::hasVolatileReceiver() const {
    if (_compiler->hasBlocks()) {
        return true;
    }
    if (!_receiver || !_receiver->isMethodTemporary()) {
        return true;
    }
    for (auto arg : _arguments) {
        if (arg && arg->hasAssign()) {
            return true;
        }
    }
    return false;
}

bool SMessageNode::needsStrictEvaluationOrder() const {
    if (_arguments.size() == 0) return false;
    if (!_receiver) return false;
    if (_receiver->isBlock()) return false;
    if (_receiver->isLiteral()) return false;
    if (_receiver->isSelf()) return false;
    if (_receiver->isSuper()) return false;
    if (_receiver->isMethodArgument()) return false;
    if (!hasVolatileReceiver()) return false;
    
    bool allImmediateOrBlock = _receiver->isImmediate();
    if (allImmediateOrBlock) {
        for (auto arg : _arguments) {
            if (!arg || (!arg->isImmediate() && !arg->isBlock())) {
                allImmediateOrBlock = false;
                break;
            }
        }
    }
    if (allImmediateOrBlock) return false;
    
    if (_receiver->hasAssign()) return true;
    if (_receiver->isMessage()) return true;
    
    return hasVolatileArguments();
}

void SMessageNode::nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations) {
    SParseNode::nodesDo_(block, includeDeclarations);
    if (_receiver) _receiver->nodesDo_(block, includeDeclarations);
    for (auto arg : _arguments) {
        if (arg) arg->nodesDo_(block, includeDeclarations);
    }
    if (_selector) _selector->nodesDo_(block, includeDeclarations);
}

} // namespace Egg
