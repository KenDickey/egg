/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#include "SSmalltalkCompiler.h"
#include "Parser/SSmalltalkScanner.h"
#include "Parser/SSmalltalkParser.h"
#include "CompilationError.h"
#include "CompilationResult.h"
#include "Stretch.h"
#include "Parser/SToken.h"
#include "SemanticVisitor.h"
#include "AST/SAssignmentNode.h"
#include "AST/SBlockNode.h"
#include "AST/SBraceNode.h"
#include "AST/SCascadeMessageNode.h"
#include "AST/SCascadeNode.h"
#include "AST/SCommentNode.h"
#include "AST/SIdentifierNode.h"
#include "AST/SLiteralNode.h"
#include "AST/SMessageNode.h"
#include "AST/SMethodNode.h"
#include "AST/SNumberNode.h"
#include "AST/SParseNode.h"
#include "AST/SPragmaNode.h"
#include "AST/SReturnNode.h"
#include "AST/SSelectorNode.h"
#include "AST/SScriptNode.h"

namespace Egg {

SSmalltalkCompiler::SSmalltalkCompiler()
    : _ownedFrontend(std::make_unique<SCompiler>()),
      _frontend(_ownedFrontend.get()),
      _ast(nullptr), _result(nullptr), _headless(false), _blocks(0), _leaf(true), _activeScript(nullptr) {
    _scanner = std::make_unique<SSmalltalkScanner>(this);
    _parser = std::make_unique<SSmalltalkParser>(this);
}

SSmalltalkCompiler::~SSmalltalkCompiler() {}

void SSmalltalkCompiler::activate_while_(SScriptNode* aScriptNode, std::function<void()> aBlock) {
    SScriptNode* current = _activeScript;
    _activeScript = aScriptNode;
    aBlock();
    _activeScript = current;
}

ScriptScope* SSmalltalkCompiler::activeScope() {
    return _activeScript ? _activeScript->scope() : nullptr;
}

SScriptNode* SSmalltalkCompiler::activeScript() {
    return _activeScript;
}

void SSmalltalkCompiler::activeScript_(SScriptNode* aScriptNode) {
    _activeScript = aScriptNode;
}

SAssignmentNode* SSmalltalkCompiler::assignmentNode() {
    return new SAssignmentNode(this);
}

SMethodNode* SSmalltalkCompiler::ast() {
    return _ast;
}

int SSmalltalkCompiler::blockCount() {
    return _blocks;
}

int SSmalltalkCompiler::blockIndex() {
    _blocks += 1;
    return _blocks - 1;
}

SBlockNode* SSmalltalkCompiler::blockNode() {
    return new SBlockNode(this);
}

SBraceNode* SSmalltalkCompiler::braceNode() {
    return new SBraceNode(this);
}

void SSmalltalkCompiler::buildMethod() {
    if (_result && _ast) {
        _result->method_(_ast->buildMethod());
    }
}

SCascadeMessageNode* SSmalltalkCompiler::cascadeSMessageNode() {
    return new SCascadeMessageNode(this);
}

SCascadeNode* SSmalltalkCompiler::cascadeNode() {
    return new SCascadeNode(this);
}

SCommentNode* SSmalltalkCompiler::commentNode() {
    return new SCommentNode(this);
}

CompilationError* SSmalltalkCompiler::compilationError_stretch_(const egg::string& aString, Stretch* aStretch) {
    CompilationError* error = new CompilationError(aString);
    error->compiler_(this);
    error->stretch_(aStretch);
    return error;
}

CompilationResult* SSmalltalkCompiler::compileMethod_(const egg::string& aString) {
    _source = aString;
    if (_frontend) {
            parseMethod();
            resolveSemantics();
            buildMethod();
    } else {
        parseMethod();
        resolveSemantics();
        buildMethod();
    }
    return _result;
}

SToken* SSmalltalkCompiler::delimiterToken() {
    return new SDelimiterToken(Stretch(0, 0), "");
}

SEndToken* SSmalltalkCompiler::endToken() {
    return new SEndToken(Stretch(0, 0));
}

CompilationError* SSmalltalkCompiler::error_at_(const egg::string& aString, int anInteger) {
    Stretch* stretch = new Stretch(anInteger, anInteger);
    return error_stretch_(aString, stretch);
}

CompilationError* SSmalltalkCompiler::error_stretch_(const egg::string& aString, Stretch* aStretch) {
    auto error = compilationError_stretch_(aString, aStretch);
    error->beFatal();
    throw *error;
}

SCompiler* SSmalltalkCompiler::frontend() {
    return _frontend;
}

void SSmalltalkCompiler::frontend_(SCompiler* aSCompiler) {
    _frontend = aSCompiler;
}

bool SSmalltalkCompiler::hasBlocks() {
    return _blocks > 0;
}

bool SSmalltalkCompiler::hasSends() {
    return !_leaf;
}

SIdentifierNode* SSmalltalkCompiler::identifierNode() {
    return new SIdentifierNode(this);
}

void SSmalltalkCompiler::initialize() {
    reset();
}

SLiteralNode* SSmalltalkCompiler::literalNode() {
    return new SLiteralNode(this);
}

SMessageNode* SSmalltalkCompiler::messageNode() {
    return new SMessageNode(this);
}

SMethodNode* SSmalltalkCompiler::methodNode() {
    return new SMethodNode(this);
}

void SSmalltalkCompiler::noticeSend() {
    _leaf = false;
}

SNumberNode* SSmalltalkCompiler::numericSLiteralNode() {
    return new SNumberNode(this);
}

void SSmalltalkCompiler::parseFragment() {
    _headless = false;
    reset();
    scanner()->on_(_source);
    try {
        _ast = parser()->parseMethod_();
    } catch (...) {
    }
    if (_result) {
        _result->ast_(_ast);
    }
}

SMethodNode* SSmalltalkCompiler::parseFragment_(const egg::string& aString) {
    _source = aString;
    try { 
        parseFragment(); 
        resolveSemantics(); 
    } catch (CompilationError&) {}
    return _ast;
}

void SSmalltalkCompiler::parseMethod() {
    _headless = false;
    reset();
    scanner()->on_(_source);
    _ast = parser()->parseMethod_();
    if (_result) _result->ast_(_ast);
}

CompilationResult* SSmalltalkCompiler::parseMethod_(const egg::string& aString) {
    _source = aString;
    if (_frontend) {
            parseMethod();
            resolveSemantics();
    } else {
        parseMethod();
        resolveSemantics();
    }
    return _result;
}

SSmalltalkParser* SSmalltalkCompiler::parser() {
    return _parser.get();
}

SPragmaNode* SSmalltalkCompiler::pragmaNode() {
    return new SPragmaNode(this);
}

void SSmalltalkCompiler::reset() {
    resetResult();
    _leaf = true;
    _blocks = 0;
}

void SSmalltalkCompiler::resetResult() {
    _result = new CompilationResult();
    _result->compiler_(this);
}

void SSmalltalkCompiler::resolveSemantics() {
    if (_ast) {
        SemanticVisitor* visitor = new SemanticVisitor();
        _ast->acceptVisitor_(visitor);
        delete visitor;
    }
}

CompilationResult* SSmalltalkCompiler::result() {
    return _result;
}

SReturnNode* SSmalltalkCompiler::returnNode() {
    return new SReturnNode(this);
}

SSmalltalkScanner* SSmalltalkCompiler::scanner() {
    return _scanner.get();
}

SSelectorNode* SSmalltalkCompiler::selectorNode() {
    return new SSelectorNode(this);
}

egg::string SSmalltalkCompiler::sourceCode() {
    return _source;
}

void SSmalltalkCompiler::sourceCode_(const egg::string& aString) {
    _source = aString;
}

SStringToken* SSmalltalkCompiler::stringToken() {
    return new SStringToken(Stretch(0, 0), "");
}

bool SSmalltalkCompiler::supportsBraceNodes() {
    return true;
}

void SSmalltalkCompiler::warning_at_(const egg::string& aString, Stretch* aStretch) {
    auto error = compilationError_stretch_(aString, aStretch);
    error->beWarning();
    throw *error;
}

} // namespace Egg
