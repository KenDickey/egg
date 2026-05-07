/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SCascadeMessageNode.h"

namespace Egg {

SCascadeMessageNode::SCascadeMessageNode(SSmalltalkCompiler* compiler) 
    : SMessageNode(compiler), _cascade(nullptr) {
}

} // namespace Egg
