/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _STREAM_H_
#define _STREAM_H_

#include <string>
#include <cstddef>
#include <cstdint>
#include "Utils/egg_string.h"

namespace Egg {

class Stream {
private:
    Egg::string _source;
    size_t _position;

public:
    Stream() : _position(0) {}
    explicit Stream(const Egg::string& source) : _source(source), _position(0) {}
    
    void on_(const Egg::string& source) {
        _source = source;
        _position = 0;
    }
    
    bool atEnd() const {
        return _position >= _source.length();
    }
    
    uint32_t next() {
        if (atEnd()) return 0;
        return static_cast<uint32_t>(_source[_position++]);
    }
    
    uint32_t peek() const {
        if (atEnd()) return 0;
        return static_cast<uint32_t>(_source[_position]);
    }
    
    void back() {
        if (_position > 0) _position--;
    }
    
    size_t position() const {
        return _position;
    }
    
    void position_(size_t pos) {
        _position = pos;
    }
    
    Egg::string copyFrom_to_(size_t start, size_t end) const {
        if (end > _source.length()) end = _source.length();
        if (start > end) return "";
        return _source.substr(start, end - start);
    }
    
    Egg::string upTo_(uint32_t delimiter) {
        size_t start = _position;
        while (!atEnd() && peek() != delimiter) {
            next();
        }
        Egg::string result = copyFrom_to_(start, _position);
        if (!atEnd() && peek() == delimiter) {
            next();
        }
        return result;
    }
    
    bool peekFor_(uint32_t ch) {
        if (atEnd() || peek() != ch) return false;
        next();
        return true;
    }
    
    Stream& skipSeparators() {
        while (!atEnd()) {
            uint32_t ch = peek();
            if (ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n') {
                next();
            } else {
                break;
            }
        }
        return *this;
    }
};

} // namespace Egg

#endif // _STREAM_H_
