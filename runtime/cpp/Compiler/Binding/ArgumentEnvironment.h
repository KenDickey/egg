/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _ARGUMENTENVIRONMENT_H_
#define _ARGUMENTENVIRONMENT_H_
#include "StackEnvironment.h"
#include "ArrayEnvironment.h"
#include "../CompilerTypes.h"

namespace Egg {

/**
 * Environment for argument bindings
 * Corresponds to ArgumentEnvironment in Smalltalk
 */
class ArgumentEnvironment : public StackEnvironment {
public:
    ArgumentEnvironment() {}
    virtual ~ArgumentEnvironment() {}
    
    int captureType() const override { return CaptureLocalArgument; }
    uint8_t environmentType() const override { return AstBindingType::ArgumentBindingId; }
};

/**
 * Environment for inlined argument bindings
 * Corresponds to InlinedArgEnvironment in Smalltalk
 */
class InlinedArgEnvironment : public StackEnvironment {
public:
    InlinedArgEnvironment() {}
    virtual ~InlinedArgEnvironment() {}
    
    int captureType() const override { return CaptureInlinedArgument; }
    bool isInlinedArgument() const override { return true; }
    uint8_t environmentType() const override { return AstBindingType::ArgumentBindingId; }
};

} // namespace Egg

#endif // _ARGUMENTENVIRONMENT_H_
