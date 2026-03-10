/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _MESSAGE_NODE_H_
#define _MESSAGE_NODE_H_

#include "SParseNode.h"
#include <vector>
#include <functional>

namespace Egg {

class SSelectorNode;

/**
 * Message send node
 * Corresponds to SMessageNode in Smalltalk
 */
class SMessageNode : public SParseNode {
private:
    SParseNode* _receiver;
    SSelectorNode* _selector;
    std::vector<SParseNode*> _arguments;
    bool _inlined;
    
public:
    SMessageNode(SSmalltalkCompiler* compiler);
    virtual ~SMessageNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    SParseNode* receiver() const { return _receiver; }
    void receiver_(SParseNode* r) { _receiver = r; }
    
    SSelectorNode* selector() const { return _selector; }
    void selector_(SSelectorNode* s) { _selector = s; }
    
    const std::vector<SParseNode*>& arguments() const { return _arguments; }
    void arguments_(const std::vector<SParseNode*>& args) { _arguments = args; }
    void addArgument_(SParseNode* arg) { _arguments.push_back(arg); }
    
    bool isInlined() const { return _inlined; }
    void beInlined_() { _inlined = true; }
    
    bool isMessage() const override { return true; }
    virtual bool isCascadeMessage() const override { return false; }
    
    bool hasAssign() const override;
    bool hasVolatileArguments() const;
    bool hasVolatileReceiver() const;
    bool needsStrictEvaluationOrder() const;
    
    void nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations = false) override;
};

} // namespace Egg

#endif // _MESSAGE_NODE_H_
