/*
    Copyright (c) 2024-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "MethodDictBuilder.h"
#include "Bootstrapper.h"
#include "../Evaluator/Runtime.h"
#include "../KnownConstants.h"

namespace Egg {

// =========================================================================
// ArrayMethodDictBuilder
// =========================================================================

ArrayMethodDictBuilder::ArrayMethodDictBuilder(Bootstrapper* bootstrapper)
    : _bootstrapper(bootstrapper) {}

void ArrayMethodDictBuilder::installMethod(Object* species, Object* selector, Object* method) {
    HeapObject* behavior = species->asHeapObject()->slot(Offsets::SpeciesInstanceBehavior)->asHeapObject();
    Object* mdObj = behavior->slot(Offsets::BehaviorMethodDictionary);
    HeapObject* array;
    if (mdObj == nullptr || mdObj == (Object*)_bootstrapper->_nilObj) {
        array = _bootstrapper->newMethodArray();
        behavior->slot(Offsets::BehaviorMethodDictionary) = (Object*)array;
    } else {
        array = mdObj->asHeapObject();
    }
    _bootstrapper->addMethodToArray_(array, selector, method);
}

// =========================================================================
// SmalltalkMethodDictBuilder
// =========================================================================

SmalltalkMethodDictBuilder::SmalltalkMethodDictBuilder(Runtime* runtime)
    : _runtime(runtime) {}

void SmalltalkMethodDictBuilder::installMethod(Object* species, Object* selector, Object* method) {
    _runtime->sendLocal_to_with_with_("addSelector:withMethod:", species, selector, method);
}

} // namespace Egg
