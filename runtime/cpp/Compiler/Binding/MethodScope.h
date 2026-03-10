/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _METHODSCOPE_H_
#define _METHODSCOPE_H_
#include "ScriptScope.h"
#include <map>
#include <string>

namespace Egg {

class NilBinding;
class TrueBinding;
class FalseBinding;
class SelfBinding;
class SuperBinding;
class DynamicBinding;

/**
 * Scope for method nodes
 * Corresponds to MethodScope in Smalltalk
 */
class MethodScope : public ScriptScope {
private:
    std::map<egg::string, Binding*> _pseudo;
    
    void initializePseudoVars_();
    Binding* resolvePseudo_(const egg::string& aString);
    
public:
    MethodScope();
    virtual ~MethodScope() {}
    
    void captureEnvironment_(SParseNode* aScriptNode) override;
    Binding* captureLocal_(Binding* aLocalBinding) override;
    void captureSelf_() override;
    int* environmentIndexOf_(SScriptNode* aScriptNode) override;
    Binding* resolve_(const egg::string& aString) override;
    SScriptNode* scriptDefining_(const egg::string& aString) override;
    Binding* transferLocal_(const egg::string& name) override;
};

} // namespace Egg

#endif // _METHODSCOPE_H_
