/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _SEMANTIC_VISITOR_H_
#define _SEMANTIC_VISITOR_H_

#include "AST/SParseNodeVisitor.h"
#include "MessageInliner.h"
#include <functional>

namespace Egg {

class SIdentifierNode;
class SAssignmentNode;
class SMessageNode;
class SBlockNode;
class SMethodNode;
class SReturnNode;
class SScriptNode;
class SBraceNode;
class SCascadeNode;
class SCommentNode;

/**
 * Semantic visitor for analyzing and transforming the AST
 * Corresponds to SSemanticVisitor in Smalltalk
 */
class SemanticVisitor : public SParseNodeVisitor {
private:
    MessageInliner* _inliner;
    
    void analyzeAssignment_(SAssignmentNode* anAssignmentNode);
    void analyzeBlock_while_(SBlockNode* aBlockNode, std::function<void()> aBlock);
    void analyzeIdentifier_(SIdentifierNode* anIdentifierNode);
    void analyzeIdentifier_assignee_(SIdentifierNode* anIdentifierNode, bool aBoolean);
    void analyzeMessage_(SMessageNode* aMessageNode);
    void analyzeMethod_while_(SMethodNode* aMethodNode, std::function<void()> aBlock);
    void analyzeReturn_(SReturnNode* aReturnNode);
    void analyzeScript_while_(SScriptNode* aScriptNode, std::function<void()> aBlock);
    
public:
    SemanticVisitor();
    virtual ~SemanticVisitor();
    
    void visitIdentifier_(SIdentifierNode* node) override;
    void visitLiteral_(SLiteralNode* node) override;
    void visitMessage_(SMessageNode* node) override;
    void visitAssignment_(SAssignmentNode* node) override;
    void visitReturn_(SReturnNode* node) override;
    void visitMethod_(SMethodNode* node) override;
    void visitBlock_(SBlockNode* node) override;
    void visitCascade_(SCascadeNode* node) override;
    void visitBrace_(SBraceNode* node) override;
    void visitComment_(SCommentNode* node) override;
    void visitSelector_(SSelectorNode* node) override;
    void visitNumberNode_(SNumberNode* node) override;
    void visitString_(SStringNode* node) override;
    void visitPragma_(SPragmaNode* node) override;
    void visitPrimitivePragma_(SPragmaNode* node) override;
    void visitFFIPragma_(SPragmaNode* node) override;
    void visitSymbolicPragma_(SPragmaNode* node) override;
};

} // namespace Egg

#endif // _SEMANTIC_VISITOR_H_
