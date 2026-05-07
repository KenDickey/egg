/*
    Tests for TonelReader class definition parsing.
    These tests use inline strings, no file I/O.
 */

#include <catch2/catch.hpp>
#include "../TonelReader.h"

using namespace Egg;

TEST_CASE("TonelReader: Parse simple class definition", "[parser]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Point',
	#superclass : 'Object',
	#instVars : [
		'x',
		'y'
	],
	#category : 'Kernel',
	#package : 'Kernel'
}
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->name() == "Point");
    REQUIRE(spec->supername() == "Object");
    REQUIRE(spec->instVarNames().size() == 2);
    REQUIRE(spec->instVarNames()[0] == "x");
    REQUIRE(spec->instVarNames()[1] == "y");
}

TEST_CASE("TonelReader: Parse class with no instance variables", "[parser]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'UndefinedObject',
	#superclass : 'Object',
	#category : 'Kernel',
	#package : 'Kernel'
}
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->name() == "UndefinedObject");
    REQUIRE(spec->supername() == "Object");
    REQUIRE(spec->instVarNames().empty());
}

TEST_CASE("TonelReader: Parse class with many instance variables", "[parser]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'CompiledMethod',
	#superclass : 'Object',
	#instVars : [
		'format',
		'executableCode',
		'treecodes',
		'classBinding',
		'selector',
		'source'
	],
	#category : 'Kernel',
	#package : 'Kernel'
}
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->name() == "CompiledMethod");
    REQUIRE(spec->instVarNames().size() == 6);
    REQUIRE(spec->instVarNames()[0] == "format");
    REQUIRE(spec->instVarNames()[5] == "source");
}

TEST_CASE("TonelReader: Extract class name", "[parser]") {
    TonelReader reader;
    std::string source = "Class {\n\t#name : 'Boolean',\n\t#superclass : 'Object'\n}";
    auto spec = reader.parseFile(source);
    REQUIRE(spec->name() == "Boolean");
}

TEST_CASE("TonelReader: Extract superclass", "[parser]") {
    TonelReader reader;
    std::string source = "Class {\n\t#name : 'SmallInteger',\n\t#superclass : 'Integer'\n}";
    auto spec = reader.parseFile(source);
    REQUIRE(spec->supername() == "Integer");
}
