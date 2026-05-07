/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _STRING_NODE_H_
#define _STRING_NODE_H_

#include "SLiteralNode.h"

namespace Egg {

/**
 * String literal node
 * Corresponds to SStringNode in Smalltalk
 */
class SStringNode : public SLiteralNode {
public:
    SStringNode(SSmalltalkCompiler* compiler) : SLiteralNode(compiler) {}
    virtual ~SStringNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    bool isSStringNode() const { return true; }
};

} // namespace Egg

#endif // _STRING_NODE_H_
