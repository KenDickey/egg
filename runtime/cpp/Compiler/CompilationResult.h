/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _COMPILATION_RESULT_H_
#define _COMPILATION_RESULT_H_

namespace Egg {

class SSmalltalkCompiler;
class CompilationError;
class SParseNode;

/**
 * Compilation result
 * Corresponds to SCompilationResult in Smalltalk
 */
class CompilationResult {
private:
    SSmalltalkCompiler* _compiler;
    CompilationError* _error;
    SParseNode* _ast;
    void* _method; // CompiledMethod placeholder
    
public:
    CompilationResult() : _compiler(nullptr), _error(nullptr), _ast(nullptr), _method(nullptr) {}
    virtual ~CompilationResult() {}
    
    SParseNode* ast() { return _ast; }
    void ast_(SParseNode* aParseNode) { _ast = aParseNode; }
    void beSuccessful() { _error = nullptr; }
    void compiler_(SSmalltalkCompiler* aSSmalltalkCompiler) { _compiler = aSSmalltalkCompiler; }
    CompilationError* error() { return _error; }
    void error_(CompilationError* aCompilationError) { _error = aCompilationError; }
    void* method() { return _method; }
    void method_(void* aCompiledMethod) { _method = aCompiledMethod; }
};

} // namespace Egg

#endif // _COMPILATION_RESULT_H_
