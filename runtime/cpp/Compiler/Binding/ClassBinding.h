/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _CLASSBINDING_H_
#define _CLASSBINDING_H_
#include "Binding.h"

namespace Egg {

class ClassBinding : public Binding {
public:
    ClassBinding(const egg::string& name, uint32_t position)
        : Binding(Kind::Class, name, position) {}
    
    Binding* copy_() override {
        return new ClassBinding(name(), position());
    }
};

} // namespace Egg

#endif // _CLASSBINDING_H_
