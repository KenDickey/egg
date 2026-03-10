/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#include "PseudoVariableBindings.h"
#include "../TreecodeEncoder.h"
#include <algorithm>

namespace Egg {

void NilBinding::encodeUsing_(TreecodeEncoder* encoder) {
    encoder->encodeNil();
}

void TrueBinding::encodeUsing_(TreecodeEncoder* encoder) {
    encoder->encodeTrue();
}

void FalseBinding::encodeUsing_(TreecodeEncoder* encoder) {
    encoder->encodeFalse();
}

void SelfBinding::encodeUsing_(TreecodeEncoder* encoder) {
    encoder->encodeSelf();
}

void SelfBinding::beReferencedFrom_(SScriptNode* aScriptNode) {
    aScriptNode->useSelf_();
}

void SuperBinding::beReferencedFrom_(SScriptNode* aScriptNode) {
    aScriptNode->useSelf_();
}

void SuperBinding::encodeUsing_(TreecodeEncoder* encoder) {
    encoder->encodeSuper();
}

void DynamicBinding::encodeUsing_(TreecodeEncoder* encoder) {
    encoder->encodeDynamicVar_(name());
}

void DynamicBinding::beReferencedFrom_(SScriptNode* aScriptNode) {
    aScriptNode->useSelf_();
}

void NestedDynamicBinding::encodeUsing_(TreecodeEncoder* encoder) {
    encoder->encodeNestedDynamicVar_(name());
}

DynamicBinding* DynamicBinding::named_(const egg::string& name) {
    size_t dotPos = name.find('.');
    if (dotPos == egg::string::npos) {
        return new DynamicBinding(name);
    }
    
    egg::string first = name.substr(0, dotPos);
    egg::string second = name.substr(dotPos + 1);
    std::vector<egg::string> names = {first, second};
    return new NestedDynamicBinding(names);
}

} // namespace Egg
