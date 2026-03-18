/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _LITERAL_NODE_H_
#define _LITERAL_NODE_H_

#include "SParseNode.h"
#include "../LiteralValue.h"
#include <string>

namespace Egg {

/**
 * Literal node (number, string, symbol, etc.)
 * Corresponds to SLiteralNode in Smalltalk
 */
class SLiteralNode : public SParseNode {
private:
    LiteralValue _litValue;
    
public:
    SLiteralNode(SSmalltalkCompiler* compiler);
    virtual ~SLiteralNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    // Typed literal value
    const LiteralValue& literalValue() const { return _litValue; }
    void literalValue_(const LiteralValue& v) { _litValue = v; }
    void literalValue_(LiteralValue&& v) { _litValue = std::move(v); }
    
    // Backwards‑compatible string accessors
    Egg::string value() const { return _litValue.printString(); }
    void value_(const LiteralValue& v) { _litValue = v; }
    
    void beSymbol_() { _litValue.tag = LiteralValue::Symbol; }
    bool hasSymbol() const { return _litValue.isSymbol(); }
    
    bool isLiteral() const override { return true; }
    bool isEvaluable() const override { return true; }
    bool isImmediate() const override { return true; }
};

} // namespace Egg

#endif // _LITERAL_NODE_H_
