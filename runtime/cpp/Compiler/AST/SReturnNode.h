/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _RETURN_NODE_H_
#define _RETURN_NODE_H_

#include "SParseNode.h"
#include <functional>

namespace Egg {

/**
 * Return statement node
 * Corresponds to SReturnNode in Smalltalk
 */
class SReturnNode : public SParseNode {
private:
    SParseNode* _expression;
    
public:
    SReturnNode(SSmalltalkCompiler* compiler);
    virtual ~SReturnNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    SParseNode* expression() const { return _expression; }
    void expression_(SParseNode* expr) { _expression = expr; }
    
    bool isReturn() const override { return true; }
    
    void nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations = false) override;
};

} // namespace Egg

#endif // _RETURN_NODE_H_
