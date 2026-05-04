# C++ Coding Style (runtime/cpp)

This file complements the project-wide [CODING_STYLE.md](../../CODING_STYLE.md).
The general philosophy (favor simplicity, minimize text to read, keep methods
short, no comments unless they document a public API, no abbreviations) applies
verbatim. The rules below cover the C++-specific concerns that arise from
porting the Smalltalk runtime.

See also [TRANSPILATION_RULES.md](TRANSPILATION_RULES.md) for the rules used
when porting individual Smalltalk methods to C++.

## Naming

### Methods

Translated directly from Smalltalk: keyword colons become trailing underscores,
one underscore per keyword.

```cpp
at_(index)                  // Smalltalk: at:
at_put_(index, value)       // Smalltalk: at:put:
sendLocal_to_with_(s, r, a) // Smalltalk: sendLocal:to:with:
```

A method that takes **no arguments** has **no trailing underscore**:

```cpp
yourself()
parseMethod()
literalArray()
```

A handful of legacy zero-arg methods still carry a trailing underscore where the
unsuffixed name collides with a C++ keyword (e.g. `return_`, `new_`). Keep the
underscore in those cases and document why.

### Instance Variables

Prefix with `_`:

```cpp
HeapObject* _runtime;
std::map<Egg::string, HeapObject*> _classes;
```

### Class Names

Transpiled classes keep their Smalltalk name verbatim (`SSmalltalkParser`,
`SMethodNode`). Library / collection types use the C++ standard library
(`std::vector`, `std::map`, `std::string`) — not the Smalltalk equivalents.

### Locals and Arguments

Same rules as the Smalltalk style guide: name by usage > contents > type, prefix
arguments with `a` / `an`, no abbreviations, no reusing a name for a different
value.

## Methods

### Keep Methods Short

A method should do one thing and have one level of iteration. Extract helper
methods aggressively. Prefer many tiny methods over one long one.

### Switch Statements

If a `switch` `case` block has **more than a few lines** of body, extract the
body into a helper method. Long `case` bodies turn the `switch` into a giant
function and obscure the dispatch table.

```cpp
// Avoid
switch (lit.tag) {
    case LiteralValue::LargeInteger: {
        const auto& bytes = lit.asLargeIntegerBytes();
        bool negative = lit.isLargeIntegerNegative();
        ... 15 more lines of byte juggling ...
        return obj;
    }
    case LiteralValue::Character: {
        ... 8 more lines ...
    }
}

// Preferred
switch (lit.tag) {
    case LiteralValue::LargeInteger:
        return newLargeInteger_(lit.asLargeIntegerBytes(),
                                lit.isLargeIntegerNegative());
    case LiteralValue::Character:
        return transferCharacter_(lit.asCharacter());
}
```

A `case` body of one or two statements is fine inline. Anything longer becomes a
helper named after what it produces.

### No Silent Failures

Do not fail silently. Every failure path must raise visibility:

- Programmer errors / invariants → `ASSERT(...)`.
- Runtime conditions the caller should observe → `Egg::error("...")` (aborts) or
  `warning("...")` (continues).
- Returning `nullptr`, `nil`, `0`, or a default-constructed value to indicate
  "something went wrong" without logging is forbidden.

```cpp
// Forbidden
int parseDigit(char c) {
    if (c >= '0' && c <= '9') return c - '0';
    return 0;  // silent: caller can't tell '0' from "invalid"
}

// Preferred
int parseDigit(char c) {
    if (c >= '0' && c <= '9') return c - '0';
    error("invalid digit");
    return 0; // unreachable
}
```

### No Defensive Checks

Do not add null checks or sanity checks for conditions the caller is contracted
to never produce. Validate at the system boundary, then trust internal callers.
Use `assert(...)` to document invariants without paying for runtime checks in
release builds.

## Formatting

- Use the existing indentation style of each file. Do not reformat files you
  are not changing.
- Headers go in `*.h`, definitions in `*.cpp`. Inline only short trivial
  accessors and the `LiteralValue`-style headers that need to be visible to
  templates.
- Prefer `auto` for obvious types (factory results, iterators), spell the type
  out when it adds information.

## Comments

Same rule as the Smalltalk side: comments are not allowed except as headers on
public APIs or when something genuinely surprising needs to be flagged. If you
feel the need for a comment in the middle of a method, extract a helper whose
name explains the intent.

## Memory and Pointers

- Use raw pointers for VM objects (`HeapObject*`, `Object*`); they are managed
  by the GC, not by C++ ownership.
- Use `GCedRef` to anchor objects across allocating calls (any
  `_runtime->sendLocal*`, `new*` may move things).
- Use `std::unique_ptr` for owned C++ resources (parsers, scanners). Do not
  `new`/`delete` manually.

## Error Reporting Helpers

The runtime exposes two free functions:

- `error(message)`  — prints and aborts. Use for unrecoverable conditions.
- `warning(message)` — prints and returns. Use for recoverable conditions
  where a fallback exists.

Always include enough context in the message to identify the culprit (class
name, selector, file path, etc.).
