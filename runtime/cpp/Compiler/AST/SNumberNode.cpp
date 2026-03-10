/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SNumberNode.h"
#include "SParseNodeVisitor.h"

namespace Egg {

void SNumberNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitNumberNode_(this);
}

} // namespace Egg
