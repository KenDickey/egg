/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
*/
#include "SCompiledMethod.h"
#include "SCompiledBlock.h"

namespace Egg {

SCompiledMethod::SCompiledMethod(std::vector<LiteralValue> literals)
    : _literals(std::move(literals)), _format(0), _optimizedCode(nullptr), _classBinding(nullptr) {
}

SCompiledMethod::~SCompiledMethod() {
}

SCompiledMethod* SCompiledMethod::withAll(const std::vector<LiteralValue>& literals) {
    return new SCompiledMethod(literals);
}

uint32_t SCompiledMethod::getBits_(uint32_t shift, uint32_t mask) const {
    return (_format >> shift) & mask;
}

void SCompiledMethod::setBits_(uint32_t shift, uint32_t mask, uint32_t value) {
    _format = (_format & ~(mask << shift)) | ((value & mask) << shift);
}

uint32_t SCompiledMethod::argumentCount() const {
    return getBits_(ArgCount_Shift, ArgCount_Mask);
}

void SCompiledMethod::argumentCount_(uint32_t count) {
    setBits_(ArgCount_Shift, ArgCount_Mask, count);
}

uint32_t SCompiledMethod::blockCount() const {
    return getBits_(BlockCount_Shift, BlockCount_Mask);
}

void SCompiledMethod::blockCount_(uint32_t count) {
    setBits_(BlockCount_Shift, BlockCount_Mask, count);
}

uint32_t SCompiledMethod::tempCount() const {
    return getBits_(TempCount_Shift, TempCount_Mask);
}

void SCompiledMethod::tempCount_(uint32_t count) {
    setBits_(TempCount_Shift, TempCount_Mask, count);
}

uint32_t SCompiledMethod::environmentCount() const {
    return getBits_(EnvCount_Shift, EnvCount_Mask);
}

void SCompiledMethod::environmentCount_(uint32_t count) {
    setBits_(EnvCount_Shift, EnvCount_Mask, count);
}

bool SCompiledMethod::capturesSelf() const {
    return (_format & CapturesSelf) != 0;
}

void SCompiledMethod::capturesSelf_(bool value) {
    if (value) {
        _format |= CapturesSelf;
    } else {
        _format &= ~CapturesSelf;
    }
}

bool SCompiledMethod::hasEnvironment() const {
    return (_format & HasEnvironment) != 0;
}

void SCompiledMethod::hasEnvironment_(bool value) {
    if (value) {
        _format |= HasEnvironment;
    } else {
        _format &= ~HasEnvironment;
    }
}

bool SCompiledMethod::hasFrame() const {
    return (_format & HasFrame) != 0;
}

void SCompiledMethod::hasFrame_(bool value) {
    if (value) {
        _format |= HasFrame;
    } else {
        _format &= ~HasFrame;
    }
}

bool SCompiledMethod::isDebuggable() const {
    return (_format & Debuggable) != 0;
}

void SCompiledMethod::beDebuggable_() {
    _format |= Debuggable;
}

std::vector<SCompiledBlock*> SCompiledMethod::blocks() const {
    return std::vector<SCompiledBlock*>();
}

} // namespace Egg
