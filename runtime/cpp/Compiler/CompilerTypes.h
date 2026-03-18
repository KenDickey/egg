/*
    Copyright (c) 2025-2026, Javier Pimás.
    See (MIT) license in root directory.
 */

#ifndef _COMPILER_TYPES_H_
#define _COMPILER_TYPES_H_

#include <cstdint>

namespace Egg {

/**
 * AST Node Type identifiers used in treecode encoding
 */
enum AstNodeType : uint8_t {
    MethodId = 101,
    BlockId = 102,
    IdentifierId = 103,
    LiteralId = 104,
    MessageId = 105,
    CascadeId = 106,
    BraceId = 107,
    AssignmentId = 108,
    ReturnId = 109,
    PragmaId = 110
};

/**
 * Binding Type identifiers used in treecode encoding
 */
enum AstBindingType : uint8_t {
    NilBindingId = 1,
    TrueBindingId = 2,
    FalseBindingId = 3,
    ArgumentBindingId = 4,
    TemporaryBindingId = 5,
    SelfBindingId = 6,
    SuperBindingId = 7,
    DynamicVarId = 14,
    NestedDynamicVarId = 15,
    PushRid = 50,
    PopRid = 51
};

/**
 * Closure Element Type identifiers
 * Must match CompilerModule >> initializeClosureElementIds
 */
enum ClosureElementType : uint8_t {
    ClosureSelf = 0,
    ClosureLocalArgument = 1,
    ClosureEnvironment = 2,
    ClosureEnvironmentValue = 3,
    ClosureInlinedArgument = 4
};

/**
 * Compiled Method flags
 */
struct CompiledMethodFlags {
    static constexpr uint32_t ArgCount = 0x0000001F;      // bits 0-4
    static constexpr uint32_t TempCount = 0x000003E0;     // bits 5-9
    static constexpr uint32_t EnvCount = 0x00007C00;      // bits 10-14
    static constexpr uint32_t BlockCount = 0x000F8000;    // bits 15-19
    static constexpr uint32_t CapturesSelf = 0x00100000;  // bit 20
    static constexpr uint32_t HasEnvironment = 0x00200000; // bit 21
    static constexpr uint32_t HasFrame = 0x00400000;      // bit 22
    static constexpr uint32_t Debuggable = 0x00800000;    // bit 23
};

/**
 * Compiled Block flags
 */
struct CompiledBlockFlags {
    static constexpr uint32_t ArgCount = 0x0000001F;      // bits 0-4
    static constexpr uint32_t TempCount = 0x000003E0;     // bits 5-9
    static constexpr uint32_t EnvCount = 0x00007C00;      // bits 10-14
    static constexpr uint32_t CapturesSelf = 0x00100000;  // bit 20
    static constexpr uint32_t UsesHome = 0x00200000;      // bit 21
};

} // namespace Egg

#endif // _COMPILER_TYPES_H_
