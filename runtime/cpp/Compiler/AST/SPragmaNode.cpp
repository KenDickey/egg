/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SPragmaNode.h"
#include "SParseNodeVisitor.h"

namespace Egg {

void SPragmaNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    if (isPrimitive()) {
        visitor->visitPrimitivePragma_(this);
    } else if (isFFI()) {
        visitor->visitFFIPragma_(this);
    } else if (isSymbolic()) {
        visitor->visitSymbolicPragma_(this);
    } else {
        visitor->visitPragma_(this);
    }
}

} // namespace Egg
