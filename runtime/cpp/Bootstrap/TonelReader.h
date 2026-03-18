/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.

    Stream-based Tonel reader modelled after modules/Tonel/TonelReader.st.
 */

#ifndef _TONEL_READER_H_
#define _TONEL_READER_H_

#include <string>
#include <vector>
#include <map>
#include "CodeSpecs.h"

namespace Egg {

class TonelReader {
public:
    TonelReader() {}

    // Parse a complete Tonel-format .st file and return a ClassSpec.
    // The returned ClassSpec is heap-allocated; caller takes ownership.
    ClassSpec* parseFile(const std::string& utf8Source);

private:
    // Stream-style helpers
    bool  atEnd() const;
    char32_t peek() const;
    char32_t next();
    void  skipSeparators();
    void  skipLine();

    // Tonel structure (mirrors TonelReader.st >> read)
    void readComments();
    Egg::string readType();
    std::map<Egg::string, Egg::string> readDefinition();
    void readMethods(ClassSpec* spec, MetaclassSpec* meta);
    void readMethod(ClassSpec* spec, MetaclassSpec* meta);

    // Block / literal skipping (mirrors TonelReader.st)
    Egg::string nextBlock();
    void skipString();
    void skipComment();
    void skipToMatch(char32_t ch);

    // Minimal STON helpers
    std::map<Egg::string, Egg::string> parseSTONMap();
    Egg::string parseSTONValue();
    Egg::string parseSTONSymbol();
    Egg::string parseSTONString();
    std::vector<Egg::string> parseSTONArray();

    // State
    Egg::string _source;
    size_t      _pos = 0;
};

} // namespace Egg

#endif // _TONEL_READER_H_
