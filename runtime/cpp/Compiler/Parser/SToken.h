/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _COMPILER_TOKEN_H_
#define _COMPILER_TOKEN_H_

#include <string>
#include <memory>
#include <vector>
#include "../Stretch.h"
#include "../Object.h"
#include "../egg_string.h"

namespace Egg {

class SSmalltalkCompiler;
class SToken;

class SToken {
protected:
    SSmalltalkCompiler* _compiler;
    Stretch _stretch;
    std::vector<egg::string> _comments;
    
public:
    SToken() : _compiler(nullptr) {}
    SToken(const Stretch& pos) : _compiler(nullptr), _stretch(pos) {}
    virtual ~SToken() {}
    
    SSmalltalkCompiler* compiler() const { return _compiler; }
    void compiler_(SSmalltalkCompiler* comp) { _compiler = comp; }
    
    Stretch position() const { return _stretch; }
    void position_(const Stretch& pos) { _stretch = pos; }
    Stretch stretch() const { return _stretch; }
    void stretch_(const Stretch& pos) { _stretch = pos; }
    
    virtual egg::string value() const { return ""; }
    virtual void value_(const egg::string& val) {}
    
    void addComment_(const egg::string& comment) {
        _comments.push_back(comment);
    }
    
    const std::vector<egg::string>& comments() const { return _comments; }
    
    void moveCommentsFrom_(SToken* other) {
        if (other) {
            _comments.insert(_comments.end(), other->_comments.begin(), other->_comments.end());
            other->_comments.clear();
        }
    }
    
    virtual bool isEnd() const { return false; }
    virtual bool isLiteral() const { return false; }
    virtual bool isName() const { return false; }
    virtual bool isKeyword() const { return false; }
    virtual bool isSymbolic() const { return false; }
    virtual bool isString() const { return false; }
    virtual bool isDelimiter() const { return false; }
    virtual bool isComment() const { return false; }
    virtual bool isBar() const { return false; }
    virtual bool isAssignment() const { return false; }
    
    virtual bool is_(char ch) const { return false; }
    bool is(char ch) const { return is_(ch); }
    
    virtual bool is_(const egg::string& str) const { return false; }
    bool is(const egg::string& str) const { return is_(str); }
    
    virtual bool endsExpression() const {
        return isEnd() || is_(']') || is_(')') || is_('}') || is_('.');
    }
    
    virtual bool hasSymbol() const { return false; }
    
    virtual Object* literalValue() const { return nullptr; }
};

class SEndToken : public SToken {
public:
    SEndToken(const Stretch& pos) : SToken(pos) {}
    bool isEnd() const override { return true; }
};

class SSymbolicToken : public SToken {
protected:
    egg::string _value;
    bool _isSymbol;
    
public:
    SSymbolicToken(const Stretch& pos, const egg::string& val, bool isSymbol = false) 
        : SToken(pos), _value(val), _isSymbol(isSymbol) {}
    
    egg::string value() const override { return _value; }
    void value_(const egg::string& val) override { _value = val; }
    
    void beSymbol_() { _isSymbol = true; }
    bool isSymbol() const { return _isSymbol; }
    
    bool isSymbolic() const override { return true; }
    bool isKeyword() const override { 
        return !_value.empty() && _value.back() == ':'; 
    }
    bool isBinary() const { return _isSymbol; }
    bool isName() const override { return !isKeyword() && !isBinary(); }
    bool hasSymbol() const override { return _isSymbol; }
    
    bool is_(char ch) const override {
        return _value.length() == 1 && _value[0] == (char32_t)ch;
    }
    
    bool is_(const egg::string& str) const override {
        return _value == str;
    }
    
    bool isBar() const override { return _value == "|"; }
    bool isAssignment() const override { return _value == ":="; }
};

class SDelimiterToken : public SSymbolicToken {
public:
    SDelimiterToken(const Stretch& pos, const egg::string& val) 
        : SSymbolicToken(pos, val, false) {}
    bool isDelimiter() const override { return true; }
    bool isSymbolic() const override { return false; }
    bool isName() const override { return false; }
};

class SStringToken : public SSymbolicToken {
public:
    enum LiteralKind { LitString, LitSymbol, LitNumber, LitCharacter };
    
    SStringToken(const Stretch& pos, const egg::string& val, LiteralKind kind = LitString) 
        : SSymbolicToken(pos, val, false), _kind(kind) {}
    bool isLiteral() const override { return true; }
    bool isString() const override { return true; }
    bool isSymbolic() const override { return false; }
    bool isName() const override { return false; }
    
    // Literal tokens should never match delimiter checks like is_('.')
    bool is_(char ch) const override { return false; }
    bool is_(const egg::string& str) const override { return false; }
    
    LiteralKind literalKind() const { return _kind; }
    void literalKind_(LiteralKind k) { _kind = k; }
private:
    LiteralKind _kind;
};

} // namespace Egg

#endif // _COMPILER_TOKEN_H_
