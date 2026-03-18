/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SSmalltalkParser.h"
#include "../SSmalltalkCompiler.h"
#include "../LiteralValue.h"
#include "SSmalltalkScanner.h"
#include <stdexcept>
#include <sstream>
#include <iostream>
#include <cstdlib>

namespace Egg {

SSmalltalkParser::SSmalltalkParser(SSmalltalkCompiler* compiler) 
    : _compiler(compiler), _scanner(compiler->scanner()) {
}

SSmalltalkParser::~SSmalltalkParser() {
}

SMethodNode* SSmalltalkParser::parseMethod_() {
    return method_();
}

SMethodNode* SSmalltalkParser::parseExpression_() {
    return headlessMethod_();
}

SToken* SSmalltalkParser::next_() {
    if (_next) {
        _token = std::move(_next);
        _next.reset();
    } else {
        _token.reset(_scanner->nextToken().release());
    }
    return _token.get();
}

SToken* SSmalltalkParser::peek_() {
    if (_next) {
        return _next.get();
    }
    
    _next.reset(_scanner->nextToken().release());
    std::vector<Egg::string> comments;
    while (_next && _next->isComment()) {
        comments.push_back(_next->value());
        _next.reset(_scanner->nextToken().release());
    }
    
    if (_next && !comments.empty()) {
        for (auto& comment : comments) {
            _next->addComment_(comment);
        }
    }
    
    return _next.get();
}

SToken* SSmalltalkParser::step_() {
    SToken* save = _token.get();
    next_();
    std::vector<Egg::string> comments;
    while (_token && _token->isComment()) {
        comments.push_back(_token->value());
        next_();
    }
    
    if (_token && !comments.empty()) {
        for (auto& comment : comments) {
            _token->addComment_(comment);
        }
    }
    
    return save;
}

void SSmalltalkParser::skipDots_() {
    while (_token && _token->is('.')) step_();
}

void SSmalltalkParser::error_(const std::string& message) {
    error_(message, _token ? _token->position().start() : 0);
}

void SSmalltalkParser::error_(const std::string& message, uint32_t position) {
    std::stringstream ss;
    ss << "Parse error at position " << position << ": " << message;
    throw std::runtime_error(ss.str());
}

void SSmalltalkParser::missingToken_(const std::string& expected) {
    error_("missing " + expected);
}

void SSmalltalkParser::missingExpression_() {
    error_("missing expression");
}

void SSmalltalkParser::missingArgument_() {
    error_("argument missing");
}

SMethodNode* SSmalltalkParser::method_() {
    step_();
    SMethodNode* method = methodSignature_();
    if (!method) {
        return nullptr;
    }
    addBodyTo_(method);
    return method;
}

SMethodNode* SSmalltalkParser::headlessMethod_() {
    step_();
    SMethodNode* method = new SMethodNode(_compiler);
    _compiler->activeScript_(method);
    addBodyTo_(method);
    return method;
}

SMethodNode* SSmalltalkParser::methodSignature_() {
    SMethodNode* method = keywordSignature_();
    if (method) return method;
    
    method = binarySignature_();
    if (method) return method;
    
    method = unarySignature_();
    if (method) return method;
    
    error_("method signature expected");
    return nullptr;
}

SMethodNode* SSmalltalkParser::unarySignature_() {
    if (!hasUnarySelector_()) {
        return nullptr;
    }
    
    SSelectorNode* selectorNode = new SSelectorNode(_compiler);
    selectorNode->symbol_(_token->value());
    selectorNode->position_(_token->position());
    
    step_();
    
    std::vector<SIdentifierNode*> emptyArgs;
    return buildMethodNode_(selectorNode, emptyArgs);
}

SMethodNode* SSmalltalkParser::binarySignature_() {
    if (!hasBinarySelector_()) {
        return nullptr;
    }
    SSelectorNode* selectorNode = new SSelectorNode(_compiler);
    selectorNode->symbol_(_token->value());
    selectorNode->position_(_token->position());
    
    step_();
    
    if (!_token || !_token->isName()) {
        missingArgument_();
    }
    
    SIdentifierNode* arg = new SIdentifierNode(_compiler);
    arg->name_(_token->value());
    arg->position_(_token->position());
    
    step_();
    
    std::vector<SIdentifierNode*> args;
    args.push_back(arg);
    
    return buildMethodNode_(selectorNode, args);
}

SMethodNode* SSmalltalkParser::keywordSignature_() {
    if (!hasKeywordSelector_()) {
        return nullptr;
    }
    
    Egg::string selector;
    std::vector<SIdentifierNode*> arguments;
    uint32_t start = _token->position().start();
    
    while (_token && _token->isKeyword()) {
        selector += _token->value();
        step_();
        
        if (!_token || !_token->isName()) {
            missingArgument_();
        }
        
        SIdentifierNode* arg = new SIdentifierNode(_compiler);
        arg->name_(_token->value());
        arg->position_(_token->position());
        arguments.push_back(arg);
        
        step_();
    }
    
    if (arguments.empty()) {
        return nullptr;
    }
    SSelectorNode* selectorNode = new SSelectorNode(_compiler);
    selectorNode->symbol_(selector);
    selectorNode->position_(Stretch(start, _token->position().start() - 1));
    
    return buildMethodNode_(selectorNode, arguments);
}

void SSmalltalkParser::addBodyTo_(SMethodNode* method) {
    addTemporariesTo_(method);
    addPragmaTo_(method);
    addStatementsTo_(method);
}

void SSmalltalkParser::addTemporariesTo_(SMethodNode* method) {
    method->temporaries_(temporaries_());
}

void SSmalltalkParser::addStatementsTo_(SMethodNode* method) {
    method->position_(_token->position());
    auto stmts = statements_();
    for (auto stmt : stmts) method->addStatement_(stmt);
    method->position_(Stretch(method->position().start(), _token->position().start()));
    if (_token && !_token->isEnd()) {
        error_("unexpected statement", _token->position().start());
    }
}

std::vector<SIdentifierNode*> SSmalltalkParser::temporaries_() {
    std::vector<SIdentifierNode*> temps;
    if (!_token) return temps;
    if (_token->is("||")) {
        step_();
        return temps;
    }
    if (!_token->isBar()) {
        return temps;
    }
    while (true) {
        step_();
        if (!_token || !_token->isName()) break;
        SIdentifierNode* temp = new SIdentifierNode(_compiler);
        temp->name_(_token->value());
        temp->position_(_token->position());
        temps.push_back(temp);
    }
    if (!_token || !_token->isBar()) {
        missingToken_("|");
    }
    step_();
    
    return temps;
}

std::vector<SParseNode*> SSmalltalkParser::statements_() {
    std::vector<SParseNode*> stmts;
    while (_token && !_token->endsExpression()) {
        stmts.push_back(statement_());
        if (_token && _token->is('.')) skipDots_(); else break;
    }
    return stmts;
}

SParseNode* SSmalltalkParser::statement_() {
    if (_token && _token->is('^')) return return_();
    SParseNode* expr = expression_();
    return expr;
}

SReturnNode* SSmalltalkParser::return_() {
    uint32_t returnPos = _token->position().start();
    step_();
    auto expr = expression_();
    if (!expr) missingExpression_();
    uint32_t end = _token->position().start();
    skipDots_();
    auto node = buildNode_<SReturnNode>(returnPos);
    node->expression_(expr);
    node->position_(Stretch(returnPos, end));
    return node;
}

SParseNode* SSmalltalkParser::expression_() {
    if (_token && _token->isName() && peek_() && peek_()->isAssignment()) {
        return assignment_();
    }
    
    SParseNode* prim = primary_();
    if (!prim) {
        missingExpression_();
    }
    
    SParseNode* expr = unarySequence_(prim);
    expr = binarySequence_(expr);
    expr = keywordSequence_(expr);
    if (expr != prim && expr->isMessage()) {
        expr = cascadeSequence_(static_cast<SMessageNode*>(expr));
    }
    
    if (_token && !_token->endsExpression()) {
        std::string desc = _token->isEnd()
            ? "unexpected end"
            : "unexpected token: " + _token->value().toUtf8();
        error_(desc, _token->position().start());
    }
    
    return expr;
}

SAssignmentNode* SSmalltalkParser::assignment_() {
    uint32_t position = _token->position().start();
    auto variable = new SIdentifierNode(_compiler);
    variable->name_(_token->value());
    variable->position_(_token->position());
    step_(); step_();
    auto expr = expression_();
    if (!expr) missingExpression_();
    auto assignment = buildNode_<SAssignmentNode>(position);
    assignment->assign_operator_(variable, nullptr);
    assignment->expression_(expr);
    return assignment;
}

SParseNode* SSmalltalkParser::primary_() {
    if (!_token) return nullptr;
    if (_token->isName()) {
        SIdentifierNode* id = new SIdentifierNode(_compiler);
        id->name_(_token->value());
        id->position_(_token->position());
        step_();
        return id;
    }
    if (_token->isLiteral()) {
        SLiteralNode* lit = new SLiteralNode(_compiler);
        auto* strTok = static_cast<SStringToken*>(_token.get());
        switch (strTok->literalKind()) {
            case SStringToken::LitNumber: {
                std::string v = _token->value().toUtf8();
                if (v.find('.') != std::string::npos || v.find('e') != std::string::npos || v.find('E') != std::string::npos) {
                    lit->literalValue_(LiteralValue::fromFloat(std::stod(v)));
                } else {
                    lit->literalValue_(LiteralValue::fromInteger(std::stoll(v, nullptr, 0)));
                }
                break;
            }
            case SStringToken::LitCharacter:
                lit->literalValue_(LiteralValue::fromCharacter(_token->value()[0]));
                break;
            case SStringToken::LitSymbol:
                lit->literalValue_(LiteralValue::fromSymbol(_token->value()));
                break;
            case SStringToken::LitString:
            default:
                lit->literalValue_(LiteralValue::fromString(_token->value()));
                break;
        }
        lit->position_(_token->position());
        step_();
        return lit;
    }
    if (_token->is('[')) return block_();
    if (_token->is('(')) return parenthesizedExpression_();
    if (_token->is("#(")) return literalArray_();
    if (_token->is("#[")) return literalByteArray_();
    if (_token->is('{')) return bracedArray_();
    if (_token->is('-')) {
        auto peekToken = peek_();
        if (peekToken && peekToken->isLiteral()) {
            step_();
            SLiteralNode* lit = new SLiteralNode(_compiler);
            auto* strTok = static_cast<SStringToken*>(_token.get());
            std::string v = _token->value().toUtf8();
            if (strTok->literalKind() == SStringToken::LitNumber) {
                if (v.find('.') != std::string::npos || v.find('e') != std::string::npos || v.find('E') != std::string::npos) {
                    lit->literalValue_(LiteralValue::fromFloat(-std::stod(v)));
                } else {
                    lit->literalValue_(LiteralValue::fromInteger(-std::stoll(v, nullptr, 0)));
                }
            } else {
                lit->literalValue_(LiteralValue::fromString("-" + _token->value()));
            }
            lit->position_(Stretch(_token->position().start() - 1, _token->position().end()));
            step_();
            return lit;
        }
        return nullptr;
    }
    return nullptr;
}

SBlockNode* SSmalltalkParser::block_() {
    uint32_t position = _token->position().start();
    SBlockNode* block = new SBlockNode(_compiler);
    block->position_(Stretch(position, _token->position().start()));
    block->parent_(_compiler->activeScript());
    _compiler->activate_while_(block, [&]() {
        step_();
        block->arguments_(blockArguments_());
        block->temporaries_(temporaries_());
        auto stmts = statements_();
        for (auto stmt : stmts) block->addStatement_(stmt);
        if (!_token || !_token->is(']')) {
            missingToken_("]");
        }
        block->position_(Stretch(position, _token->position().end()));
        step_();
    });
    return block;
}

std::vector<SIdentifierNode*> SSmalltalkParser::blockArguments_() {
    std::vector<SIdentifierNode*> args;
    
    if (!_token || !_token->is(':')) {
        return args;
    }
    
    while (_token && _token->is(':')) {
        step_();
        
        if (!_token || !_token->isName()) {
            missingArgument_();
        }
        
        SIdentifierNode* arg = new SIdentifierNode(_compiler);
        arg->name_(_token->value());
        arg->position_(_token->position());
        args.push_back(arg);
        
        step_();
    }
    if (_token && _token->isBar()) {
        step_();
    } else if (_token && _token->is("||")) {
        step_(); // consume || as closing | for args + empty temps
    } else {
        missingToken_("|");
    }
    
    return args;
}

SParseNode* SSmalltalkParser::parenthesizedExpression_() {
    uint32_t start = _token->position().start();
    step_();
    auto expr = expression_();
    if (!expr) missingExpression_();
    if (!_token || !_token->is(')')) missingToken_(")");
    uint32_t end = _token->position().end();
    step_();
    if (!expr->isImmediate()) expr->position_(Stretch(start, end));
    return expr;
}

SParseNode* SSmalltalkParser::unarySequence_(SParseNode* receiver) {
    auto node = receiver;
    while (hasUnarySelector_()) {
        auto msg = buildMessageNode_(node);
        unaryMessage_(msg);
        node = msg;
    }
    return node;
}

void SSmalltalkParser::unaryMessage_(SMessageNode* message) {
    auto selectorNode = new SSelectorNode(_compiler);
    selectorNode->symbol_(_token->value());
    selectorNode->position_(_token->position());
    step_();
    message->selector_(selectorNode);
    message->position_(Stretch(message->position().start(), selectorNode->position().end()));
}

SParseNode* SSmalltalkParser::binarySequence_(SParseNode* receiver) {
    auto node = receiver;
    while (hasBinarySelector_()) {
        auto msg = buildMessageNode_(node);
        binaryMessage_(msg);
        node = msg;
    }
    return node;
}

void SSmalltalkParser::binaryMessage_(SMessageNode* message) {
    auto selectorNode = new SSelectorNode(_compiler);
    selectorNode->symbol_(_token->value());
    selectorNode->position_(_token->position());
    step_();
    auto prim = primary_();
    if (!prim) error_("primary missing");
    auto arg = unarySequence_(prim);
    message->selector_(selectorNode);
    message->addArgument_(arg);
    message->position_(Stretch(message->position().start(), arg->position().end()));
}

SParseNode* SSmalltalkParser::keywordSequence_(SParseNode* receiver) {
    if (!hasKeywordSelector_()) return receiver;
    auto message = buildMessageNode_(receiver);
    keywordMessage_(message);
    return message;
}

void SSmalltalkParser::keywordMessage_(SMessageNode* message) {
    Egg::string selector;
    std::vector<SParseNode*> arguments;
    uint32_t start = _token->position().start();
    while (_token && _token->isKeyword()) {
        selector += _token->value();
        step_();
        auto prim = primary_();
        if (!prim) missingArgument_();
        auto arg = unarySequence_(prim);
        arg = binarySequence_(arg);
        arguments.push_back(arg);
    }
    auto selectorNode = new SSelectorNode(_compiler);
    selectorNode->symbol_(selector);
    selectorNode->position_(Stretch(start, _token->position().start() - 1));
    message->selector_(selectorNode);
    message->arguments_(arguments);
    if (!arguments.empty()) message->position_(Stretch(message->position().start(), arguments.back()->position().end()));
}

SParseNode* SSmalltalkParser::cascadeSequence_(SMessageNode* messageNode) {
    if (!_token || !_token->is(';')) return messageNode;
    auto cascade = new SCascadeNode(_compiler);
    cascade->position_(messageNode->position());
    auto receiver = messageNode->receiver();
    cascade->receiver_(receiver);
    auto firstMsg = new SCascadeMessageNode(_compiler);
    firstMsg->receiver_(receiver);
    firstMsg->selector_(messageNode->selector());
    firstMsg->arguments_(messageNode->arguments());
    firstMsg->position_(messageNode->position());
    firstMsg->cascade_(cascade);
    cascade->addMessage_(firstMsg);
    while (_token && _token->is(';')) {
        step_();
        auto msg = buildCascadeMessageNode_(receiver);
        msg->cascade_(cascade);
        msg->position_(_token->position());
        cascadeMessage_(msg);
        cascade->addMessage_(msg);
    }
    const auto& messages = cascade->messages();
    if (!messages.empty()) cascade->position_(Stretch(cascade->position().start(), messages.back()->position().end()));
    return cascade;
}

void SSmalltalkParser::cascadeMessage_(SMessageNode* message) {
    if (hasUnarySelector_()) unaryMessage_(message);
    else if (hasBinarySelector_()) binaryMessage_(message);
    else if (hasKeywordSelector_()) keywordMessage_(message);
    else error_("invalid cascade message");
}

bool SSmalltalkParser::hasUnarySelector_() const {
    return _token && _token->isName();
}

bool SSmalltalkParser::hasBinarySelector_() const {
    if (!_token) return false;
    // ST: (token isStringToken and: [token hasSymbol]) or: [token is: $^] or: [token is: $:]
    if (_token->isSymbolic() && _token->hasSymbol()) return true;
    if (_token->is('^')) return true;
    if (_token->is(':')) return true;
    return false;
}

bool SSmalltalkParser::hasKeywordSelector_() const {
    return _token && _token->isKeyword();
}

SParseNode* SSmalltalkParser::literalArray_() {
    uint32_t position = _token->position().start();
    step_();
    std::vector<LiteralValue> elements;
    while (_token && !_token->is(')') && !_token->isEnd()) {
        if (_token->isLiteral()) {
            auto* strTok = static_cast<SStringToken*>(_token.get());
            switch (strTok->literalKind()) {
                case SStringToken::LitNumber: {
                    std::string v = _token->value().toUtf8();
                    if (v.find('.') != std::string::npos) {
                        elements.push_back(LiteralValue::fromFloat(std::stod(v)));
                    } else {
                        elements.push_back(LiteralValue::fromInteger(std::stoll(v, nullptr, 0)));
                    }
                    break;
                }
                case SStringToken::LitCharacter:
                    elements.push_back(LiteralValue::fromCharacter(_token->value()[0]));
                    break;
                case SStringToken::LitSymbol:
                    elements.push_back(LiteralValue::fromSymbol(_token->value()));
                    break;
                case SStringToken::LitString:
                default:
                    elements.push_back(LiteralValue::fromString(_token->value()));
                    break;
            }
        } else if (_token->isName()) {
            // pseudoLiteralValue: convert nil/true/false to actual values
            Egg::string val = _token->value();
            if (val == "nil") {
                elements.push_back(LiteralValue::nil());
            } else if (val == "true") {
                elements.push_back(LiteralValue::fromBoolean(true));
            } else if (val == "false") {
                elements.push_back(LiteralValue::fromBoolean(false));
            } else {
                elements.push_back(LiteralValue::fromSymbol(val));
            }
        } else if (_token->isKeyword()) {
            // literalKeyword: collect multi-part keyword symbol (e.g., at:put:)
            Egg::string keyword = _token->value();
            step_();
            while (_token && _token->isKeyword()) {
                keyword += _token->value();
                step_();
            }
            elements.push_back(LiteralValue::fromSymbol(keyword));
            continue; // already stepped past last keyword
        } else if (_token->hasSymbol()) {
            elements.push_back(LiteralValue::fromSymbol(_token->value()));
        } else if (_token->is('-')) {
            // negative number in literal array
            step_();
            if (_token && _token->isLiteral()) {
                auto* strTok = static_cast<SStringToken*>(_token.get());
                if (strTok->literalKind() == SStringToken::LitNumber) {
                    std::string v = _token->value().toUtf8();
                    if (v.find('.') != std::string::npos) {
                        elements.push_back(LiteralValue::fromFloat(-std::stod(v)));
                    } else {
                        elements.push_back(LiteralValue::fromInteger(-std::stoll(v, nullptr, 0)));
                    }
                } else {
                    elements.push_back(LiteralValue::fromSymbol("-"));
                    continue; // don't step, re-process current token
                }
            } else {
                elements.push_back(LiteralValue::fromSymbol("-"));
                continue; // don't step, re-process current token
            }
        } else if (_token->is('(')) {
            // nested literal array (without #)
            auto* nested = static_cast<SLiteralNode*>(literalArray_());
            elements.push_back(nested->literalValue());
            continue;
        } else if (_token->is("#(")) {
            auto* nested = static_cast<SLiteralNode*>(literalArray_());
            elements.push_back(nested->literalValue());
            continue;
        } else if (_token->is("#[")) {
            auto* nested = static_cast<SLiteralNode*>(literalByteArray_());
            elements.push_back(nested->literalValue());
            continue;
        } else {
            error_("invalid literal entry");
        }
        step_();
    }
    if (!_token || !_token->is(')')) {
        missingToken_(")");
    }
    auto lit = new SLiteralNode(_compiler);
    lit->literalValue_(LiteralValue::fromArray(std::move(elements)));
    lit->position_(Stretch(position, _token->position().end()));
    step_();
    return lit;
}

SParseNode* SSmalltalkParser::literalByteArray_() {
    uint32_t position = _token->position().start();
    step_();
    std::vector<uint8_t> bytes;
    while (_token && !_token->is(']') && !_token->isEnd()) {
        if (_token->isLiteral()) {
            // Each element should be a number 0-255
            std::string v = _token->value().toUtf8();
            int val = static_cast<int>(std::stol(v, nullptr, 0));
            bytes.push_back(static_cast<uint8_t>(val));
        }
        step_();
    }
    if (!_token || !_token->is(']')) {
        missingToken_("]");
    }
    auto lit = new SLiteralNode(_compiler);
    lit->literalValue_(LiteralValue::fromByteArray(std::move(bytes)));
    lit->position_(Stretch(position, _token->position().end()));
    step_();
    return lit;
}

SBraceNode* SSmalltalkParser::bracedArray_() {
    uint32_t position = _token->position().start();
    step_();
    SBraceNode* brace = new SBraceNode(_compiler);
    brace->position_(Stretch(position, _token->position().start()));
    while (_token && !_token->is('}') && !_token->isEnd()) {
        SParseNode* expr = expression_();
        if (expr) {
            brace->addElement_(expr);
        }
        if (_token && _token->is('.')) {
            step_();
        }
    }
    if (!_token || !_token->is('}')) {
        missingToken_("}");
    }
    brace->position_(Stretch(position, _token->position().end()));
    step_();
    return brace;
}

void SSmalltalkParser::addPragmaTo_(SMethodNode* method) {
    if (attachPragmaTo_(method)) {
        step_();
    }
}

bool SSmalltalkParser::attachPragmaTo_(SMethodNode* method) {
    if (method->isHeadless() || !_token || !_token->is('<')) {
        return false;
    }
    
    uint32_t start = _token->position().start();
    step_();
    
    SPragmaNode* pragma = nullptr;
    
    if (_token && _token->isKeyword()) {
        Egg::string keyword = _token->value();
        if (keyword == "primitive:") {
            pragma = pragma_();
        } else {
            pragma = symbolicPragma_();
        }
    } else {
        pragma = symbolicPragma_();
    }
    
    if (pragma) {
        pragma->position_(Stretch(start, _token->position().end()));
        method->pragma_(pragma);
    }
    
    if (!_token || !_token->is('>')) {
        missingToken_(">");
    }
    
    return true;
}

SPragmaNode* SSmalltalkParser::pragma_() {
    step_();
    
    if (!_token) {
        error_("missing pragma value");
    }
    
    if (_token->isLiteral()) {
        return numberedPrimitive_();
    } else if (_token->isName()) {
        return namedPrimitive_();
    }
    
    error_("invalid pragma format");
    return nullptr;
}

SPragmaNode* SSmalltalkParser::numberedPrimitive_() {
    int number = 0;
    try {
        number = std::stoi(_token->value().toUtf8());
    } catch (...) {
        error_("invalid primitive number");
    }
    
    uint32_t position = _token->position().start();
    SPragmaNode* pragma = new SPragmaNode(_compiler);
    pragma->bePrimitive_(number, "");
    pragma->position_(Stretch(position, _token->position().end()));
    
    step_();
    return pragma;
}

SPragmaNode* SSmalltalkParser::namedPrimitive_() {
    Egg::string name = _token->value();
    uint32_t position = _token->position().start();
    
    SPragmaNode* pragma = new SPragmaNode(_compiler);
    pragma->bePrimitive_(0, name);
    pragma->position_(Stretch(position, _token->position().end()));
    
    step_();
    return pragma;
}

SPragmaNode* SSmalltalkParser::symbolicPragma_() {
    Egg::string symbol = _token->value();
    uint32_t position = _token->position().start();
    
    SPragmaNode* pragma = new SPragmaNode(_compiler);
    pragma->beSymbolic_(symbol);
    pragma->position_(Stretch(position, _token->position().end()));
    
    step_();
    return pragma;
}

SMethodNode* SSmalltalkParser::buildMethodNode_(SSelectorNode* selector, const std::vector<SIdentifierNode*>& arguments) {
    SMethodNode* method = new SMethodNode(_compiler);
    method->selector_(selector);
    method->arguments_(arguments);
    method->position_(selector->position());
    _compiler->activeScript_(method);
    return method;
}

SMessageNode* SSmalltalkParser::buildMessageNode_(SParseNode* receiver) {
    SMessageNode* msg = new SMessageNode(_compiler);
    msg->receiver_(receiver);
    msg->position_(receiver->position());
    return msg;
}

SCascadeMessageNode* SSmalltalkParser::buildCascadeMessageNode_(SParseNode* receiver) {
    SCascadeMessageNode* msg = new SCascadeMessageNode(_compiler);
    msg->receiver_(receiver);
    msg->position_(receiver->position());
    return msg;
}

} // namespace Egg
