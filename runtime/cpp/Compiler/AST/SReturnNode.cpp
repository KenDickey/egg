/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SReturnNode.h"
#include "SParseNodeVisitor.h"

namespace Egg {

SReturnNode::SReturnNode(SSmalltalkCompiler* compiler) 
    : SParseNode(compiler), _expression(nullptr) {
}

void SReturnNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitReturn_(this);
}

void SReturnNode::nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations) {
    SParseNode::nodesDo_(block, includeDeclarations);
    if (_expression) _expression->nodesDo_(block, includeDeclarations);
}

} // namespace Egg
