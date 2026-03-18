/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _ARRAYENVIRONMENT_H_
#define _ARRAYENVIRONMENT_H_
#include "LocalEnvironment.h"
#include "../CompilerTypes.h"

namespace Egg {

enum CaptureType {
    CaptureEnvironmentValue = 3,
    CaptureLocalArgument = 1,
    CaptureInlinedArgument = 4
};

/**
 * Array-allocated environment for captured variables
 * Corresponds to ArrayEnvironment in Smalltalk
 */
class ArrayEnvironment : public LocalEnvironment {
private:
    int _index;
    
public:
    ArrayEnvironment() : _index(-1) {}
    virtual ~ArrayEnvironment() {}
    
    int captureType() const override { return CaptureEnvironmentValue; }
    uint8_t environmentType() const override { return AstBindingType::TemporaryBindingId; }
    
    int* index() override { return &_index; }
    void index_(int idx) { _index = idx; }
    
    bool isCurrent() const { return _index < 0; }
    bool isIndirect() const { return !isCurrent(); }
    bool isStack() const override { return false; }
};

} // namespace Egg

#endif // _ARRAYENVIRONMENT_H_
