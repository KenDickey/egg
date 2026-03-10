/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#include "LocalBinding.h"
#include "ArgumentBinding.h"
#include "TemporaryBinding.h"
#include "ArrayEnvironment.h"
#include "../TreecodeEncoder.h"

namespace Egg {

void LocalBinding::beInArray_() {
    delete _environment;
    _environment = new ArrayEnvironment();
}

int* LocalBinding::environment() {
    return _environment ? _environment->index() : nullptr;
}

int* LocalBinding::environmentIndex() {
    return _environment ? _environment->index() : nullptr;
}

void LocalBinding::environmentIndex_(int idx) {
    if (_environment) {
        auto arrayEnv = dynamic_cast<ArrayEnvironment*>(_environment);
        if (arrayEnv) {
            arrayEnv->index_(idx);
        }
    }
}

int LocalBinding::environmentCaptureType() const {
    return _environment ? _environment->captureType() : 0;
}

void ArgumentBinding::encodeUsing_(TreecodeEncoder* encoder) {
    encoder->encodeArgument_env_(_index, _environment);
}

void TemporaryBinding::encodeUsing_(TreecodeEncoder* encoder) {
    encoder->encodeTemporary_env_(_index, _environment);
}

} // namespace Egg
