/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _FIELDBINDING_H_
#define _FIELDBINDING_H_
#include "Binding.h"

namespace Egg {

class FieldBinding : public Binding {
public:
    FieldBinding(const Egg::string& name, uint32_t position)
        : Binding(Kind::Field, name, position) {}
    
    Binding* copy_() override {
        return new FieldBinding(name(), position());
    }
};

} // namespace Egg

#endif // _FIELDBINDING_H_
