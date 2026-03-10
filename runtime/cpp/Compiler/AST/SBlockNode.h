/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _BLOCK_NODE_H_
#define _BLOCK_NODE_H_

#include "SScriptNode.h"

namespace Egg {

/**
 * Block node (closure)
 * Corresponds to SBlockNode in Smalltalk
 */
class SBlockNode : public SScriptNode {
private:
    bool _inlined;
    int _index;
    SScriptNode* _parent;
    
public:
    SBlockNode(SSmalltalkCompiler* compiler);
    virtual ~SBlockNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    bool isInlined() const { return _inlined; }
    void beInlined_();
    
    int index() const { return _index; }
    void index_(int idx) { _index = idx; }
    
    SScriptNode* parent() const { return _parent; }
    void parent_(SScriptNode* p);
    
    bool isBlock() const override { return true; }
    bool isEvaluable() const override { return _arguments.empty(); }
    bool isNullary() const { return _arguments.empty(); }
    
    SScriptNode* realScript() override;
    void captureHome() override;
    
    bool usesHome() const;
};

} // namespace Egg

#endif // _BLOCK_NODE_H_
