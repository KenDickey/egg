/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _STACKENVIRONMENT_H_
#define _STACKENVIRONMENT_H_
#include "LocalEnvironment.h"
#include "../CompilerTypes.h"

namespace Egg {

/**
 * Stack-allocated environment for local variables
 * Corresponds to StackEnvironment in Smalltalk
 */
class StackEnvironment : public LocalEnvironment {
public:
    StackEnvironment() {}
    virtual ~StackEnvironment() {}
    
    int* index() override { return nullptr; }
    bool isStack() const override { return true; }
    int captureType() const override { return 0; }  // Base implementation
    uint8_t environmentType() const override { return AstBindingType::TemporaryBindingId; }
};

} // namespace Egg

#endif // _STACKENVIRONMENT_H_
