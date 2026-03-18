/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _IDENTIFIER_NODE_H_
#define _IDENTIFIER_NODE_H_

#include "SParseNode.h"
#include <string>

namespace Egg {

class Binding;

/**
 * Identifier node (variable reference)
 * Corresponds to SIdentifierNode in Smalltalk
 */
class SIdentifierNode : public SParseNode {
private:
    Egg::string _name;
    Binding* _binding;
    bool _assigned = false;
    
public:
    SIdentifierNode(SSmalltalkCompiler* compiler);
    virtual ~SIdentifierNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    Egg::string name() const { return _name; }
    void name_(const Egg::string& n) { _name = n; }
    
    Binding* binding() const { return _binding; }
    void binding_(Binding* b) { _binding = b; }
    
    bool isIdentifier() const override { return true; }
    bool isImmediate() const override { return true; }
    bool isEvaluable() const override;
    bool isLocal() const;
    bool isSelf() const override;
    bool isSuper() const override;
    
    bool isIdentifierLiteral() const;
    bool isMethodArgument() const override;
    bool isMethodTemporary() const override;
    
    Binding* resolveAssigning_(bool aBoolean);
    void beAssigned();
    void checkLowercase();
    void defineArgumentIn_(Scope* scope);
    void defineTemporaryIn_(Scope* scope);
};

} // namespace Egg

#endif // _IDENTIFIER_NODE_H_
