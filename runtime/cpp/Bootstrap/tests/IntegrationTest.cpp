/*
    Integration tests for the bootstrapper.
    Tests class creation and method compilation without full heap.
 */

#include <catch2/catch.hpp>
#include "../TonelReader.h"
#include "../../Compiler/SSmalltalkCompiler.h"
#include "../../Compiler/Parser/SSmalltalkScanner.h"
#include "../../Compiler/Parser/SSmalltalkParser.h"
#include "../../Compiler/AST/SMethodNode.h"
#include "../../Compiler/AST/SSelectorNode.h"
#include "../../Compiler/TreecodeEncoder.h"

using namespace Egg;

TEST_CASE("Integration: Parse class and extract methods", "[integration]") {
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
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->name() == "Point");
    REQUIRE(spec->instVarNames().size() == 2);
    
    REQUIRE(spec->methods().size() == 2);
}

TEST_CASE("Integration: Compile method to treecode", "[integration]") {
    SSmalltalkCompiler compiler;
    
    std::string methodSource = "yourself\n\t^self";
    compiler.scanner()->on_(methodSource);
    SMethodNode* node = compiler.parser()->parseMethod();
    REQUIRE(node != nullptr);
    REQUIRE(node->selector() != nullptr);
    
    SSelectorNode* sel = dynamic_cast<SSelectorNode*>(node->selector());
    REQUIRE(sel != nullptr);
    REQUIRE(sel->symbol() == "yourself");
    
    TreecodeEncoder encoder;
    auto treecode = encoder.encodeMethod(node);
    REQUIRE(!treecode.empty());
}

TEST_CASE("Integration: Compile accessor method", "[integration]") {
    SSmalltalkCompiler compiler;
    
    std::string methodSource = "x\n\t^x";
    compiler.scanner()->on_(methodSource);
    SMethodNode* node = compiler.parser()->parseMethod();
    REQUIRE(node != nullptr);
    
    SSelectorNode* sel = dynamic_cast<SSelectorNode*>(node->selector());
    REQUIRE(sel != nullptr);
    REQUIRE(sel->symbol() == "x");
}

TEST_CASE("Integration: Compile keyword method", "[integration]") {
    SSmalltalkCompiler compiler;
    
    std::string methodSource = "x: aNumber\n\tx := aNumber";
    compiler.scanner()->on_(methodSource);
    SMethodNode* node = compiler.parser()->parseMethod();
    REQUIRE(node != nullptr);
    
    SSelectorNode* sel = dynamic_cast<SSelectorNode*>(node->selector());
    REQUIRE(sel != nullptr);
    REQUIRE(sel->symbol() == "x:");
}

TEST_CASE("Integration: Full pipeline - parse source then compile", "[integration]") {
    TonelReader reader;
    SSmalltalkCompiler compiler;
    
    std::string source = R"(
Class {
	#name : 'Test',
	#superclass : 'Object'
}

{ #category : 'testing' }
Test >> yourself [
	^self
]
)";
    
    auto spec = reader.parseFile(source);
    REQUIRE(spec->name() == "Test");
    
    REQUIRE(spec->methods().size() == 1);
    
    // Compile the method
    compiler.scanner()->on_(spec->methods()[0].source());
    SMethodNode* node = compiler.parser()->parseMethod();
    REQUIRE(node != nullptr);
    
    TreecodeEncoder encoder;
    auto treecode = encoder.encodeMethod(node);
    REQUIRE(!treecode.empty());
}
