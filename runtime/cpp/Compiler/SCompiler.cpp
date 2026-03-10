/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#include "SCompiler.h"
#include "egg_string.h"

using namespace Egg;

SCompiler::SCompiler() : _classBinding(nullptr) {
}

bool SCompiler::canStartIdentifier_(uint32_t ch) const {
    return egg::isLetter(static_cast<char32_t>(ch)) || ch == '_';
}

bool SCompiler::canBeInIdentifier_(uint32_t ch) const {
    return egg::isLetter(static_cast<char32_t>(ch)) || egg::isDigit(static_cast<char32_t>(ch)) || ch == '_';
}
