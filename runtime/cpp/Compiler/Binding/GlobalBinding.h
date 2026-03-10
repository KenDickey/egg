/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _GLOBALBINDING_H_
#define _GLOBALBINDING_H_
#include "Binding.h"

namespace Egg {

class GlobalBinding : public Binding {
public:
    GlobalBinding(const egg::string& name, uint32_t position)
        : Binding(Kind::Global, name, position) {}
    
    Binding* copy_() override {
        return new GlobalBinding(name(), position());
    }
};

} // namespace Egg

#endif // _GLOBALBINDING_H_
