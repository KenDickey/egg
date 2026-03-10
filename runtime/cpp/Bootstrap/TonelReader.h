/*
    Copyright (c) 2025, Javier Pimás.
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
    egg::string readType();
    std::map<egg::string, egg::string> readDefinition();
    void readMethods(ClassSpec* spec, MetaclassSpec* meta);
    void readMethod(ClassSpec* spec, MetaclassSpec* meta);

    // Block / literal skipping (mirrors TonelReader.st)
    egg::string nextBlock();
    void skipString();
    void skipComment();
    void skipToMatch(char32_t ch);

    // Minimal STON helpers
    std::map<egg::string, egg::string> parseSTONMap();
    egg::string parseSTONValue();
    egg::string parseSTONSymbol();
    egg::string parseSTONString();
    std::vector<egg::string> parseSTONArray();

    // State
    egg::string _source;
    size_t      _pos = 0;
};

} // namespace Egg

#endif // _TONEL_READER_H_
