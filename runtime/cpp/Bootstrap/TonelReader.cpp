/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.

    Stream-based Tonel reader modelled after modules/Tonel/TonelReader.st.
 */

#include "TonelReader.h"
#include "CodeSpecs.h"
#include "Egg.h"

namespace Egg {

// ── Stream primitives ────────────────────────────────────────────────

bool TonelReader::atEnd() const {
    return _pos >= _source.length();
}

char32_t TonelReader::peek() const {
    return _source[_pos];
}

char32_t TonelReader::next() {
    return _source[_pos++];
}

void TonelReader::skipSeparators() {
    while (!atEnd() && (_source[_pos] == U' '  || _source[_pos] == U'\t' ||
                        _source[_pos] == U'\n' || _source[_pos] == U'\r'))
        _pos++;
}

void TonelReader::skipLine() {
    while (!atEnd() && _source[_pos] != U'\n') _pos++;
    if (!atEnd()) _pos++; // skip the \n
}

// ── Tonel structure ──────────────────────────────────────────────────

ClassSpec* TonelReader::parseFile(const std::string& utf8Source) {
    _source = Egg::string(utf8Source);
    _pos = 0;

    Egg::string comment = readComments();
    Egg::string type = readType();
    auto fields = readDefinition();

    auto* spec = new ClassSpec();
    auto* meta = new MetaclassSpec();
    meta->instanceClass(spec);
    spec->metaclass(meta);

    if (!comment.empty())
        spec->comment(comment);

    spec->name(fields.count("name") ? fields["name"] : Egg::string(""));
    if (type == "Extension") {
        spec->isExtension(true);
    } else if (type == "Class") {
        spec->supername(fields.count("superclass") ? fields["superclass"] : Egg::string(""));
    } else {
        error_("Unknown Tonel type: " + type.toUtf8());
    }

    // #type field: #variable (pointer-indexed), #bytes (byte-indexed)
    if (fields.count("type")) {
        Egg::string t = fields["type"];
        if (t == "variable") {
            spec->isVariable(true);
            spec->isPointers(true);
        } else if (t == "bytes") {
            spec->isVariable(true);
            spec->isPointers(false);
        }
    }

    // instVars / classVars / classInstVars are parsed from the STON array
    // already stored as comma-separated names during parseSTONArray()
    auto splitNames = [](const Egg::string& csv) -> std::vector<Egg::string> {
        std::vector<Egg::string> out;
        if (csv.empty()) return out;
        size_t start = 0;
        while (start < csv.length()) {
            size_t comma = csv.find(U',', start);
            if (comma == Egg::string::npos) comma = csv.length();
            if (comma > start)
                out.push_back(csv.substr(start, comma - start));
            start = comma + 1;
        }
        return out;
    };

    if (fields.count("instVars"))
        spec->instVarNames(splitNames(fields["instVars"]));
    if (fields.count("classVars"))
        spec->classVarNames(splitNames(fields["classVars"]));
    if (fields.count("classInstVars"))
        meta->instVarNames(splitNames(fields["classInstVars"]));

    readMethods(spec, meta);
    return spec;
}

// Mirrors TonelReader >> readComments
Egg::string TonelReader::readComments() {
    skipSeparators();
    if (!atEnd() && peek() == U'"') {
        next(); // skip opening "
        size_t start = _pos;
        skipComment();
        // _pos is now past the closing "
        return _source.substr(start, _pos - 1 - start);
    }
    return Egg::string("");
}

// Mirrors TonelReader >> readType  (via ReadStream >> nextWordOrNumber)
Egg::string TonelReader::readType() {
    skipSeparators();
    size_t start = _pos;
    while (!atEnd() && ((_source[_pos] >= U'A' && _source[_pos] <= U'Z') ||
                        (_source[_pos] >= U'a' && _source[_pos] <= U'z') ||
                        (_source[_pos] >= U'0' && _source[_pos] <= U'9')))
        _pos++;
    return _source.substr(start, _pos - start);
}

// Mirrors TonelReader >> readDefinition  (parses STON map)
std::map<Egg::string, Egg::string> TonelReader::readDefinition() {
    skipSeparators();
    return parseSTONMap();
}

// Mirrors TonelReader >> readMethods
void TonelReader::readMethods(ClassSpec* spec, MetaclassSpec* meta) {
    while (true) {
        skipSeparators();
        if (atEnd()) break;
        readMethod(spec, meta);
    }
}

// Mirrors TonelReader >> readMethod
void TonelReader::readMethod(ClassSpec* spec, MetaclassSpec* meta) {
    // 1. STON metadata  { #category : #accessing }
    skipSeparators();
    auto metadata = parseSTONMap();

    // 2. ClassName [class] >> selector...signature [
    skipSeparators();
    // Read up to " >> "
    Egg::string className;
    {
        size_t sepPos = _source.find(Egg::string(" >> "), _pos);
        if (sepPos == Egg::string::npos) return;
        className = _source.substr(_pos, sepPos - _pos);
        _pos = sepPos + 4; // skip " >> "
    }

    // Trim className
    while (!className.empty() && (className.back() == U' ' || className.back() == U'\t'))
        className.pop_back();

    bool isClassSide = false;
    if (className.length() > 6) {
        Egg::string tail = className.substr(className.length() - 5, 5);
        if (tail == "class" &&
            (className.length() == 5 || className[className.length() - 6] == U' '))
            isClassSide = true;
    }

    // 3. Read signature up to [
    Egg::string signature;
    {
        size_t bracketPos = _source.find(U'[', _pos);
        if (bracketPos == Egg::string::npos) return;
        signature = _source.substr(_pos, bracketPos - _pos);
        _pos = bracketPos + 1; // skip '['
    }
    // Trim signature
    while (!signature.empty() && (signature.back() == U' ' || signature.back() == U'\t' ||
           signature.back() == U'\n' || signature.back() == U'\r'))
        signature.pop_back();
    while (!signature.empty() && (signature.front() == U' ' || signature.front() == U'\t' ||
           signature.front() == U'\n' || signature.front() == U'\r'))
        signature.erase(signature.begin());

    // 4. Read body via nextBlock (we already consumed the '[')
    Egg::string body = nextBlock();

    // 5. Build method source = signature \n\t body
    Egg::string methodSource = signature + "\n\t" + body;

    MethodSpec ms(methodSource);
    if (metadata.count("category"))
        ms.category(metadata["category"]);

    if (isClassSide)
        meta->addMethod(ms);
    else
        spec->addMethod(ms);
}

// ── nextBlock ────────────────────────────────────────────────────────
// Mirrors TonelReader >> nextBlock.
// Called after the opening '[' has already been consumed.
// Reads until the matching ']', handling nesting and literals.

Egg::string TonelReader::nextBlock() {
    // Skip the rest of the line that contained '['
    size_t bodyStart = _pos;
    while (bodyStart < _source.length() &&
           (_source[bodyStart] == U'\n' || _source[bodyStart] == U'\r'))
        bodyStart++;
    _pos = bodyStart;

    int nested = 1;
    char32_t prev = 0;
    while (nested > 0) {
        if (atEnd())
            error_("unterminated method body");
        char32_t ch = next();
        if (prev == U'$') {
            // This character is a character literal value (e.g. $[ $] $' $" $$)
            // Skip it entirely — don't count brackets or enter strings/comments
            prev = 0;
            continue;
        }
        if (ch == U'[') {
            nested++;
        } else if (ch == U']') {
            nested--;
            if (nested == 0) break;
        } else if (ch == U'\'') {
            skipString();
        } else if (ch == U'"') {
            skipComment();
        }
        prev = ch;
    }

    // _pos now points just past the closing ']'
    size_t bodyEnd = _pos - 1; // exclude ']'

    // Trim trailing whitespace/newlines from body, but NOT spaces (for $<space> literals)
    while (bodyEnd > bodyStart && (_source[bodyEnd - 1] == U'\n' || _source[bodyEnd - 1] == U'\r' ||
           _source[bodyEnd - 1] == U'\t'))
        bodyEnd--;

    if (bodyEnd <= bodyStart) return Egg::string("");
    return _source.substr(bodyStart, bodyEnd - bodyStart);
}

// ── Literal skipping ─────────────────────────────────────────────────

// Mirrors TonelReader >> skipString
void TonelReader::skipString() {
    skipToMatch(U'\'');
}

// Mirrors TonelReader >> skipComment
void TonelReader::skipComment() {
    skipToMatch(U'"');
}

// Mirrors TonelReader >> skipToMatch:
// Skips until a non-doubled occurrence of `ch` is found.
void TonelReader::skipToMatch(char32_t ch) {
    while (!atEnd()) {
        char32_t c = next();
        if (c == ch) {
            if (!atEnd() && peek() == ch) {
                next(); // doubled – skip and continue
            } else {
                return; // unmatched – done
            }
        }
    }
}

// ── Minimal STON parser ──────────────────────────────────────────────
// Just enough to parse Tonel definition headers and method metadata.

std::map<Egg::string, Egg::string> TonelReader::parseSTONMap() {
    std::map<Egg::string, Egg::string> map;
    skipSeparators();
    if (atEnd() || peek() != U'{') return map;
    next(); // skip '{'

    while (true) {
        skipSeparators();
        if (atEnd() || peek() == U'}') { if (!atEnd()) next(); break; }

        Egg::string key = parseSTONValue();
        skipSeparators();
        if (!atEnd() && peek() == U':') next(); // skip ':'
        skipSeparators();
        Egg::string value = parseSTONValue();

        map[key] = value;

        skipSeparators();
        if (!atEnd() && peek() == U',') next(); // skip ','
    }
    return map;
}

Egg::string TonelReader::parseSTONValue() {
    skipSeparators();
    if (atEnd()) return "";
    char32_t ch = peek();
    if (ch == U'#') return parseSTONSymbol();
    if (ch == U'\'') return parseSTONString();
    if (ch == U'[') {
        auto arr = parseSTONArray();
        // Encode as comma-separated string for ClassSpec consumption
        Egg::string result;
        for (size_t i = 0; i < arr.size(); i++) {
            if (i > 0) result += ",";
            result += arr[i];
        }
        return result;
    }
    // Bare word / number
    size_t start = _pos;
    while (!atEnd() && peek() != U' ' && peek() != U'\t' && peek() != U'\n' &&
           peek() != U'\r' && peek() != U',' && peek() != U'}' && peek() != U':')
        _pos++;
    return _source.substr(start, _pos - start);
}

Egg::string TonelReader::parseSTONSymbol() {
    next(); // skip '#'
    if (!atEnd() && peek() == U'\'') return parseSTONString(); // #'foo bar'
    size_t start = _pos;
    while (!atEnd() && peek() != U' ' && peek() != U'\t' && peek() != U'\n' &&
           peek() != U'\r' && peek() != U',' && peek() != U'}' && peek() != U':' &&
           peek() != U']')
        _pos++;
    return _source.substr(start, _pos - start);
}

Egg::string TonelReader::parseSTONString() {
    next(); // skip opening '
    Egg::string result;
    while (!atEnd()) {
        char32_t c = next();
        if (c == U'\'') {
            if (!atEnd() && peek() == U'\'') {
                next(); // escaped ''
                result += U'\'';
            } else {
                break;
            }
        } else {
            result += c;
        }
    }
    return result;
}

std::vector<Egg::string> TonelReader::parseSTONArray() {
    std::vector<Egg::string> arr;
    next(); // skip '['
    while (true) {
        skipSeparators();
        if (atEnd() || peek() == U']') { if (!atEnd()) next(); break; }
        arr.push_back(parseSTONValue());
        skipSeparators();
        if (!atEnd() && peek() == U',') next();
    }
    return arr;
}

} // namespace Egg
