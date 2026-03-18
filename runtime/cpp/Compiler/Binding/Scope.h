/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _SCOPE_H_
#define _SCOPE_H_
#include "Binding.h"
#include "ArgumentBinding.h"
#include "TemporaryBinding.h"
#include <vector>

namespace Egg {

class SParseNode;

class Scope {
public:
    Scope() {}
    virtual ~Scope() {}
    void addBinding_(Binding* binding) { _bindings.push_back(binding); }
    const std::vector<Binding*>& bindings() const { return _bindings; }
    virtual Binding* defineArgument_(const Egg::string& name) { auto b = new ArgumentBinding(name, 0); addBinding_(b); return b; }
    virtual Binding* defineTemporary_(const Egg::string& name) { auto b = new TemporaryBinding(name, 0); addBinding_(b); return b; }
    virtual void captureEnvironment_(SParseNode* aScriptNode) { /* Default: do nothing */ }
private:
    std::vector<Binding*> _bindings;
};

} // namespace Egg

#endif // _SCOPE_H_
