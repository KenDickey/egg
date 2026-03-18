/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _LOCALBINDING_H_
#define _LOCALBINDING_H_
#include "Binding.h"
#include "LocalEnvironment.h"

namespace Egg {

class SIdentifierNode;

/**
 * Base class for local bindings (arguments and temporaries)
 * Corresponds to LocalBinding in Smalltalk
 */
class LocalBinding : public Binding {
protected:
    int _index;
    LocalEnvironment* _environment;
    SIdentifierNode* _declaration;
    
public:
    LocalBinding(Kind kind, const Egg::string& name, uint32_t position)
        : Binding(kind, name, position), _index(-1), _environment(nullptr), _declaration(nullptr) {}
    
    virtual ~LocalBinding() { 
        delete _environment;
    }
    
    void beInArray_();
    
    SIdentifierNode* declaration() const { return _declaration; }
    void declaration_(SIdentifierNode* node) { _declaration = node; }
    
    int* environment();
    int* environmentIndex();
    void environmentIndex_(int idx);
    LocalEnvironment* environmentObject() const { return _environment; }
    int environmentCaptureType() const;
    
    int index() const { return _index; }
    void index_(int idx) { _index = idx; }
    
    bool isInArray() const { return !isInStack(); }
    bool isInStack() const { return _environment && _environment->isStack(); }
    bool isLocal() const override { return true; }
};

} // namespace Egg

#endif // _LOCALBINDING_H_
