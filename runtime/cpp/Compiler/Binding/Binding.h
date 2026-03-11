/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _BINDING_H_
#define _BINDING_H_
#include <string>
#include <cstdint>
#include <optional>
#include "../LiteralValue.h"

namespace Egg {

class SScriptNode;
class TreecodeEncoder;

class Binding {
public:
    enum class Kind {
        Unknown,
        Variable,
        Argument,
        Temporary,
        Field,
        Method,
        Class,
        Global,
        Constant
    };

    Binding(Kind kind, const egg::string& name, uint32_t position)
        : _kind(kind), _name(name), _position(position) {}

    Kind kind() const { return _kind; }
    const egg::string& name() const { return _name; }
    uint32_t position() const { return _position; }

    virtual bool isDynamic() const { return false; }
    virtual bool isLiteral() const { return false; }
    virtual bool isLocal() const { return false; }
    virtual bool canBeAssigned() const { return true; }
    virtual void beReferencedFrom_(SScriptNode* aScriptNode) { 
    }
    
    // Returns the literal value the binding contributes to the method's literal pool.
    // Returns nullopt if the binding doesn't need a literal (e.g., local vars, self, nil).
    virtual std::optional<LiteralValue> literal() const { return std::nullopt; }
    
    virtual void encodeUsing_(TreecodeEncoder* encoder) = 0;  // Pure virtual
    
    virtual Binding* copy_() = 0;  // Pure virtual, subclasses must implement

private:
    Kind _kind;
    egg::string _name;
    uint32_t _position;
};

} // namespace Egg

#endif // _BINDING_H_
