/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SCascadeNode.h"
#include "SMessageNode.h"
#include "SParseNodeVisitor.h"

namespace Egg {

SCascadeNode::SCascadeNode(SSmalltalkCompiler* compiler) 
    : SParseNode(compiler), _receiver(nullptr) {
}

void SCascadeNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitCascade_(this);
}

bool SCascadeNode::hasAssign() const {
    if (_receiver && _receiver->hasAssign()) return true;
    for (auto msg : _messages) {
        if (msg && msg->hasAssign()) return true;
    }
    return false;
}

void SCascadeNode::nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations) {
    SParseNode::nodesDo_(block, includeDeclarations);
    if (_receiver) _receiver->nodesDo_(block, includeDeclarations);
    for (auto msg : _messages) {
        if (msg) msg->nodesDo_(block, includeDeclarations);
    }
}

} // namespace Egg
