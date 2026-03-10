/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _TEMPORARYBINDING_H_
#define _TEMPORARYBINDING_H_
#include "LocalBinding.h"
#include "StackEnvironment.h"

namespace Egg {

class TemporaryBinding : public LocalBinding {
public:
    TemporaryBinding(const egg::string& name, uint32_t position)
        : LocalBinding(Kind::Temporary, name, position) {
        _environment = new StackEnvironment();
    }

    bool isLiteral() const override { return true; }
    bool isTemporary() const { return true; }
    
    void encodeUsing_(TreecodeEncoder* encoder) override;
    
    Binding* copy_() override {
        auto copy = new TemporaryBinding(name(), position());
        copy->index_(_index);
        if (_environment) {
            if (auto stackEnv = dynamic_cast<StackEnvironment*>(_environment)) {
                copy->_environment = new StackEnvironment(*stackEnv);
            } else if (auto arrayEnv = dynamic_cast<ArrayEnvironment*>(_environment)) {
                copy->_environment = new ArrayEnvironment(*arrayEnv);
            }
        }
        return copy;
    }
};

} // namespace Egg

#endif // _TEMPORARYBINDING_H_
