/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _COMMENT_NODE_H_
#define _COMMENT_NODE_H_

#include "SParseNode.h"
#include <string>

namespace Egg {

/**
 * Comment node
 * Corresponds to SCommentNode in Smalltalk
 */
class SCommentNode : public SParseNode {
private:
    egg::string _value;
    
public:
    SCommentNode(SSmalltalkCompiler* compiler);
    virtual ~SCommentNode() {}
    
    void acceptVisitor_(SParseNodeVisitor* visitor) override;
    
    egg::string value() const { return _value; }
    void value_(const egg::string& aString) { _value = aString; }
    
    bool isComment() const override { return true; }
};

} // namespace Egg

#endif // _COMMENT_NODE_H_
