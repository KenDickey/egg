/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SLiteralNode.h"
#include "SParseNodeVisitor.h"

namespace Egg {

SLiteralNode::SLiteralNode(SSmalltalkCompiler* compiler) 
    : SParseNode(compiler) {
}

void SLiteralNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitLiteral_(this);
}

} // namespace Egg
