/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _ARGUMENTBINDING_H_
#define _ARGUMENTBINDING_H_
#include "LocalBinding.h"
#include "ArgumentEnvironment.h"

namespace Egg {

class ArgumentBinding : public LocalBinding {
public:
    ArgumentBinding(const egg::string& name, uint32_t position)
        : LocalBinding(Kind::Argument, name, position) {
        _environment = new ArgumentEnvironment();
    }
    
    void beInlined_() {
        delete _environment;
        _environment = new InlinedArgEnvironment();
    }

    bool isLiteral() const override { return true; }
    bool canBeAssigned() const override { return false; }
    bool isArgument() const { return true; }
    bool isInlined() const { return _environment && _environment->isInlinedArgument(); }
    
    void encodeUsing_(TreecodeEncoder* encoder) override;
    
    Binding* copy_() override {
        auto copy = new ArgumentBinding(name(), position());
        copy->index_(_index);
        if (_environment) {
            if (auto argEnv = dynamic_cast<ArgumentEnvironment*>(_environment)) {
                copy->_environment = new ArgumentEnvironment(*argEnv);
            } else if (auto inlinedEnv = dynamic_cast<InlinedArgEnvironment*>(_environment)) {
                copy->_environment = new InlinedArgEnvironment(*inlinedEnv);
            }
        }
        return copy;
    }
};

} // namespace Egg

#endif // _ARGUMENTBINDING_H_
