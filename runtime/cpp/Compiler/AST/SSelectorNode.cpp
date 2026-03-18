/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SSelectorNode.h"
#include "SParseNodeVisitor.h"
#include "Utils/egg_string.h"

namespace Egg {

void SSelectorNode::acceptVisitor_(SParseNodeVisitor* visitor) {
    visitor->visitSelector_(this);
}

bool SSelectorNode::isBinary() const {
    if (_symbol.empty()) return false;
    
    char32_t first = _symbol[0];
    return !Egg::isLetter(first) && !Egg::isDigit(first) && first != '_' && first != ':';
}

} // namespace Egg
