/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _FIELDBINDING_H_
#define _FIELDBINDING_H_
#include "Binding.h"

namespace Egg {

class FieldBinding : public Binding {
public:
    FieldBinding(const egg::string& name, uint32_t position)
        : Binding(Kind::Field, name, position) {}
    
    Binding* copy_() override {
        return new FieldBinding(name(), position());
    }
};

} // namespace Egg

#endif // _FIELDBINDING_H_
