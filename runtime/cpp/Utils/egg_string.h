/*
    Copyright (c) 2025, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _EGG_STRING_H_
#define _EGG_STRING_H_

#include <string>
#include <cstdint>
#include <cstring>
#include <ostream>

namespace Egg {

/**
 * Unicode string type for the Egg compiler pipeline.
 * Internally stores UTF-32 code points (std::u32string).
 * Implicitly converts from UTF-8 (std::string, const char*)
 * and from UTF-32 (std::u32string, const char32_t*).
 *
 * Use .toUtf8() at output boundaries (error messages, file I/O,
 * standard library functions that require narrow strings).
 */
class string : public std::u32string {
private:
    // Decode a UTF-8 byte sequence into a UTF-32 code point string
    static std::u32string fromUtf8(const char* data, size_t len) {
        std::u32string result;
        result.reserve(len); // upper bound
        size_t i = 0;
        while (i < len) {
            unsigned char first = static_cast<unsigned char>(data[i]);
            uint32_t cp;
            int bytes;
            if ((first & 0x80) == 0) {
                cp = first; bytes = 1;
            } else if ((first & 0xE0) == 0xC0) {
                cp = first & 0x1F; bytes = 2;
            } else if ((first & 0xF0) == 0xE0) {
                cp = first & 0x0F; bytes = 3;
            } else if ((first & 0xF8) == 0xF0) {
                cp = first & 0x07; bytes = 4;
            } else {
                cp = first; bytes = 1; // invalid byte, take as-is
            }
            for (int j = 1; j < bytes && i + j < len; j++) {
                cp = (cp << 6) | (static_cast<unsigned char>(data[i + j]) & 0x3F);
            }
            result += static_cast<char32_t>(cp);
            i += bytes;
        }
        return result;
    }

    static std::u32string fromUtf8(const std::string& s) {
        return fromUtf8(s.data(), s.size());
    }

public:
    // Inherit all std::u32string constructors
    using std::u32string::u32string;
    using std::u32string::operator=;

    // Default / copy / move
    string() = default;
    string(const string&) = default;
    string(string&&) = default;
    string& operator=(const string&) = default;
    string& operator=(string&&) = default;

    // Converting from std::u32string
    string(const std::u32string& s) : std::u32string(s) {}
    string(std::u32string&& s) : std::u32string(std::move(s)) {}

    // UTF-8 constructors — assume input is UTF-8
    string(const char* s) : std::u32string(fromUtf8(s, std::strlen(s))) {}
    string(const std::string& s) : std::u32string(fromUtf8(s)) {}

    // Assignment from UTF-8
    string& operator=(const char* s) {
        static_cast<std::u32string&>(*this) = fromUtf8(s, std::strlen(s));
        return *this;
    }
    string& operator=(const std::string& s) {
        static_cast<std::u32string&>(*this) = fromUtf8(s);
        return *this;
    }

    // ---- UTF-8 output ----

    std::string toUtf8() const {
        std::string result;
        for (char32_t cp : *this) {
            if (cp < 0x80) {
                result += static_cast<char>(cp);
            } else if (cp < 0x800) {
                result += static_cast<char>(0xC0 | (cp >> 6));
                result += static_cast<char>(0x80 | (cp & 0x3F));
            } else if (cp < 0x10000) {
                result += static_cast<char>(0xE0 | (cp >> 12));
                result += static_cast<char>(0x80 | ((cp >> 6) & 0x3F));
                result += static_cast<char>(0x80 | (cp & 0x3F));
            } else if (cp < 0x110000) {
                result += static_cast<char>(0xF0 | (cp >> 18));
                result += static_cast<char>(0x80 | ((cp >> 12) & 0x3F));
                result += static_cast<char>(0x80 | ((cp >> 6) & 0x3F));
                result += static_cast<char>(0x80 | (cp & 0x3F));
            }
        }
        return result;
    }

    // ---- Latin-1 support ----

    bool isLatin1() const {
        for (char32_t cp : *this)
            if (cp > 0xFF) return false;
        return true;
    }

    // Returns a new[]-allocated Latin-1 byte array. Caller must delete[].
    char* toBytes() const {
        char* bytes = new char[size()];
        for (size_type i = 0; i < size(); i++)
            bytes[i] = static_cast<char>((*this)[i]);
        return bytes;
    }

    // ---- Override methods that return std::u32string to return Egg::string ----

    string substr(size_type pos = 0, size_type count = npos) const {
        return string(std::u32string::substr(pos, count));
    }

    // ---- Concatenation returning Egg::string ----

    string operator+(const string& other) const {
        return string(static_cast<const std::u32string&>(*this) +
                      static_cast<const std::u32string&>(other));
    }

    string operator+(char32_t ch) const {
        string result(*this);
        result.push_back(ch);
        return result;
    }

    string operator+(const char* s) const {
        return *this + string(s);
    }

    friend string operator+(const char* lhs, const string& rhs) {
        return string(lhs) + rhs;
    }

    // ---- Compound assignment ----

    string& operator+=(const string& other) {
        std::u32string::operator+=(static_cast<const std::u32string&>(other));
        return *this;
    }

    string& operator+=(char32_t ch) {
        std::u32string::operator+=(ch);
        return *this;
    }

    string& operator+=(const char* s) {
        std::u32string::operator+=(fromUtf8(s, std::strlen(s)));
        return *this;
    }

    // ---- Comparison with char* (UTF-8) ----

    bool operator==(const char* s) const { return *this == string(s); }
    bool operator!=(const char* s) const { return !(*this == string(s)); }

    friend bool operator==(const char* lhs, const string& rhs) { return rhs == lhs; }
    friend bool operator!=(const char* lhs, const string& rhs) { return !(rhs == lhs); }

    // ---- Ordering (for std::map keys) ----

    bool operator<(const string& other) const {
        return static_cast<const std::u32string&>(*this) <
               static_cast<const std::u32string&>(other);
    }

    // ---- Stream output (writes UTF-8) ----

    friend std::ostream& operator<<(std::ostream& os, const string& s) {
        return os << s.toUtf8();
    }
};

// ---- Unicode character classification ----

// Unicode-aware isLetter: true for any Unicode letter (Lu, Ll, Lt, Lm, Lo categories)
inline bool isLetter(char32_t ch) {
    if (ch < 128) return std::isalpha(static_cast<int>(ch)) != 0;
    // Latin Extended / IPA / Spacing Modifier Letters
    if (ch >= 0x00C0 && ch <= 0x024F) return true;
    // Greek and Coptic
    if (ch >= 0x0370 && ch <= 0x03FF) return true;
    // Cyrillic
    if (ch >= 0x0400 && ch <= 0x04FF) return true;
    // Armenian, Hebrew, Arabic, etc.
    if (ch >= 0x0530 && ch <= 0x08FF) return true;
    // Devanagari through Myanmar
    if (ch >= 0x0900 && ch <= 0x109F) return true;
    // Georgian, Hangul Jamo, Ethiopic, Cherokee, etc.
    if (ch >= 0x10A0 && ch <= 0x1FFF) return true;
    // General use: CJK Unified Ideographs
    if (ch >= 0x4E00 && ch <= 0x9FFF) return true;
    // Hangul syllables
    if (ch >= 0xAC00 && ch <= 0xD7AF) return true;
    // Latin Extended Additional and beyond
    if (ch >= 0x1E00 && ch <= 0x1EFF) return true;
    // Other letter-like regions (simplified check)
    if (ch >= 0x2C00 && ch <= 0x2DFF) return true; // Glagolitic, Coptic
    if (ch >= 0xA000 && ch <= 0xA4CF) return true; // Yi, Lisu
    if (ch >= 0xFB00 && ch <= 0xFDFF) return true; // Alphabetic Presentation Forms, Arabic Forms
    // Supplementary planes (Emoji excluded, but rare letters)
    if (ch >= 0x10000 && ch <= 0x1007F) return true; // Linear B Syllabary
    if (ch >= 0x10080 && ch <= 0x100FF) return true; // Linear B Ideograms
    if (ch >= 0x10300 && ch <= 0x1034F) return true; // Old Italic
    if (ch >= 0x10400 && ch <= 0x1044F) return true; // Deseret
    if (ch >= 0x20000 && ch <= 0x2A6DF) return true; // CJK Unified Ideographs Extension B
    return false;
}

// Unicode-aware isDigit: true for any Unicode digit (Nd category)
inline bool isDigit(char32_t ch) {
    if (ch < 128) return std::isdigit(static_cast<int>(ch)) != 0;
    // Common Unicode digit ranges (Nd category)
    // Arabic-Indic digits
    if (ch >= 0x0660 && ch <= 0x0669) return true;
    // Extended Arabic-Indic digits  
    if (ch >= 0x06F0 && ch <= 0x06F9) return true;
    // Devanagari digits
    if (ch >= 0x0966 && ch <= 0x096F) return true;
    // Bengali, Gurmukhi, Gujarati, etc. digits (each block has 0x_966-0x_96F pattern)
    if (ch >= 0x09E6 && ch <= 0x09EF) return true;
    if (ch >= 0x0A66 && ch <= 0x0A6F) return true;
    if (ch >= 0x0AE6 && ch <= 0x0AEF) return true;
    if (ch >= 0x0B66 && ch <= 0x0B6F) return true;
    if (ch >= 0x0BE6 && ch <= 0x0BEF) return true;
    if (ch >= 0x0C66 && ch <= 0x0C6F) return true;
    if (ch >= 0x0CE6 && ch <= 0x0CEF) return true;
    if (ch >= 0x0D66 && ch <= 0x0D6F) return true;
    if (ch >= 0x0E50 && ch <= 0x0E59) return true;
    if (ch >= 0x0ED0 && ch <= 0x0ED9) return true;
    if (ch >= 0x0F20 && ch <= 0x0F29) return true;
    if (ch >= 0x1040 && ch <= 0x1049) return true;
    if (ch >= 0xFF10 && ch <= 0xFF19) return true; // Fullwidth digits
    return false;
}

// Unicode-aware isUppercase: true for uppercase letters
inline bool isUppercase(char32_t ch) {
    if (ch < 128) return std::isupper(static_cast<int>(ch)) != 0;
    // Latin Extended uppercase ranges
    if (ch >= 0x00C0 && ch <= 0x00D6) return true;
    if (ch >= 0x00D8 && ch <= 0x00DE) return true;
    // Many Unicode uppercase letters in Lu category follow patterns
    // Latin Extended-A (even code points are often uppercase)
    if (ch >= 0x0100 && ch <= 0x017E && (ch % 2 == 0)) return true;
    // Latin Extended-B
    if (ch >= 0x01A0 && ch <= 0x01AF && (ch % 2 == 0)) return true;
    // Greek uppercase
    if (ch >= 0x0391 && ch <= 0x03A1) return true;
    if (ch >= 0x03A3 && ch <= 0x03A9) return true;
    // Cyrillic uppercase
    if (ch >= 0x0410 && ch <= 0x042F) return true;
    return false;
}

} // namespace Egg

// Allow Egg::string as key in std::unordered_map
namespace std {
template<>
struct hash<Egg::string> {
    size_t operator()(const Egg::string& s) const {
        return hash<std::u32string>()(s);
    }
};
} // namespace std

#endif // _EGG_STRING_H_
