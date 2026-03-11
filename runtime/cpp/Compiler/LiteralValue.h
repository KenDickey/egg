/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _LITERAL_VALUE_H_
#define _LITERAL_VALUE_H_

#include <string>
#include <vector>
#include <cstdint>
#include <cassert>
#include "egg_string.h"

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

    // Strings and symbols share this field (union can't hold egg::string)
    egg::string strVal;

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

    static LiteralValue fromFloat(double v) {
        LiteralValue lit;
        lit.tag = Float;
        lit.floatVal = v;
        return lit;
    }

    static LiteralValue fromString(const egg::string& v) {
        LiteralValue lit;
        lit.tag = String;
        lit.strVal = v;
        return lit;
    }

    static LiteralValue fromSymbol(const egg::string& v) {
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
    bool isFloat()     const { return tag == Float; }
    bool isString()    const { return tag == String; }
    bool isSymbol()    const { return tag == Symbol; }
    bool isCharacter() const { return tag == Character; }
    bool isArray()     const { return tag == Array; }
    bool isByteArray() const { return tag == ByteArray; }
    bool isBoolean()   const { return tag == Boolean; }
    bool isNil()       const { return tag == Nil; }
    bool isBlock()     const { return tag == Block; }
    bool isNumber()    const { return tag == Integer || tag == Float; }

    const BlockInfo& asBlock() const { assert(tag == Block); return blockInfo; }

    int64_t asInteger() const { assert(tag == Integer); return intVal; }
    double  asFloat()   const { assert(tag == Float); return floatVal; }
    uint32_t asCharacter() const { assert(tag == Character); return charVal; }
    bool    asBoolean() const { assert(tag == Boolean); return boolVal; }

    const egg::string& asString() const {
        assert(tag == String || tag == Symbol);
        return strVal;
    }

    const std::vector<LiteralValue>& asArray() const {
        assert(tag == Array);
        return elements;
    }

    const std::vector<uint8_t>& asByteArray() const {
        assert(tag == ByteArray);
        return bytes;
    }

    /**
     * Returns a printable representation suitable for display / debugging.
     * Also used as a backwards-compatible "value()" for code that
     * previously relied on the string representation.
     */
    egg::string printString() const {
        switch (tag) {
            case None:      return "";
            case Integer:   return egg::string(std::to_string(intVal));
            case Float:     return egg::string(std::to_string(floatVal));
            case String:    return strVal;
            case Symbol:    return strVal;
            case Character: { egg::string s; s += (char32_t)charVal; return s; }
            case Boolean:   return boolVal ? "true" : "false";
            case Nil:       return "nil";
            case Array:     return "#(...)";
            case ByteArray: return "#[...]";
            case Block:     return "a CompiledBlock";
        }
        return "";
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
        }
        return false;
    }

    bool operator!=(const LiteralValue& other) const { return !(*this == other); }
};

} // namespace Egg

#endif // _LITERAL_VALUE_H_
