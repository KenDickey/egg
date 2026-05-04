# Egg Smalltalk Compiler — C++ Port

A literal port of the Egg Smalltalk compiler from `modules/Compiler/` to C++,
enabling bootstrapping directly from C++, no other subsystem required.

## Status

**All components ported and functional.** The compiler parses, analyzes, and
builds compiled methods for the full Egg Smalltalk language.

- Kernel bootstrap: all methods compiled, no failures
- TinyBenchmarks: runs successfully
- All compiler and bootstrap tests pass

See `../PORT_STATUS.md` for the full method-by-method porting table.  
See `../TRANSPILATION_RULES.md` for the ST -> C++ translation rules.

## Architecture

```
Source Code → Scanner → Tokens → Parser → AST → SemanticVisitor → SMethodNode::buildMethod()
                                                                         ↓
                                                                  SCompiledMethod (literals, metadata)
                                                                         ↓
                                                              TreecodeEncoder (treecode bytecodes)
```

## Directory Structure

```
Compiler/
├── *.h/cpp     Pipeline entry points (SCompiler, SSmalltalkCompiler),
│               semantic analysis, message inlining, treecode encoding,
│               shared types (LiteralValue, Stretch, CompilationError, ...)
├── Parser/     Scanner, recursive-descent parser, token hierarchy and
│               character stream utilities
├── AST/        Parse-node class hierarchy and visitor interface
├── Binding/    Variable bindings (locals, args, fields, globals, pseudo-vars)
│               and the scope / environment chain used during semantic analysis
├── Backend/    Compiler output objects (SCompiledMethod / SCompiledBlock)
└── tests/      Catch2 unit tests for the scanner and parser
```

## Build

See [`runtime/cpp/README.md`](../README.md) for build and test instructions.
The compiler is built into `egg_compiler` (a static library inside the `egg`
binary) and exercised by the `compiler_tests` CTest target under
[`tests/`](tests/).

## Usage

```cpp
#include "Compiler/SSmalltalkCompiler.h"

Egg::SSmalltalkCompiler compiler;

// Compile a method (parse + semantic analysis + build)
auto result = compiler.compileMethod_(
    "factorial\n"
    "  ^self > 1\n"
    "    ifTrue: [self * (self - 1) factorial]\n"
    "    ifFalse: [1]"
);
```

## Key Differences from Smalltalk

| Aspect | Smalltalk | C++ |
|--------|-----------|-----|
| Memory | Garbage collected | `std::unique_ptr` / `new` with manual ownership |
| Collections | OrderedCollection, Dictionary | `std::vector`, `std::map` |
| Strings | Symbol, String | `egg::string` (UTF-32 wrapper) |
| Literals | Polymorphic objects | `LiteralValue` tagged union |
| Comments | Scanner returns comment tokens | Scanner absorbs comments internally |
| Errors | Exception/signal system | `CompilationError` (std::runtime_error) |

## Remaining Work

1. **Error recovery** — no `protect:` equivalent for graceful failure
2. **FFI pragmas** — `<callback:>` and `<cdecl:>` not ported (not needed for bootstrap)
