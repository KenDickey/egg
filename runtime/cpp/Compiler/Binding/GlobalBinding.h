/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _GLOBALBINDING_H_
#define _GLOBALBINDING_H_
#include "Binding.h"

namespace Egg {

class GlobalBinding : public Binding {
public:
    GlobalBinding(const Egg::string& name, uint32_t position)
        : Binding(Kind::Global, name, position) {}
    
    Binding* copy_() override {
        return new GlobalBinding(name(), position());
    }
};

} // namespace Egg

#endif // _GLOBALBINDING_H_
