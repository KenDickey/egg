/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _SCRIPT_NODE_H_
#define _SCRIPT_NODE_H_

#include "SParseNode.h"
#include <vector>
#include <functional>

namespace Egg {

class SIdentifierNode;
class ScriptScope;

/**
 * Base class for scripts (methods and blocks)
 * Corresponds to SScriptNode in Smalltalk
 */
class SScriptNode : public SParseNode {
protected:
    std::vector<SParseNode*> _statements;
    std::vector<SIdentifierNode*> _arguments;
    std::vector<SIdentifierNode*> _temporaries;
    std::vector<SScriptNode*> _children; // nested blocks
    ScriptScope* _scope;
    
public:
    SScriptNode(SSmalltalkCompiler* compiler);
    virtual ~SScriptNode() {}
    
    const std::vector<SParseNode*>& statements() const { return _statements; }
    void addStatement_(SParseNode* stmt) { _statements.push_back(stmt); }
    void statements_(const std::vector<SParseNode*>& stmts) { _statements = stmts; }
    
    const std::vector<SIdentifierNode*>& arguments() const { return _arguments; }
    void arguments_(const std::vector<SIdentifierNode*>& args) { _arguments = args; }
    
    const std::vector<SIdentifierNode*>& temporaries() const { return _temporaries; }
    void temporaries_(const std::vector<SIdentifierNode*>& temps) { _temporaries = temps; }
    
    const std::vector<SScriptNode*>& children() const { return _children; }
    void addChild_(SScriptNode* child) { _children.push_back(child); }
    
    ScriptScope* scope() const { return _scope; }
    void scope_(ScriptScope* s) { _scope = s; }
    
    virtual SScriptNode* realScript() = 0;
    virtual void captureHome() = 0;
    
    void reference_(Binding* aBinding);
    void useSelf_();
    void bindLocals();
    void positionLocals();
    
    bool hasAssign() const override;
    
    void nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations = false) override;
};

} // namespace Egg

#endif // _SCRIPT_NODE_H_
