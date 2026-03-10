/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _SCRIPTSCOPE_H_
#define _SCRIPTSCOPE_H_
#include "Scope.h"
#include <map>
#include <string>
#include <vector>

namespace Egg {

class SScriptNode;
class SIdentifierNode;
class ArgumentBinding;
class TemporaryBinding;

/**
 * Scope for script nodes (methods and blocks)
 * Corresponds to ScriptScope in Smalltalk
 */
class ScriptScope : public Scope {
protected:
    SScriptNode* _script;
    std::map<egg::string, Binding*> _arguments;
    std::vector<egg::string> _argumentOrder;
    std::map<egg::string, Binding*> _temporaries;
    int _stackSize;
    int _envSize;
    bool _captureSelf;
    
    void redefinitionError_(const egg::string& name);
    
public:
    ScriptScope();
    virtual ~ScriptScope() {}
    
    void script_(SScriptNode* aScriptNode) { _script = aScriptNode; }
    
    bool capturesSelf() const { return _captureSelf; }
    int environmentSize() const { return _envSize; }
    int stackSize() const { return _stackSize; }
    int growEnvironment_() { return ++_envSize; }
    int growStack_() { return ++_stackSize; }
    
    Binding* defineArgument_(const egg::string& identifier) override;
    Binding* defineTemporary_(const egg::string& identifier) override;
    bool defines_(const egg::string& aString);
    Binding* resolveLocal_(const egg::string& aString);
    bool resolves_(const egg::string& aString);
    virtual std::vector<Binding*> localBindings_();
    
    virtual void positionLocals_();
    virtual void positionDefinedLocals_();
    void positionDefinedTemporariesIn_(ScriptScope* aScriptScope);
    void positionDefinedArguments_();
    
    void captureEnvironment_(SParseNode* aScriptNode) override;
    virtual Binding* captureLocal_(Binding* aLocalBinding);
    virtual void captureSelf_();
    virtual int* environmentIndexOf_(SScriptNode* aScriptNode);
    virtual Binding* resolve_(const egg::string& aString) = 0;
    virtual SScriptNode* scriptDefining_(const egg::string& aString) = 0;
    virtual Binding* transferLocal_(const egg::string& name);
    virtual ScriptScope* realScope_();
};

} // namespace Egg

#endif // _SCRIPTSCOPE_H_
