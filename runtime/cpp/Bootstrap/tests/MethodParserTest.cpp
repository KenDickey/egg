/*
    Tests for method parsing from Tonel format.
 */

#include <catch2/catch.hpp>
#include "../TonelReader.h"

using namespace Egg;

TEST_CASE("MethodParser: Parse simple instance method", "[methods]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Point',
	#superclass : 'Object',
	#instVars : [ 'x', 'y' ]
}

{ #category : 'accessing' }
Point >> x [
	^x
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->methods().size() == 1);
    REQUIRE(spec->methods()[0].source().find(Egg::string("x")) != Egg::string::npos);
    REQUIRE(spec->methods()[0].source().find(Egg::string("^x")) != Egg::string::npos);
}

TEST_CASE("MethodParser: Parse multiple instance methods", "[methods]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Point',
	#superclass : 'Object',
	#instVars : [ 'x', 'y' ]
}

{ #category : 'accessing' }
Point >> x [
	^x
]

{ #category : 'accessing' }
Point >> y [
	^y
]

{ #category : 'accessing' }
Point >> x: aNumber [
	x := aNumber
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->methods().size() == 3);
}

TEST_CASE("MethodParser: Parse class method", "[methods]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Point',
	#superclass : 'Object',
	#instVars : [ 'x', 'y' ]
}

{ #category : 'instance creation' }
Point class >> x: anX y: aY [
	^self new x: anX; y: aY
]

{ #category : 'accessing' }
Point >> x [
	^x
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->metaclass()->methods().size() == 1);
    REQUIRE(spec->methods().size() == 1);
}

TEST_CASE("MethodParser: No methods returns empty vector", "[methods]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Empty',
	#superclass : 'Object'
}
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->methods().empty());
}

TEST_CASE("MethodParser: Method with nested brackets", "[methods]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Test',
	#superclass : 'Object'
}

{ #category : 'testing' }
Test >> testMethod [
	| x |
	x := [1 + 2].
	^x value
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->methods().size() == 1);
    REQUIRE(spec->methods()[0].source().find(Egg::string("[1 + 2]")) != Egg::string::npos);
}

TEST_CASE("MethodParser: Method with string containing brackets", "[methods]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Test',
	#superclass : 'Object'
}

{ #category : 'testing' }
Test >> testString [
	^'hello [world]'
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->methods().size() == 1);
}

TEST_CASE("MethodParser: Method with keyword selector", "[methods]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Test',
	#superclass : 'Object'
}

{ #category : 'accessing' }
Test >> at: index put: value [
	^self basicAt: index put: value
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->methods().size() == 1);
    REQUIRE(spec->methods()[0].source().find(Egg::string("at: index put: value")) != Egg::string::npos);
}

TEST_CASE("MethodParser: Method with comment", "[methods]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Test',
	#superclass : 'Object'
}

{ #category : 'testing' }
Test >> yourself [
	"Answer the receiver"
	^self
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->methods().size() == 1);
}

TEST_CASE("MethodParser: Binary method", "[methods]") {
    TonelReader reader;
    std::string source = R"(
Class {
	#name : 'Number',
	#superclass : 'Magnitude'
}

{ #category : 'arithmetic' }
Number >> + aNumber [
	^self subclassResponsibility
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->methods().size() == 1);
    REQUIRE(spec->methods()[0].source().find(Egg::string("+ aNumber")) != Egg::string::npos);
}

TEST_CASE("MethodParser: FindMatchingBracket with nesting", "[methods]") {
    TonelReader reader;
    // Just test that multiple methods with nested brackets are handled correctly
    std::string source = R"(
Class {
	#name : 'Test',
	#superclass : 'Object'
}

{ #category : 'testing' }
Test >> one [
	[1 to: 10 do: [:i | i printString]] value
]

{ #category : 'testing' }
Test >> two [
	^2
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->methods().size() == 2);
}
