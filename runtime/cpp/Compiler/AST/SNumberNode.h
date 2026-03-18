/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _NUMBER_NODE_H_
#define _NUMBER_NODE_H_

#include "SLiteralNode.h"

namespace Egg {

/**
 * Number literal node
 * Corresponds to SNumberNode in Smalltalk
 */
class SNumberNode : public SLiteralNode {
public:
    SNumberNode(SSmalltalkCompiler* compiler) : SLiteralNode(compiler) {}
    virtual ~SNumberNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    bool isSNumberNode() const { return true; }
};

} // namespace Egg

#endif // _NUMBER_NODE_H_
