/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _SSMALLTALKSCANNER_H_
#define _SSMALLTALKSCANNER_H_

#include "SToken.h"
#include "Stream.h"
#include <memory>
#include <string>

namespace Egg {

class SSmalltalkCompiler;

class SSmalltalkScanner {
private:
    SSmalltalkCompiler* _compiler;
    Stream stream;

    template<typename T>
    std::unique_ptr<T> buildToken_(T* token) {
        return buildToken_at_(token, stream.position());
    }
    
    template<typename T>
    std::unique_ptr<T> buildToken_at_(T* token, size_t position) {
        Egg::string string = stream.copyFrom_to_(position, stream.position());
        return buildToken_at_with_(token, position, string);
    }
    
    template<typename T>
    std::unique_ptr<T> buildToken_at_with_(T* token, size_t position, const Egg::string& value) {
        token->position_(Stretch(position, stream.position()));
        token->value_(value);
        return std::unique_ptr<T>(token);
    }
    
    bool canBeInIdentifier_(uint32_t ch) const;
    bool canStartIdentifier_(uint32_t ch) const;
    bool isBinary_(uint32_t ch) const;
    
    std::unique_ptr<SEndToken> end();
    void error_(const std::string& message);
    void error_at_(const std::string& message, size_t position);
    
    std::unique_ptr<SDelimiterToken> nextArrayPrefix();
    std::unique_ptr<SDelimiterToken> nextAssignment();
    std::unique_ptr<SSymbolicToken> nextBinarySelector();
    std::unique_ptr<SStringToken> nextBinarySymbol();
    std::unique_ptr<SToken> nextColon();
    std::unique_ptr<SToken> nextComment();
    std::unique_ptr<SSymbolicToken> nextIdentifierOrKeyword();
    std::unique_ptr<SStringToken> nextKeyword();
    std::unique_ptr<SStringToken> nextLiteralCharacter();
    std::unique_ptr<SStringToken> nextLiteralString();
    std::unique_ptr<SStringToken> nextNumber();
    std::unique_ptr<SStringToken> nextQuotedSymbol();
    std::unique_ptr<SDelimiterToken> nextSpecialCharacter();
    std::unique_ptr<SToken> nextSymbolOrArrayPrefix();
    
    Egg::string scanBinarySymbol();
    uint32_t scanChar();
    Egg::string scanString();
    void skipBinary();
    void skipIdentifier();
    void skipKeyword();

public:
    explicit SSmalltalkScanner(SSmalltalkCompiler* compiler);
    ~SSmalltalkScanner();

    void compiler_(SSmalltalkCompiler* compiler);
    std::unique_ptr<SToken> next();
    std::unique_ptr<SToken> nextToken();
    void on_(const Egg::string& source);
    void sourceCode_(const Egg::string& source);
};

} // namespace Egg

#endif // _SSMALLTALKSCANNER_H_
