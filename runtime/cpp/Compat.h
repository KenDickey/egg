#pragma once

#include <cstdint>

#if defined(_MSC_VER)
#include <intrin.h>
#endif

namespace Egg {

// Portable signed multiplication with overflow detection on intptr_t.
// Returns true if the multiplication overflows; otherwise stores the
// product in *result and returns false.
static inline bool mul_overflow_iptr(intptr_t a, intptr_t b, intptr_t* result) {
#if defined(__GNUC__) || defined(__clang__)
    return __builtin_mul_overflow(a, b, result);
#elif defined(_MSC_VER) && defined(_M_X64)
    int64_t hi;
    int64_t lo = _mul128(a, b, &hi);
    *result = static_cast<intptr_t>(lo);
    return hi != (lo >> 63);
#else
#error "mul_overflow_iptr: unsupported compiler/architecture"
#endif
}

} // namespace Egg
