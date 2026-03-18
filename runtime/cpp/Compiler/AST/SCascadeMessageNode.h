/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _CASCADE_MESSAGE_NODE_H_
#define _CASCADE_MESSAGE_NODE_H_

#include "SMessageNode.h"
#include "SCascadeNode.h"

namespace Egg {

class SCascadeNode;

/**
 * Cascade message node (message in a cascade, shares receiver)
 * Corresponds to SCascadeMessageNode in Smalltalk
 */
class SCascadeMessageNode : public SMessageNode {
private:
    SCascadeNode* _cascade;
    
public:
    SCascadeMessageNode(SSmalltalkCompiler* compiler);
    virtual ~SCascadeMessageNode() {}
    
    SCascadeNode* cascade() const { return _cascade; }
    void cascade_(SCascadeNode* c) { _cascade = c; receiver_(c->receiver()); }
    
    bool isCascadeMessage() const override { return true; }
};

} // namespace Egg

#endif // _CASCADE_MESSAGE_NODE_H_
