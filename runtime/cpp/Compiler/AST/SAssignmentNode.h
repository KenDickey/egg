/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _ASSIGNMENT_NODE_H_
#define _ASSIGNMENT_NODE_H_

#include "SParseNode.h"
#include <vector>
#include <functional>

namespace Egg {

class SIdentifierNode;

/**
 * Assignment node
 * Corresponds to SAssignmentNode in Smalltalk
 */
class SAssignmentNode : public SParseNode {
private:
    std::vector<SIdentifierNode*> _assignees;
    std::vector<void*> _operators; // Placeholder for SDelimiterToken or similar
    SParseNode* _expression;
    
public:
    SAssignmentNode(SSmalltalkCompiler* compiler);
    virtual ~SAssignmentNode() {}

    void acceptVisitor_(SParseNodeVisitor* visitor) override;

    void assign_operator_(SIdentifierNode* anIdentifierNode, void* aSDelimiterToken) {
        _assignees.push_back(anIdentifierNode);
        _operators.push_back(aSDelimiterToken);
    }
    void assign_with_operator_(SIdentifierNode* anIdentifierNode, SParseNode* aParseNode, void* aSDelimiterToken) {
        _assignees.push_back(anIdentifierNode);
        _operators.push_back(aSDelimiterToken);
        _expression = aParseNode;
    }

    const std::vector<SIdentifierNode*>& assignees() const { return _assignees; }
    const std::vector<void*>& operators() const { return _operators; }
    SParseNode* expression() const { return _expression; }
    void expression_(SParseNode* expr) { _expression = expr; }

    bool isAssignment() const override { return true; }
    bool hasAssign() const override { return true; }

    void nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations = false) override;

    void initialize() {
        _assignees.clear();
        _operators.clear();
    }
};

} // namespace Egg

#endif // _ASSIGNMENT_NODE_H_
