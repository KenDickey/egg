/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "CompilationError.h"
#include "SSmalltalkCompiler.h"
#include "CompilationResult.h"

namespace Egg {

CompilationError::CompilationError(const egg::string& desc)
    : std::runtime_error(desc.toUtf8()), _compiler(nullptr), _resumable(false), _retryable(false), _stretch(nullptr), _description(desc) {
}

void CompilationError::beFatal() {
    _resumable = false;
    _retryable = false;
}

void CompilationError::beResumable() {
    _resumable = true;
}

void CompilationError::beWarning() {
    _resumable = true;
}

void CompilationError::compiler_(SSmalltalkCompiler* aSCompiler) {
    _compiler = aSCompiler;
    if (_compiler) {
        _compiler->result()->error_(this);
    }
}

void CompilationError::proceed() {
    _retryable = false;
    if (_compiler) {
        _compiler->result()->beSuccessful();
    }
}

egg::string CompilationError::source() {
    if (!_compiler || !_stretch) return "";
    egg::string sourceCode = _compiler->sourceCode();
    int start = _stretch->start();
    int end = _stretch->end();
    if (start < 0 || end > static_cast<int>(sourceCode.length()) || start > end) {
        return "";
    }
    return sourceCode.substr(start, end - start);
}

} // namespace Egg
