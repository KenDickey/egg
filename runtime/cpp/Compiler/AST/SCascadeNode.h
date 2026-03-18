/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _CASCADE_NODE_H_
#define _CASCADE_NODE_H_

#include "SParseNode.h"
#include <vector>
#include <functional>

namespace Egg {

class SMessageNode;

/**
 * Cascade node (multiple messages to same receiver)
 * Corresponds to SCascadeNode in Smalltalk
 */
class SCascadeNode : public SParseNode {
private:
    SParseNode* _receiver;
    std::vector<SMessageNode*> _messages;
    
public:
    SCascadeNode(SSmalltalkCompiler* compiler);
    virtual ~SCascadeNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    SParseNode* receiver() const { return _receiver; }
    void receiver_(SParseNode* r) { _receiver = r; }
    
    const std::vector<SMessageNode*>& messages() const { return _messages; }
    void messages_(const std::vector<SMessageNode*>& msgs) { _messages = msgs; }
    void addMessage_(SMessageNode* msg) { _messages.push_back(msg); }
    
    bool isCascade() const override { return true; }
    
    bool hasAssign() const override;
    
    void nodesDo_(std::function<void(SParseNode*)> block, bool includeDeclarations = false) override;
};

} // namespace Egg

#endif // _CASCADE_NODE_H_
