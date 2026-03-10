/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SCommentNode.h"
#include "SParseNodeVisitor.h"

namespace Egg {

SCommentNode::SCommentNode(SSmalltalkCompiler* compiler) : SParseNode(compiler) {
}

void SCommentNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitComment_(this);
}

} // namespace Egg
