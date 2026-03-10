/*
    Copyright (c) 2025, Javier Pimás.
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
    
    void negate_() {
        const auto& lv = literalValue();
        if (lv.isInteger()) {
            literalValue_(LiteralValue::fromInteger(-lv.asInteger()));
        } else if (lv.isFloat()) {
            literalValue_(LiteralValue::fromFloat(-lv.asFloat()));
        } else {
            // Legacy fallback
            egg::string val = value();
            if (!val.empty() && val[0] != '-') {
                value_("-" + val);
            } else if (!val.empty() && val[0] == '-') {
                value_(val.substr(1));
            }
        }
    }
};

} // namespace Egg

#endif // _NUMBER_NODE_H_
