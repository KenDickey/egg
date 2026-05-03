/*
    Tests for treecode bytecode compilation.
 */

#include <catch2/catch.hpp>
#include "../../Compiler/SSmalltalkCompiler.h"
#include "../../Compiler/CompilationResult.h"
#include "../../Compiler/Backend/SCompiledMethod.h"

using namespace Egg;

static const std::vector<uint8_t>& compile(SSmalltalkCompiler& compiler,
                                           const std::string& source) {
    auto* result = compiler.compileMethod_(source);
    REQUIRE(result != nullptr);
    auto* method = static_cast<SCompiledMethod*>(result->method());
    REQUIRE(method != nullptr);
    return method->treecodes();
}

TEST_CASE("Compilation: yourself method produces valid treecode", "[compilation]") {
    SSmalltalkCompiler compiler;
    const auto& treecode = compile(compiler, "yourself\n\t^self");
    REQUIRE(!treecode.empty());

    // First byte should be MethodId (101)
    REQUIRE(treecode[0] == 101);

    // Should contain ReturnId (109) and IdentifierId (103)
    bool hasReturn = false;
    bool hasIdentifier = false;
    for (auto byte : treecode) {
        if (byte == 109) hasReturn = true;
        if (byte == 103) hasIdentifier = true;
    }
    REQUIRE(hasReturn);
    REQUIRE(hasIdentifier);
}

TEST_CASE("Compilation: accessor method produces valid treecode", "[compilation]") {
    SSmalltalkCompiler compiler;
    const auto& treecode = compile(compiler, "x\n\t^x");
    REQUIRE(!treecode.empty());
    REQUIRE(treecode[0] == 101); // MethodId
}
