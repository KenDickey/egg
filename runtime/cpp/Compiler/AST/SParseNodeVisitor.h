/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _PARSE_NODE_VISITOR_H_
#define _PARSE_NODE_VISITOR_H_

namespace Egg {

class SIdentifierNode;
class SLiteralNode;
class SMessageNode;
class SAssignmentNode;
class SReturnNode;
class SMethodNode;
class SBlockNode;
class SCascadeNode;
class SBraceNode;
class SSelectorNode;
class SNumberNode;
class SStringNode;
class SPragmaNode;
class SCommentNode;

/**
 * Visitor interface for parse tree traversal
 */
class SParseNodeVisitor {
public:
    virtual ~SParseNodeVisitor() {}

    virtual void visitIdentifier_(SIdentifierNode* node) = 0;
    virtual void visitLiteral_(SLiteralNode* node) = 0;
    virtual void visitMessage_(SMessageNode* node) = 0;
    virtual void visitAssignment_(SAssignmentNode* node) = 0;
    virtual void visitReturn_(SReturnNode* node) = 0;
    virtual void visitMethod_(SMethodNode* node) = 0;
    virtual void visitBlock_(SBlockNode* node) = 0;
    virtual void visitCascade_(SCascadeNode* node) = 0;
    virtual void visitBrace_(SBraceNode* node) = 0;
    virtual void visitComment_(SCommentNode* node) = 0;
    virtual void visitSelector_(SSelectorNode* node) = 0;
    virtual void visitNumberNode_(SNumberNode* node) = 0;
    virtual void visitString_(SStringNode* node) = 0;
    virtual void visitPragma_(SPragmaNode* node) = 0;
    virtual void visitPrimitivePragma_(SPragmaNode* node) = 0;
    virtual void visitFFIPragma_(SPragmaNode* node) = 0;
    virtual void visitSymbolicPragma_(SPragmaNode* node) = 0;
};

} // namespace Egg

#endif // _PARSE_NODE_VISITOR_H_
