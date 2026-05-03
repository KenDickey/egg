# Compiler Tests

Catch2-based unit tests for the Egg Smalltalk compiler.

See [`runtime/cpp/README.md`](../../README.md) for build & test instructions.
This suite is registered with CTest as `compiler_tests` (with `[scanner]`
and `[parser]` Catch2 tags also exposed as `ScannerTests` and `ParserTests`).

## Test files

- `ScannerTest.cpp` — lexical analyzer tests (ported from
  `runtime/pharo/Powerlang-SCompiler-Tests/SmalltalkScannerTest.class.st`)
- `ParserTest.cpp` — parser tests (ported from
  `runtime/pharo/Powerlang-SCompiler-Tests/SmalltalkParserTest.class.st`)
- `test_main.cpp` — Catch2 entry point

## Adding a test

```cpp
TEST_CASE_METHOD(ScannerTestFixture, "Description", "[scanner]") {
    setUp();
    scan("source code");
    auto token = next();
    REQUIRE(token->isName());
}
```
