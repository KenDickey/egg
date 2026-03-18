/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _SSMALLTALKPARSER_H_
#define _SSMALLTALKPARSER_H_

#include <string>
#include <memory>
#include <vector>
#include "SToken.h"
#include "../SSmalltalkCompiler.h"
#include "../AST/SParseNode.h"
#include "../AST/SIdentifierNode.h"
#include "../AST/SLiteralNode.h"
#include "../AST/SMessageNode.h"
#include "../AST/SAssignmentNode.h"
#include "../AST/SReturnNode.h"
#include "../AST/SMethodNode.h"
#include "../AST/SBlockNode.h"
#include "../AST/SCascadeNode.h"
#include "../AST/SBraceNode.h"
#include "../AST/SCascadeMessageNode.h"
#include "../AST/SSelectorNode.h"
#include "../AST/SNumberNode.h"
#include "../AST/SStringNode.h"
#include "../AST/SPragmaNode.h"

namespace Egg {

class SSmalltalkScanner;

/**
 * Parser for Smalltalk code
 * Implements a recursive descent parser
 * Corresponds to SmalltalkParser in Smalltalk
 */
class SSmalltalkParser {
private:
    SSmalltalkCompiler* _compiler;
    SSmalltalkScanner* _scanner;
    std::unique_ptr<SToken> _token;
    std::unique_ptr<SToken> _next;
    
public:
    SSmalltalkParser(SSmalltalkCompiler* compiler);
    ~SSmalltalkParser();
    
    SMethodNode* parseMethod_();
    SMethodNode* parseExpression_();
    
    SMethodNode* method_();
    SMethodNode* headlessMethod_();
    SMethodNode* methodSignature_();
    SMethodNode* unarySignature_();
    SMethodNode* binarySignature_();
    SMethodNode* keywordSignature_();
    
    SParseNode* expression_();
    SParseNode* primary_();
    SParseNode* statement_();
    std::vector<SParseNode*> statements_();
    
    SParseNode* unarySequence_(SParseNode* receiver);
    SParseNode* binarySequence_(SParseNode* receiver);
    SParseNode* keywordSequence_(SParseNode* receiver);
    SParseNode* cascadeSequence_(SMessageNode* message);
    
    void unaryMessage_(SMessageNode* message);
    void binaryMessage_(SMessageNode* message);
    void keywordMessage_(SMessageNode* message);
    void cascadeMessage_(SMessageNode* message);
    
    SBlockNode* block_();
    std::vector<SIdentifierNode*> blockArguments_();
    
    SReturnNode* return_();
    SAssignmentNode* assignment_();
    
    std::vector<SIdentifierNode*> temporaries_();
    
    void addBodyTo_(SMethodNode* method);
    void addTemporariesTo_(SMethodNode* method);
    void addStatementsTo_(SMethodNode* method);
    void addPragmaTo_(SMethodNode* method);
    bool attachPragmaTo_(SMethodNode* method);
    
    SParseNode* literalArray_();
    SParseNode* literalByteArray_();
    SBraceNode* bracedArray_();
    
    SPragmaNode* pragma_();
    SPragmaNode* numberedPrimitive_();
    SPragmaNode* namedPrimitive_();
    SPragmaNode* symbolicPragma_();
    
    SParseNode* parenthesizedExpression_();
    bool hasUnarySelector_() const;
    bool hasBinarySelector_() const;
    bool hasKeywordSelector_() const;
    
    SToken* step_();
    SToken* peek_();
    SToken* next_();
    void skipDots_();
    
    void error_(const std::string& message);
    void error_(const std::string& message, uint32_t position);
    void missingToken_(const std::string& expected);
    void missingExpression_();
    void missingArgument_();
    
    template<typename T>
    T* buildNode_(uint32_t position) {
        T* node = new T(_compiler);
        node->position_(Stretch(position, _token->position().end()));
        return node;
    }
    
    SMethodNode* buildMethodNode_(SSelectorNode* selector, 
                                 const std::vector<SIdentifierNode*>& arguments);
    SMessageNode* buildMessageNode_(SParseNode* receiver);
    SCascadeMessageNode* buildCascadeMessageNode_(SParseNode* receiver);
};

} // namespace Egg

#endif // _SSMALLTALKPARSER_H_
