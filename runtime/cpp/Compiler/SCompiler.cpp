/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SCompiler.h"
#include "Utils/egg_string.h"

using namespace Egg;

SCompiler::SCompiler() : _classBinding(nullptr) {
}

bool SCompiler::canStartIdentifier_(uint32_t ch) const {
    return Egg::isLetter(static_cast<char32_t>(ch)) || ch == '_';
}

bool SCompiler::canBeInIdentifier_(uint32_t ch) const {
    return Egg::isLetter(static_cast<char32_t>(ch)) || Egg::isDigit(static_cast<char32_t>(ch)) || ch == '_';
}
