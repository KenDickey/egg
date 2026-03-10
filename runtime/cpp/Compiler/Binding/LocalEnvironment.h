/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _LOCALENVIRONMENT_H_
#define _LOCALENVIRONMENT_H_

namespace Egg {

/**
 * Base class for local variable environments
 * Corresponds to LocalEnvironment in Smalltalk
 */
class LocalEnvironment {
public:
    LocalEnvironment() {}
    virtual ~LocalEnvironment() {}
    
    virtual bool isInlinedArgument() const { return false; }
    virtual bool isStack() const = 0;  // Pure virtual
    virtual int* index() = 0;  // Pure virtual, returns nullptr for stack, pointer to int for array
    virtual int captureType() const = 0;  // Pure virtual
    
    virtual uint8_t environmentType() const = 0;  // Pure virtual
};

} // namespace Egg

#endif // _LOCALENVIRONMENT_H_
