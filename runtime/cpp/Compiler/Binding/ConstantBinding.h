/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _CONSTANTBINDING_H_
#define _CONSTANTBINDING_H_
#include "Binding.h"

namespace Egg {

class ConstantBinding : public Binding {
public:
    ConstantBinding(const egg::string& name, uint32_t position)
        : Binding(Kind::Constant, name, position) {}

    bool isLiteral() const { return true; }
    
    Binding* copy_() override {
        return new ConstantBinding(name(), position());
    }
};

} // namespace Egg

#endif // _CONSTANTBINDING_H_
