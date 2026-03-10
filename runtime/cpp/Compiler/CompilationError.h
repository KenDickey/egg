/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _COMPILATION_ERROR_H_
#define _COMPILATION_ERROR_H_

#include <string>
#include <stdexcept>
#include "Stretch.h"
#include "egg_string.h"

namespace Egg {

class SSmalltalkCompiler;

/**
 * Compilation error
 * Corresponds to SCompilationError in Smalltalk
 */
class CompilationError : public std::runtime_error {
private:
    SSmalltalkCompiler* _compiler;
    bool _resumable;
    bool _retryable;
    Stretch* _stretch;
    egg::string _description;
    
public:
    CompilationError(const egg::string& desc = "");
    virtual ~CompilationError() {}
    
    void beFatal();
    void beResumable();
    void beWarning();
    SSmalltalkCompiler* compiler() { return _compiler; }
    void compiler_(SSmalltalkCompiler* aSCompiler);
    void description_(const egg::string& aString) { _description = aString; }
    egg::string description() const { return _description; }
    bool isResumable() const { return _resumable; }
    bool isUndeclaredAccess() const { return false; }
    bool isUndeclaredAssignment() const { return false; }
    void proceed();
    egg::string source();
    Stretch* stretch() { return _stretch; }
    void stretch_(Stretch* aStretch) { _stretch = aStretch; }
};

} // namespace Egg

#endif // _COMPILATION_ERROR_H_
