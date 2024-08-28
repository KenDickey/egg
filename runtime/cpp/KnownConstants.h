#ifndef _KNOWNCONSTANTS_H_
#define _KNOWNCONSTANTS_H_

/**
 *  These constants may be autogenerated from the contents of
 *  Kernel module in the future
 */

namespace Egg {

enum BlockFlags {
    CapturesHome = 0x1,
    CapturesSelf = 0x1
};

enum BlockCapturedVariables {
    Self = 0,
    LocalArgument = 1,
    Environment = 2,
    EnvironmentValue = 3
};

enum Offsets {
    AssociationKey = 0,
    AssociationValue = 1,

    BehaviorClass = 0,
    BehaviorMethodDictionary = 1,
    BehaviorNext = 2,

    BlockFormat = 0,
    BlockExecutableCode = 1,
    BlockMethod = 2,

    ClosureBlock = 0,

    DictionaryTally = 0,
    DictionaryTable = 1,

    MethodFormat = 0,
    MethodExecutableCode = 1,
    MethodTreecodes = 2,
    MethodClassBinding = 3,
    MethodSelector = 4,
    MethodSourceCode = 5,
    MethodInstSize = 6,

    ModuleName = 0,
    ModuleVersion = 1,
    ModuleExports = 2,
    ModuleNamespace = 3,

	SpeciesSuperclass = 0,
	SpeciesInstanceBehavior = 1,
	SpeciesFormat = 2,
	SpeciesOrganization = 3,
	SpeciesInstanceVariables = 4,
    ClassName = 5,
    ClassSubclasses = 6,
    ClassNamespaces = 7,
    ClassModule = 8,
    MetaclassClass = 5,

    CompiledCodeExecutableCode = 1,

    ExecutableCodePlatformCode = 0,
    ExecutableCodeCompiledCode = 1
};

} // namespace Egg

#endif // ~ _KNOWNCONSTANTS_H_ ~
