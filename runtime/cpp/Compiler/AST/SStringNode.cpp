/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SStringNode.h"
#include "SParseNodeVisitor.h"

namespace Egg {

void SStringNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitString_(this);
}

} // namespace Egg
