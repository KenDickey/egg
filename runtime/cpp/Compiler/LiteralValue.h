/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _LITERAL_VALUE_H_
#define _LITERAL_VALUE_H_

#include <string>
#include <vector>
#include <cstdint>
#include <cassert>
#include "Util.h"
#include "Utils/egg_string.h"

namespace Egg {

/**
 * Tagged union representing a Smalltalk literal value.
 * Used by SLiteralNode and SCompiledMethod to carry typed values
 * instead of opaque strings.
 */
struct LiteralValue {
    enum Tag {
        None,
        Integer,
        LargeInteger,
        Float,
        String,
        Symbol,
        Character,
        Array,
        ByteArray,
        Boolean,
        Nil,
        Block
    };

    Tag tag;

    union {
        int64_t  intVal;
        double   floatVal;
        uint32_t charVal;  // Unicode code point
        bool     boolVal;
    };

    // Block metadata (used when tag == Block)
    struct BlockInfo {
        int id;             // 0-based block index
        int argCount;
        int tempCount;
        int envCount;
        bool capturesSelf;
        bool capturesHome;
    };
    BlockInfo blockInfo;

    // Strings and symbols share this field (union can't hold Egg::string)
    Egg::string strVal;

    // For literal arrays
    std::vector<LiteralValue> elements;

    // For byte arrays
    std::vector<uint8_t> bytes;

    LiteralValue() : tag(None), intVal(0), blockInfo{0, 0, 0, 0, false, false} {}
    LiteralValue(int64_t v) : tag(Integer), intVal(v), blockInfo{0, 0, 0, 0, false, false} {}
    LiteralValue(int v) : tag(Integer), intVal(v), blockInfo{0, 0, 0, 0, false, false} {}
    LiteralValue(double v) : tag(Float), floatVal(v), blockInfo{0, 0, 0, 0, false, false} {}

    // ----- factory helpers -----

    static LiteralValue fromInteger(int64_t v) {
        LiteralValue lit;
        lit.tag = Integer;
        lit.intVal = v;
        return lit;
    }

    // Construct a LargeInteger literal directly from little-endian bytes.
    // The bytes must already be in canonical form (even length, no extra
    // trailing zero pair). Used by the digit parser below.
    static LiteralValue fromLargeInteger(std::vector<uint8_t> leBytes, bool negative = false) {
        LiteralValue lit;
        lit.tag = LargeInteger;
        lit.boolVal = negative;
        lit.bytes = std::move(leBytes);
        return lit;
    }

    // Parse an unsigned digit string in the given base and return either an
    // Integer (if it fits in a SmallInteger) or a LargeInteger.
    // The base must be in [2, 36] because we accept digits 0-9 and A-Z
    // (case-insensitive), giving 36 distinct symbols. 

    static LiteralValue fromIntegerDigits(uint32_t base, const std::string& digits, bool negative = false) {
        ASSERT(base >= 2 && base <= 36);
        constexpr int64_t SMI_MAX = (int64_t)(INTPTR_MAX >> 1);
        std::vector<uint8_t> bytes;
        bytes.push_back(0);
        for (char c : digits) {
            int d;
            if (c >= '0' && c <= '9') d = c - '0';
            else if (c >= 'a' && c <= 'z') d = c - 'a' + 10;
            else if (c >= 'A' && c <= 'Z') d = c - 'A' + 10;
            else { ASSERT(!"invalid digit in integer literal"); d = 0; }
            ASSERT((uint32_t)d < base && "digit out of range for given base");
            uint32_t carry = d;
            for (auto& b : bytes) {
                uint32_t prod = (uint32_t)b * base + carry;
                b = prod & 0xFF;
                carry = prod >> 8;
            }
            while (carry > 0) {
                bytes.push_back(carry & 0xFF);
                carry >>= 8;
            }
        }
        while (bytes.size() > 1 && bytes.back() == 0) bytes.pop_back();
        // Try to fit into SmallInteger.
        if (bytes.size() <= 8) {
            uint64_t u = 0;
            for (int i = (int)bytes.size() - 1; i >= 0; i--)
                u = (u << 8) | bytes[i];
            uint64_t limit = negative ? (uint64_t)SMI_MAX + 1 : (uint64_t)SMI_MAX;
            if (u <= limit)
                return fromInteger(negative ? -(int64_t)u : (int64_t)u);
        }
        if (bytes.size() % 2 != 0) bytes.push_back(0);
        return fromLargeInteger(std::move(bytes), negative);
    }

    static LiteralValue fromFloat(double v) {
        LiteralValue lit;
        lit.tag = Float;
        lit.floatVal = v;
        return lit;
    }

    static LiteralValue fromString(const Egg::string& v) {
        LiteralValue lit;
        lit.tag = String;
        lit.strVal = v;
        return lit;
    }

    static LiteralValue fromSymbol(const Egg::string& v) {
        LiteralValue lit;
        lit.tag = Symbol;
        lit.strVal = v;
        return lit;
    }

    static LiteralValue fromCharacter(uint32_t codePoint) {
        LiteralValue lit;
        lit.tag = Character;
        lit.charVal = codePoint;
        return lit;
    }

    static LiteralValue fromArray(std::vector<LiteralValue> elems) {
        LiteralValue lit;
        lit.tag = Array;
        lit.elements = std::move(elems);
        return lit;
    }

    static LiteralValue fromByteArray(std::vector<uint8_t> b) {
        LiteralValue lit;
        lit.tag = ByteArray;
        lit.bytes = std::move(b);
        return lit;
    }

    static LiteralValue fromBoolean(bool v) {
        LiteralValue lit;
        lit.tag = Boolean;
        lit.boolVal = v;
        return lit;
    }

    static LiteralValue nil() {
        LiteralValue lit;
        lit.tag = Nil;
        return lit;
    }

    static LiteralValue fromBlock(int id, int argCount, int tempCount, 
                                   int envCount, bool capturesSelf, bool capturesHome) {
        LiteralValue lit;
        lit.tag = Block;
        lit.blockInfo = {id, argCount, tempCount, envCount, capturesSelf, capturesHome};
        return lit;
    }

    // ----- accessors -----

    bool isNone()      const { return tag == None; }
    bool isInteger()   const { return tag == Integer; }
    bool isLargeInteger() const { return tag == LargeInteger; }
    bool isFloat()     const { return tag == Float; }
    bool isString()    const { return tag == String; }
    bool isSymbol()    const { return tag == Symbol; }
    bool isCharacter() const { return tag == Character; }
    bool isArray()     const { return tag == Array; }
    bool isByteArray() const { return tag == ByteArray; }
    bool isBoolean()   const { return tag == Boolean; }
    bool isNil()       const { return tag == Nil; }
    bool isBlock()     const { return tag == Block; }
    bool isNumber()    const { return tag == Integer || tag == LargeInteger || tag == Float; }

const BlockInfo& asBlock() const { ASSERT(tag == Block); return blockInfo; }
    
    int64_t asInteger() const { ASSERT(tag == Integer); return intVal; }
    const std::vector<uint8_t>& asLargeIntegerBytes() const { ASSERT(tag == LargeInteger); return bytes; }
    bool isLargeIntegerNegative() const { ASSERT(tag == LargeInteger); return boolVal; }
    double  asFloat()   const { ASSERT(tag == Float); return floatVal; }
    uint32_t asCharacter() const { ASSERT(tag == Character); return charVal; }
    bool    asBoolean() const { ASSERT(tag == Boolean); return boolVal; }

    const Egg::string& asString() const {
        ASSERT(tag == String || tag == Symbol);
        return strVal;
    }

    const std::vector<LiteralValue>& asArray() const {
        ASSERT(tag == Array);
        return elements;
    }

    const std::vector<uint8_t>& asByteArray() const {
        ASSERT(tag == ByteArray);
        return bytes;
    }

    Egg::string printString() const {
        switch (tag) {
            case None:      return "";
            case Integer:   return Egg::string(std::to_string(intVal));
            case LargeInteger: return printLargeIntegerString();
            case Float:     return Egg::string(std::to_string(floatVal));
            case String:    return strVal;
            case Symbol:    return strVal;
            case Character: { Egg::string s; s += (char32_t)charVal; return s; }
            case Boolean:   return boolVal ? "true" : "false";
            case Nil:       return "nil";
            case Array:     return "#(...)";
            case ByteArray: return "#[...]";
            case Block:     return "a CompiledBlock";
        }
        return "";
    }

    // prints LargeIntegeras a Smalltalk radix-16 literal (e.g. 16rDEADBEEF or -16rFF)
    Egg::string printLargeIntegerString() const {
        ASSERT(tag == LargeInteger);
        static const char hex[] = "0123456789ABCDEF";
        std::string s = boolVal ? "-16r" : "16r";
        bool started = false;
        for (int i = (int)bytes.size() - 1; i >= 0; i--) {
            uint8_t b = bytes[i];
            if (!started && b == 0) continue;
            if (!started) {
                if (b >= 0x10) s += hex[(b >> 4) & 0xF];
            } else {
                s += hex[(b >> 4) & 0xF];
            }
            s += hex[b & 0xF];
            started = true;
        }
        if (!started) s += "0";
        return Egg::string(s);
    }

    // UTF-8 printable string for debug output
    std::string printStringUtf8() const {
        return printString().toUtf8();
    }

    bool operator==(const LiteralValue& other) const {
        if (tag != other.tag) return false;
        switch (tag) {
            case None:      return true;
            case Integer:   return intVal == other.intVal;
            case Float:     return floatVal == other.floatVal;
            case String:    return strVal == other.strVal;
            case Symbol:    return strVal == other.strVal;
            case Character: return charVal == other.charVal;
            case Boolean:   return boolVal == other.boolVal;
            case Nil:       return true;
            case Array:     return elements == other.elements;
            case ByteArray: return bytes == other.bytes;
            case Block:     return blockInfo.id == other.blockInfo.id;
            case LargeInteger: return bytes == other.bytes && boolVal == other.boolVal;
        }
        return false;
    }

    bool operator!=(const LiteralValue& other) const { return !(*this == other); }
};

} // namespace Egg

#endif // _LITERAL_VALUE_H_
