/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
*/
#ifndef _BLOCKSCOPE_H_
#define _BLOCKSCOPE_H_
#include "ScriptScope.h"
#include <vector>
#include <map>

namespace Egg {

/**
 * Scope for block nodes
 * Corresponds to BlockScope in Smalltalk
 */
class BlockScope : public ScriptScope {
private:
    std::vector<SParseNode*> _environments;
    std::map<egg::string, Binding*> _captured;
    
    Binding* captureArgument_(Binding* anArgumentBinding);
    Binding* captureTemporary_(Binding* aTemporaryBinding);
    Binding* copyLocal_(Binding* binding);
    int capturedEnvironmentIndexOf_(SScriptNode* aScriptNode);
    void positionCapturedLocals_();
    void positionCapturedArgument_(Binding* anArgumentBinding);
    void positionCapturedTemporary_(Binding* aTemporaryBinding);
    void positionDefinedArgumentsIn_(ScriptScope* aScriptScope);
    int environmentSizeUpToEnvironments_();
    int environmentSizeUpToCapturedArguments_();
    ScriptScope* parent_();
    ScriptScope* realParent_();
    
public:
    BlockScope();
    virtual ~BlockScope() {}
    
    std::vector<Binding*> capturedArguments_();
    std::vector<SParseNode*> capturedEnvironments_() { return _environments; }
    bool capturesHome_();
    std::vector<SParseNode*> environments_();
    SParseNode* home_();
    
    void captureEnvironment_(SParseNode* aScriptNode) override;
    Binding* captureLocal_(Binding* aLocalBinding) override;
    void captureSelf_() override;
    int* environmentIndexOf_(SScriptNode* aScriptNode) override;
    Binding* resolve_(const egg::string& aString) override;
    Binding* resolveLocal_(const egg::string& aString);
    SScriptNode* scriptDefining_(const egg::string& aString) override;
    Binding* transferLocal_(const egg::string& name) override;
    std::vector<Binding*> localBindings_() override;
    void positionDefinedLocals_() override;
    void positionLocals_() override;
};

} // namespace Egg

#endif // _BLOCKSCOPE_H_
