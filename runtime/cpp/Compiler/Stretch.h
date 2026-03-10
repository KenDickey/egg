/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _STRETCH_H_
#define _STRETCH_H_

#include <cstdint>

namespace Egg {

/**
 * Represents a range in source code
 * Corresponds to Stretch in Smalltalk (start thru: end)
 */
class Stretch {
    uint32_t _start;
    uint32_t _end;

public:
    Stretch() : _start(0), _end(0) {}
    Stretch(uint32_t start, uint32_t end) : _start(start), _end(end) {}
    Stretch(uint32_t pos) : _start(pos), _end(pos) {}

    uint32_t start() const { return _start; }
    uint32_t end() const { return _end; }
    void start_(uint32_t s) { _start = s; }
    void end_(uint32_t e) { _end = e; }
};

} // namespace Egg

#endif // _STRETCH_H_
