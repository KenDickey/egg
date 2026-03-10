/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SAssignmentNode.h"
#include "SIdentifierNode.h"
#include "SParseNodeVisitor.h"

namespace Egg {

SAssignmentNode::SAssignmentNode(SSmalltalkCompiler* compiler) 
    : SParseNode(compiler), _expression(nullptr) {
    initialize();
}

void SAssignmentNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitAssignment_(this);
}

void SAssignmentNode::nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations) {
    SParseNode::nodesDo_(block, includeDeclarations);
    for (auto assignee : _assignees) {
        if (assignee) assignee->nodesDo_(block, includeDeclarations);
    }
    if (_expression) _expression->nodesDo_(block, includeDeclarations);
}

} // namespace Egg
