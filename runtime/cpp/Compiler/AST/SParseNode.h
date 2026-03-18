/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _PARSE_NODE_H_
#define _PARSE_NODE_H_

#include <string>
#include <vector>
#include <memory>
#include <functional>
#include "../Stretch.h"
#include "../Parser/SToken.h"

namespace Egg {

class SSmalltalkCompiler;
class Binding;
class Scope;
class SParseNodeVisitor;

/**
 * Base class for all parse tree nodes (AST nodes)
 * Corresponds to SParseNode in Smalltalk
 */
class SParseNode {
protected:
    Stretch _position;
    SSmalltalkCompiler* _compiler;
    std::vector<Egg::string> _comments;
    
public:
    SParseNode(SSmalltalkCompiler* compiler) : _compiler(compiler) {}
    virtual ~SParseNode() {}
    
    virtual void allNodesDo_includingDeclarations_(std::function<void(SParseNode*)> block);
    virtual SParseNode* nodesDetect_(std::function<bool(SParseNode*)> predicate, std::function<SParseNode*()> ifAbsent);
    virtual SParseNode* nodeWithLiteral_(const Egg::string& value);
    virtual SParseNode* variableNamed_(const Egg::string& name);
    virtual bool isMethodArgument() const;
    virtual bool isMethodTemporary() const;
    virtual bool valueEquals_(const Egg::string&) const;
    virtual bool nameEquals_(const Egg::string&) const;
    
    virtual SParseNode* ast();
    
    virtual void acceptVisitor_(SParseNodeVisitor* visitor) = 0;
    
    Stretch position() const { return _position; }
    void position_(const Stretch& pos) { _position = pos; }
    
    SSmalltalkCompiler* compiler() const { return _compiler; }
    
    void addComment_(const Egg::string& comment) {
        _comments.push_back(comment);
    }
    
    void moveCommentsFrom_(SParseNode* other) {
        if (other) {
            _comments.insert(_comments.end(), other->_comments.begin(), other->_comments.end());
            other->_comments.clear();
        }
    }
    
    void moveCommentsFrom_(SToken* token) {
        if (token) {
            const auto& tc = token->comments();
            _comments.insert(_comments.end(), tc.begin(), tc.end());
        }
    }
    
    virtual bool isAssignment() const { return false; }
    virtual bool isBlock() const { return false; }
    virtual bool isBrace() const { return false; }
    virtual bool isCascade() const { return false; }
    virtual bool isCascadeMessage() const { return false; }
    virtual bool isComment() const { return false; }
    virtual bool isIdentifier() const { return false; }
    virtual bool isLiteral() const { return false; }
    virtual bool isMessage() const { return false; }
    virtual bool isMethod() const { return false; }
    virtual bool isReturn() const { return false; }
    virtual bool isSelector() const { return false; }
    virtual bool isSelf() const { return false; }
    virtual bool isSuper() const { return false; }
    virtual bool isPragma() const { return false; }
    virtual bool isArray() const { return false; }
    
    virtual bool hasAssign() const { return false; }
    virtual bool isEvaluable() const { return false; }
    virtual bool isImmediate() const { return false; }
    
    virtual void nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations = false) {
        block(this);
    }
};

} // namespace Egg

#endif // _PARSE_NODE_H_
