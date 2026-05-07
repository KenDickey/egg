/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _METHODBINDING_H_
#define _METHODBINDING_H_
#include "Binding.h"

namespace Egg {

class MethodBinding : public Binding {
public:
    MethodBinding(const Egg::string& name, uint32_t position)
        : Binding(Kind::Method, name, position) {}
    
    Binding* copy_() override {
        return new MethodBinding(name(), position());
    }
};

} // namespace Egg

#endif // _METHODBINDING_H_
