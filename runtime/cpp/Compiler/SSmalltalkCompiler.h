/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _SSMALLTALKCOMPILER_H_
#define _SSMALLTALKCOMPILER_H_
#include "SCompiler.h"
#include "Utils/egg_string.h"
#include <functional>
#include <memory>

namespace Egg {

class SAssignmentNode;
class SBlockNode;
class SBraceNode;
class SCascadeMessageNode;
class SCascadeNode;
class SCommentNode;
class CompilationError;
class CompilationResult;
class SIdentifierNode;
class SLiteralNode;
class SMessageNode;
class SMethodNode;
class SNumberNode;
class SParseNode;
class SSmalltalkParser;
class SPragmaNode;
class SReturnNode;
class SSmalltalkScanner;
class SScriptNode;
class ScriptScope;
class SSelectorNode;
class Stretch;
class SToken;
class SEndToken;
class SStringToken;

/**
 * Corresponds to SSmalltalkCompiler in Smalltalk.
 * Orchestrates the compilation pipeline: parse → semantic analysis → build method.
 */
class SSmalltalkCompiler {
private:
    std::unique_ptr<SCompiler> _ownedFrontend;
    SCompiler* _frontend;
    std::unique_ptr<SSmalltalkScanner> _scanner;
    std::unique_ptr<SSmalltalkParser> _parser;
    Egg::string _source;
    SMethodNode* _ast;
    CompilationResult* _result;
    bool _headless;
    int _blocks;
    bool _leaf;
    SScriptNode* _activeScript;

public:
    SSmalltalkCompiler();
    ~SSmalltalkCompiler();

    void activate_while_(SScriptNode* aScriptNode, std::function<void()> aBlock);
    ScriptScope* activeScope();
    SScriptNode* activeScript();
    void activeScript_(SScriptNode* aParseNode);
    SAssignmentNode* assignmentNode();
    SMethodNode* ast();
    int blockCount();
    int blockIndex();
    SBlockNode* blockNode();
    SBraceNode* braceNode();
    void buildMethod();
    SCascadeMessageNode* cascadeSMessageNode();
    SCascadeNode* cascadeNode();
    SCommentNode* commentNode();
    CompilationError* compilationError_stretch_(const Egg::string& aString, Stretch* aStretch);
    CompilationResult* compileMethod_(const Egg::string& aString);
    SToken* delimiterToken();
    SEndToken* endToken();
    CompilationError* error_at_(const Egg::string& aString, int anInteger);
    CompilationError* error_stretch_(const Egg::string& aString, Stretch* aStretch);
    SCompiler* frontend();
    void frontend_(SCompiler* aSCompiler);
    bool hasBlocks();
    bool hasSends();
    SIdentifierNode* identifierNode();
    void initialize();
    SLiteralNode* literalNode();
    SMessageNode* messageNode();
    SMethodNode* methodNode();
    void noticeSend();
    SNumberNode* numericSLiteralNode();
    void parseFragment();
    SMethodNode* parseFragment_(const Egg::string& aString);
    void parseMethod();
    CompilationResult* parseMethod_(const Egg::string& aString);
    SSmalltalkParser* parser();
    SPragmaNode* pragmaNode();
    void reset();
    void resetResult();
    void resolveSemantics();
    CompilationResult* result();
    SReturnNode* returnNode();
    SSmalltalkScanner* scanner();
    SSelectorNode* selectorNode();
    Egg::string sourceCode();
    void sourceCode_(const Egg::string& aString);
    SStringToken* stringToken();
    bool supportsBraceNodes();
    void warning_at_(const Egg::string& aString, Stretch* aStretch);
};

} // namespace Egg

#endif // _SSMALLTALKCOMPILER_H_
