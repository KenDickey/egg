/*
    Copyright (c) 2024-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _METHOD_DICT_BUILDER_H_
#define _METHOD_DICT_BUILDER_H_

#include "../HeapObject.h"

namespace Egg {

class Bootstrapper;
class Runtime;

/**
 * Abstract interface for method dictionary management.
 * 
 * During early bootstrap, method dictionaries are plain Arrays (linear scan).
 * After the Smalltalk-side bootstrap completes, they are converted to proper
 * MethodDictionary objects and all subsequent method installation goes through
 * Smalltalk messages.
 *
 * The builder is parameterized: SmalltalkMethodDictBuilder can create
 * different kinds of dictionaries (MethodDictionary, Namespace, etc.)
 * by specifying the target class name.
 */
class MethodDictBuilder {
public:
    virtual ~MethodDictBuilder() = default;
    virtual void installMethod(Object* species, Object* selector, Object* method) = 0;
};

/**
 * Array-based method dictionary builder, used during C++ bootstrap phases.
 * Method dictionaries are plain Arrays with [selector, method, selector, method, ...] layout.
 * The C++ Runtime::methodFor_in_() handles this format via linear scan.
 */
class ArrayMethodDictBuilder : public MethodDictBuilder {
    Bootstrapper* _bootstrapper;
public:
    explicit ArrayMethodDictBuilder(Bootstrapper* bootstrapper);
    void installMethod(Object* species, Object* selector, Object* method) override;
};

/**
 * Smalltalk message-based method dictionary builder, used after bootstrap conversion.
 * Installs methods by sending addSelector:withMethod: to the species, which operates
 * on proper MethodDictionary objects via the standard Smalltalk protocol.
 */
class SmalltalkMethodDictBuilder : public MethodDictBuilder {
    Runtime* _runtime;
public:
    explicit SmalltalkMethodDictBuilder(Runtime* runtime);
    void installMethod(Object* species, Object* selector, Object* method) override;
};

} // namespace Egg

#endif // _METHOD_DICT_BUILDER_H_
