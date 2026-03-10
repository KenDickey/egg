/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _BRACE_NODE_H_
#define _BRACE_NODE_H_

#include "SParseNode.h"
#include <vector>
#include <functional>

namespace Egg {

/**
 * Brace node ({expr1. expr2})
 * Corresponds to SBraceNode in Smalltalk
 */
class SMessageNode;
class SCascadeNode;
class SIdentifierNode;
class SSelectorNode;
class SNumberNode;
class SCascadeMessageNode;

class SBraceNode : public SParseNode {
private:
    std::vector<SParseNode*> _elements;
    SParseNode* _message;
    
public:
    SBraceNode(SSmalltalkCompiler* compiler);
    virtual ~SBraceNode() {}

    void acceptVisitor_(SParseNodeVisitor* visitor) override;

    std::vector<SParseNode*>& elements() { return _elements; }
    const std::vector<SParseNode*>& elements() const { return _elements; }
    void elements_(const std::vector<SParseNode*>& elems) { _elements = elems; }
    void addElement_(SParseNode* elem);
    
    SParseNode* message() { return _message; }
    void message_(SParseNode* msg) { _message = msg; }
    
    SParseNode* asSMessageNode();
    SParseNode* expanded();

    bool isBrace() const override { return true; }
    bool isEvaluable() const override;

    void nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations = false) override;
};

} // namespace Egg

#endif // _BRACE_NODE_H_
