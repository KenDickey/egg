'From Cuis7.9 [latest update: #7998] on 30 June 2026 at 8:34:53 am'!
'Description Selected https://github.com/powerlang/egg/module classes transliterated via  Cuis-Smalltalk-Tonel-Browser.'!
!provides: 'Powerlang' 1 3!
!requires: 'BeeCompatibility' 1 65 nil!
!requires: 'ExchangeFormat-Tonel-Lite' 1 73 nil!
SystemOrganization addCategory: 'Powerlang-ModuleSpecReader'!
SystemOrganization addCategory: 'Powerlang-CodeSpecs'!
SystemOrganization addCategory: 'Powerlang-ArgParser'!
SystemOrganization addCategory: 'Powerlang-EPM'!
SystemOrganization addCategory: #'Powerlang-Core-LMR'!
SystemOrganization addCategory: #'Powerlang-Core-SCompiler'!
SystemOrganization addCategory: #'Powerlang-Core-SCompiler-Bindings'!
SystemOrganization addCategory: #'Powerlang-Core-SCompiler-Smalltalk'!
SystemOrganization addCategory: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SystemOrganization addCategory: #'Powerlang-Core-SExpressions'!
SystemOrganization addCategory: #'Powerlang-Kernel'!
SystemOrganization addCategory: #'Powerlang-ModuleImporter'!
SystemOrganization addCategory: 'Powerlang-Compiler.Tests'!


!classDefinition: #SFFIDescriptor category: #'Powerlang-Core-SCompiler'!
ByteArray variableByteSubclass: #SFFIDescriptor
	instanceVariableNames: ''
	classVariableNames: 'FFICallingConventions FFITypes'
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'SFFIDescriptor class' category: #'Powerlang-Core-SCompiler'!
SFFIDescriptor class
	instanceVariableNames: 'FFICallingConventions FFITypes'!

!classDefinition: #LMRArrayedCollection category: #'Powerlang-Kernel'!
ArrayedCollection subclass: #LMRArrayedCollection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'LMRArrayedCollection class' category: #'Powerlang-Kernel'!
LMRArrayedCollection class
	instanceVariableNames: ''!

!classDefinition: #LMRSymbol category: #'Powerlang-Kernel'!
Symbol variableByteSubclass: #LMRSymbol
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'LMRSymbol class' category: #'Powerlang-Kernel'!
LMRSymbol class
	instanceVariableNames: ''!

!classDefinition: #WideSymbol category: #'Powerlang-Kernel'!
Symbol variableByteSubclass: #WideSymbol
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'WideSymbol class' category: #'Powerlang-Kernel'!
WideSymbol class
	instanceVariableNames: ''!

!classDefinition: #WideString category: #'Powerlang-Kernel'!
String variableByteSubclass: #WideString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'WideString class' category: #'Powerlang-Kernel'!
WideString class
	instanceVariableNames: ''!

!classDefinition: #CharacterArray category: #'Powerlang-ModuleImporter'!
CharacterSequence subclass: #CharacterArray
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ModuleImporter'!
!classDefinition: 'CharacterArray class' category: #'Powerlang-ModuleImporter'!
CharacterArray class
	instanceVariableNames: ''!

!classDefinition: #LMRCharacterArray category: #'Powerlang-Kernel'!
CharacterArray subclass: #LMRCharacterArray
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'LMRCharacterArray class' category: #'Powerlang-Kernel'!
LMRCharacterArray class
	instanceVariableNames: ''!

!classDefinition: #Namespace category: #'Powerlang-Kernel'!
Dictionary subclass: #Namespace
	instanceVariableNames: 'parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'Namespace class' category: #'Powerlang-Kernel'!
Namespace class
	instanceVariableNames: ''!

!classDefinition: #WeakIdentityDictionary category: #'Powerlang-Kernel'!
Dictionary subclass: #WeakIdentityDictionary
	instanceVariableNames: 'critical'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'WeakIdentityDictionary class' category: #'Powerlang-Kernel'!
WeakIdentityDictionary class
	instanceVariableNames: ''!

!classDefinition: #SCompilationError category: #'Powerlang-Core-SCompiler'!
Error subclass: #SCompilationError
	instanceVariableNames: 'compiler resumable retryable stretch'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'SCompilationError class' category: #'Powerlang-Core-SCompiler'!
SCompilationError class
	instanceVariableNames: ''!

!classDefinition: #SInvalidPragmaError category: #'Powerlang-Core-SCompiler'!
SCompilationError subclass: #SInvalidPragmaError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'SInvalidPragmaError class' category: #'Powerlang-Core-SCompiler'!
SInvalidPragmaError class
	instanceVariableNames: ''!

!classDefinition: #SUndeclaredIdentifierError category: #'Powerlang-Core-SCompiler'!
SCompilationError subclass: #SUndeclaredIdentifierError
	instanceVariableNames: 'identifier assigned'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'SUndeclaredIdentifierError class' category: #'Powerlang-Core-SCompiler'!
SUndeclaredIdentifierError class
	instanceVariableNames: ''!

!classDefinition: #ArgParser category: 'Powerlang-ArgParser'!
Object subclass: #ArgParser
	instanceVariableNames: 'name description commands globalOptions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ArgParser'!
!classDefinition: 'ArgParser class' category: 'Powerlang-ArgParser'!
ArgParser class
	instanceVariableNames: ''!

!classDefinition: #Command category: 'Powerlang-ArgParser'!
Object subclass: #Command
	instanceVariableNames: 'name description options positionalNames action subcommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ArgParser'!
!classDefinition: 'Command class' category: 'Powerlang-ArgParser'!
Command class
	instanceVariableNames: ''!

!classDefinition: #Option category: 'Powerlang-ArgParser'!
Object subclass: #Option
	instanceVariableNames: 'short long description required hasValue defaultValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ArgParser'!
!classDefinition: 'Option class' category: 'Powerlang-ArgParser'!
Option class
	instanceVariableNames: ''!

!classDefinition: #ParseResult category: 'Powerlang-ArgParser'!
Object subclass: #ParseResult
	instanceVariableNames: 'command positionals options'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ArgParser'!
!classDefinition: 'ParseResult class' category: 'Powerlang-ArgParser'!
ParseResult class
	instanceVariableNames: ''!

!classDefinition: #MethodSpec category: 'Powerlang-CodeSpecs'!
Object subclass: #MethodSpec
	instanceVariableNames: 'selector class source category module ast'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-CodeSpecs'!
!classDefinition: 'MethodSpec class' category: 'Powerlang-CodeSpecs'!
MethodSpec class
	instanceVariableNames: ''!

!classDefinition: #ModuleSpec category: 'Powerlang-CodeSpecs'!
Object subclass: #ModuleSpec
	instanceVariableNames: 'name description classes extendedClasses subclassifiedClasses imports dependencies'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-CodeSpecs'!
!classDefinition: 'ModuleSpec class' category: 'Powerlang-CodeSpecs'!
ModuleSpec class
	instanceVariableNames: ''!

!classDefinition: #SpeciesSpec category: 'Powerlang-CodeSpecs'!
Object subclass: #SpeciesSpec
	instanceVariableNames: 'instanceVariables methods module format'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-CodeSpecs'!
!classDefinition: 'SpeciesSpec class' category: 'Powerlang-CodeSpecs'!
SpeciesSpec class
	instanceVariableNames: ''!

!classDefinition: #ClassSpec category: 'Powerlang-CodeSpecs'!
SpeciesSpec subclass: #ClassSpec
	instanceVariableNames: 'name supername classVariables sharedPools metaclass variable pointers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-CodeSpecs'!
!classDefinition: 'ClassSpec class' category: 'Powerlang-CodeSpecs'!
ClassSpec class
	instanceVariableNames: ''!

!classDefinition: #MetaclassSpec category: 'Powerlang-CodeSpecs'!
SpeciesSpec subclass: #MetaclassSpec
	instanceVariableNames: 'class'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-CodeSpecs'!
!classDefinition: 'MetaclassSpec class' category: 'Powerlang-CodeSpecs'!
MetaclassSpec class
	instanceVariableNames: ''!

!classDefinition: #IdentifierBinder category: #'Powerlang-Core-SCompiler'!
Object subclass: #IdentifierBinder
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'IdentifierBinder class' category: #'Powerlang-Core-SCompiler'!
IdentifierBinder class
	instanceVariableNames: ''!

!classDefinition: #StaticBinder category: #'Powerlang-Core-SCompiler'!
IdentifierBinder subclass: #StaticBinder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'StaticBinder class' category: #'Powerlang-Core-SCompiler'!
StaticBinder class
	instanceVariableNames: ''!

!classDefinition: #LocalEnvironment category: #'Powerlang-Core-SCompiler'!
Object subclass: #LocalEnvironment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'ClosureElementTypes'
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'LocalEnvironment class' category: #'Powerlang-Core-SCompiler'!
LocalEnvironment class
	instanceVariableNames: ''!

!classDefinition: #ArrayEnvironment category: #'Powerlang-Core-SCompiler'!
LocalEnvironment subclass: #ArrayEnvironment
	instanceVariableNames: 'index'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'ArrayEnvironment class' category: #'Powerlang-Core-SCompiler'!
ArrayEnvironment class
	instanceVariableNames: ''!

!classDefinition: #StackEnvironment category: #'Powerlang-Core-SCompiler'!
LocalEnvironment subclass: #StackEnvironment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'StackEnvironment class' category: #'Powerlang-Core-SCompiler'!
StackEnvironment class
	instanceVariableNames: ''!

!classDefinition: #ArgumentEnvironment category: #'Powerlang-Core-SCompiler'!
StackEnvironment subclass: #ArgumentEnvironment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'ArgumentEnvironment class' category: #'Powerlang-Core-SCompiler'!
ArgumentEnvironment class
	instanceVariableNames: ''!

!classDefinition: #InlinedArgEnvironment category: #'Powerlang-Core-SCompiler'!
StackEnvironment subclass: #InlinedArgEnvironment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'InlinedArgEnvironment class' category: #'Powerlang-Core-SCompiler'!
InlinedArgEnvironment class
	instanceVariableNames: ''!

!classDefinition: #MessageInliner category: #'Powerlang-Core-SCompiler'!
Object subclass: #MessageInliner
	instanceVariableNames: 'message'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'MessageInliner class' category: #'Powerlang-Core-SCompiler'!
MessageInliner class
	instanceVariableNames: ''!

!classDefinition: #SCompilationResult category: #'Powerlang-Core-SCompiler'!
Object subclass: #SCompilationResult
	instanceVariableNames: 'compiler error ast method'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'SCompilationResult class' category: #'Powerlang-Core-SCompiler'!
SCompilationResult class
	instanceVariableNames: ''!

!classDefinition: #SCompiler category: #'Powerlang-Core-SCompiler'!
Object subclass: #SCompiler
	instanceVariableNames: 'errorHandler result class'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'SCompiler class' category: #'Powerlang-Core-SCompiler'!
SCompiler class
	instanceVariableNames: ''!

!classDefinition: #SParseTreeVisitor category: #'Powerlang-Core-SCompiler'!
Object subclass: #SParseTreeVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'SParseTreeVisitor class' category: #'Powerlang-Core-SCompiler'!
SParseTreeVisitor class
	instanceVariableNames: ''!

!classDefinition: #SSemanticVisitor category: #'Powerlang-Core-SCompiler'!
SParseTreeVisitor subclass: #SSemanticVisitor
	instanceVariableNames: 'inliner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'SSemanticVisitor class' category: #'Powerlang-Core-SCompiler'!
SSemanticVisitor class
	instanceVariableNames: ''!

!classDefinition: #TreecodeEncoder category: #'Powerlang-Core-SExpressions'!
SParseTreeVisitor subclass: #TreecodeEncoder
	instanceVariableNames: 'method stream script'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SExpressions'!
!classDefinition: 'TreecodeEncoder class' category: #'Powerlang-Core-SExpressions'!
TreecodeEncoder class
	instanceVariableNames: ''!

!classDefinition: #ScriptScope category: #'Powerlang-Core-SCompiler'!
Object subclass: #ScriptScope
	instanceVariableNames: 'script arguments temporaries stackSize envSize captureSelf'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'ScriptScope class' category: #'Powerlang-Core-SCompiler'!
ScriptScope class
	instanceVariableNames: ''!

!classDefinition: #BlockScope category: #'Powerlang-Core-SCompiler'!
ScriptScope subclass: #BlockScope
	instanceVariableNames: 'environments captured'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'BlockScope class' category: #'Powerlang-Core-SCompiler'!
BlockScope class
	instanceVariableNames: ''!

!classDefinition: #MethodScope category: #'Powerlang-Core-SCompiler'!
ScriptScope subclass: #MethodScope
	instanceVariableNames: 'pseudo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler'!
!classDefinition: 'MethodScope class' category: #'Powerlang-Core-SCompiler'!
MethodScope class
	instanceVariableNames: ''!

!classDefinition: #Binding category: #'Powerlang-Core-SCompiler-Bindings'!
Object subclass: #Binding
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'Binding class' category: #'Powerlang-Core-SCompiler-Bindings'!
Binding class
	instanceVariableNames: ''!

!classDefinition: #DynamicBinding category: #'Powerlang-Core-SCompiler-Bindings'!
Binding subclass: #DynamicBinding
	instanceVariableNames: ''
	classVariableNames: 'Default'
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'DynamicBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
DynamicBinding class
	instanceVariableNames: 'Default'!

!classDefinition: #NestedDynamicBinding category: #'Powerlang-Core-SCompiler-Bindings'!
DynamicBinding subclass: #NestedDynamicBinding
	instanceVariableNames: 'parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'NestedDynamicBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
NestedDynamicBinding class
	instanceVariableNames: ''!

!classDefinition: #LiteralBinding category: #'Powerlang-Core-SCompiler-Bindings'!
Binding subclass: #LiteralBinding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'LiteralBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
LiteralBinding class
	instanceVariableNames: ''!

!classDefinition: #FalseBinding category: #'Powerlang-Core-SCompiler-Bindings'!
LiteralBinding subclass: #FalseBinding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'FalseBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
FalseBinding class
	instanceVariableNames: ''!

!classDefinition: #NilBinding category: #'Powerlang-Core-SCompiler-Bindings'!
LiteralBinding subclass: #NilBinding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'NilBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
NilBinding class
	instanceVariableNames: ''!

!classDefinition: #TrueBinding category: #'Powerlang-Core-SCompiler-Bindings'!
LiteralBinding subclass: #TrueBinding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'TrueBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
TrueBinding class
	instanceVariableNames: ''!

!classDefinition: #LocalBinding category: #'Powerlang-Core-SCompiler-Bindings'!
Binding subclass: #LocalBinding
	instanceVariableNames: 'index environment declaration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'LocalBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
LocalBinding class
	instanceVariableNames: ''!

!classDefinition: #ArgumentBinding category: #'Powerlang-Core-SCompiler-Bindings'!
LocalBinding subclass: #ArgumentBinding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'ArgumentBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
ArgumentBinding class
	instanceVariableNames: ''!

!classDefinition: #TemporaryBinding category: #'Powerlang-Core-SCompiler-Bindings'!
LocalBinding subclass: #TemporaryBinding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'TemporaryBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
TemporaryBinding class
	instanceVariableNames: ''!

!classDefinition: #SelfBinding category: #'Powerlang-Core-SCompiler-Bindings'!
Binding subclass: #SelfBinding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'SelfBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
SelfBinding class
	instanceVariableNames: ''!

!classDefinition: #SuperBinding category: #'Powerlang-Core-SCompiler-Bindings'!
SelfBinding subclass: #SuperBinding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Bindings'!
!classDefinition: 'SuperBinding class' category: #'Powerlang-Core-SCompiler-Bindings'!
SuperBinding class
	instanceVariableNames: ''!

!classDefinition: #SSmalltalkCompiler category: #'Powerlang-Core-SCompiler-Smalltalk'!
Object subclass: #SSmalltalkCompiler
	instanceVariableNames: 'frontend source ast result headless blocks leaf activeScript'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk'!
!classDefinition: 'SSmalltalkCompiler class' category: #'Powerlang-Core-SCompiler-Smalltalk'!
SSmalltalkCompiler class
	instanceVariableNames: ''!

!classDefinition: #SSmalltalkParser category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
Object subclass: #SSmalltalkParser
	instanceVariableNames: 'compiler scanner token next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SSmalltalkParser class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SSmalltalkParser class
	instanceVariableNames: ''!

!classDefinition: #SSmalltalkScanner category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
Object subclass: #SSmalltalkScanner
	instanceVariableNames: 'compiler stream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SSmalltalkScanner class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SSmalltalkScanner class
	instanceVariableNames: ''!

!classDefinition: #SToken category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
Object subclass: #SToken
	instanceVariableNames: 'compiler stretch comments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SToken class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SToken class
	instanceVariableNames: ''!

!classDefinition: #SEndToken category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SToken subclass: #SEndToken
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SEndToken class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SEndToken class
	instanceVariableNames: ''!

!classDefinition: #SParseNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SToken subclass: #SParseNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SParseNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode class
	instanceVariableNames: ''!

!classDefinition: #SAssignmentNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SAssignmentNode
	instanceVariableNames: 'assignees expression operators'
	classVariableNames: 'Token'
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SAssignmentNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SAssignmentNode class
	instanceVariableNames: 'Token'!

!classDefinition: #SBraceNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SBraceNode
	instanceVariableNames: 'elements message'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SBraceNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SBraceNode class
	instanceVariableNames: ''!

!classDefinition: #SCascadeNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SCascadeNode
	instanceVariableNames: 'receiver messages optimized'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SCascadeNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SCascadeNode class
	instanceVariableNames: ''!

!classDefinition: #SCommentNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SCommentNode
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SCommentNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SCommentNode class
	instanceVariableNames: ''!

!classDefinition: #SIdentifierNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SIdentifierNode
	instanceVariableNames: 'name binding'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SIdentifierNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SIdentifierNode class
	instanceVariableNames: ''!

!classDefinition: #SLiteralNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SLiteralNode
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SLiteralNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SLiteralNode class
	instanceVariableNames: ''!

!classDefinition: #SNumberNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SLiteralNode subclass: #SNumberNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SNumberNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SNumberNode class
	instanceVariableNames: ''!

!classDefinition: #SMessageNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SMessageNode
	instanceVariableNames: 'selector receiver arguments inlined'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SMessageNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SMessageNode class
	instanceVariableNames: ''!

!classDefinition: #SCascadeMessageNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SMessageNode subclass: #SCascadeMessageNode
	instanceVariableNames: 'cascade'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SCascadeMessageNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SCascadeMessageNode class
	instanceVariableNames: ''!

!classDefinition: #SReturnNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SReturnNode
	instanceVariableNames: 'expression return'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SReturnNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SReturnNode class
	instanceVariableNames: ''!

!classDefinition: #SScriptNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SScriptNode
	instanceVariableNames: 'statements arguments temporaries children scope'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SScriptNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SScriptNode class
	instanceVariableNames: ''!

!classDefinition: #SBlockNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SScriptNode subclass: #SBlockNode
	instanceVariableNames: 'inlined index parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SBlockNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SBlockNode class
	instanceVariableNames: ''!

!classDefinition: #SMethodNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SScriptNode subclass: #SMethodNode
	instanceVariableNames: 'selector pragma'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SMethodNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SMethodNode class
	instanceVariableNames: ''!

!classDefinition: #SSelectorNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SParseNode subclass: #SSelectorNode
	instanceVariableNames: 'symbol keywords'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SSelectorNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SSelectorNode class
	instanceVariableNames: ''!

!classDefinition: #SPragmaNode category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SToken subclass: #SPragmaNode
	instanceVariableNames: 'type name info'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SPragmaNode class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SPragmaNode class
	instanceVariableNames: ''!

!classDefinition: #SSymbolicToken category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SToken subclass: #SSymbolicToken
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SSymbolicToken class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SSymbolicToken class
	instanceVariableNames: ''!

!classDefinition: #SDelimiterToken category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SSymbolicToken subclass: #SDelimiterToken
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SDelimiterToken class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SDelimiterToken class
	instanceVariableNames: ''!

!classDefinition: #SStringToken category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SSymbolicToken subclass: #SStringToken
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-SCompiler-Smalltalk-Parser'!
!classDefinition: 'SStringToken class' category: #'Powerlang-Core-SCompiler-Smalltalk-Parser'!
SStringToken class
	instanceVariableNames: ''!

!classDefinition: #Config category: 'Powerlang-EPM'!
Object subclass: #Config
	instanceVariableNames: 'project user merged'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-EPM'!
!classDefinition: 'Config class' category: 'Powerlang-EPM'!
Config class
	instanceVariableNames: ''!

!classDefinition: #ProjectGenerator category: 'Powerlang-EPM'!
Object subclass: #ProjectGenerator
	instanceVariableNames: 'name dir'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-EPM'!
!classDefinition: 'ProjectGenerator class' category: 'Powerlang-EPM'!
ProjectGenerator class
	instanceVariableNames: ''!

!classDefinition: #LMRObject category: #'Powerlang-Kernel'!
Object subclass: #LMRObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'LMRObject class' category: #'Powerlang-Kernel'!
LMRObject class
	instanceVariableNames: ''!

!classDefinition: #Module category: #'Powerlang-Kernel'!
Object subclass: #Module
	instanceVariableNames: 'name version exports namespace hash cachedLookups classes extensions overriden requires'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'Module class' category: #'Powerlang-Kernel'!
Module class
	instanceVariableNames: ''!

!classDefinition: #ArgParserModule category: 'Powerlang-ArgParser'!
Module subclass: #ArgParserModule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ArgParser'!
!classDefinition: 'ArgParserModule class' category: 'Powerlang-ArgParser'!
ArgParserModule class
	instanceVariableNames: ''!

!classDefinition: #CodeSpecsModule category: 'Powerlang-CodeSpecs'!
Module subclass: #CodeSpecsModule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-CodeSpecs'!
!classDefinition: 'CodeSpecsModule class' category: 'Powerlang-CodeSpecs'!
CodeSpecsModule class
	instanceVariableNames: ''!

!classDefinition: #TestsModule category: 'Powerlang-Compiler.Tests'!
Module subclass: #TestsModule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Compiler.Tests'!
!classDefinition: 'TestsModule class' category: 'Powerlang-Compiler.Tests'!
TestsModule class
	instanceVariableNames: ''!

!classDefinition: #CompilerModule category: #'Powerlang-Core-LMR'!
Module subclass: #CompilerModule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Core-LMR'!
!classDefinition: 'CompilerModule class' category: #'Powerlang-Core-LMR'!
CompilerModule class
	instanceVariableNames: ''!

!classDefinition: #EPMModule category: 'Powerlang-EPM'!
Module subclass: #EPMModule
	instanceVariableNames: 'args parser config'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-EPM'!
!classDefinition: 'EPMModule class' category: 'Powerlang-EPM'!
EPMModule class
	instanceVariableNames: ''!

!classDefinition: #LMRModule category: #'Powerlang-Kernel'!
Module subclass: #LMRModule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'LMRModule class' category: #'Powerlang-Kernel'!
LMRModule class
	instanceVariableNames: ''!

!classDefinition: #ModuleImporterModule category: #'Powerlang-ModuleImporter'!
Module subclass: #ModuleImporterModule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ModuleImporter'!
!classDefinition: 'ModuleImporterModule class' category: #'Powerlang-ModuleImporter'!
ModuleImporterModule class
	instanceVariableNames: ''!

!classDefinition: #NumberParser category: #'Powerlang-Kernel'!
Object subclass: #NumberParser
	instanceVariableNames: 'stream error return'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'NumberParser class' category: #'Powerlang-Kernel'!
NumberParser class
	instanceVariableNames: ''!

!classDefinition: #ObjectReference category: #'Powerlang-Kernel'!
Object subclass: #ObjectReference
	instanceVariableNames: 'source sourceOffset target absolute'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'ObjectReference class' category: #'Powerlang-Kernel'!
ObjectReference class
	instanceVariableNames: ''!

!classDefinition: #Species category: #'Powerlang-Kernel'!
Object subclass: #Species
	instanceVariableNames: 'superclass instanceBehavior format organization instanceVariables'
	classVariableNames: 'Flags'
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'Species class' category: #'Powerlang-Kernel'!
Species class
	instanceVariableNames: 'Flags'!

!classDefinition: #StarToken category: #'Powerlang-Kernel'!
Object subclass: #StarToken
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'StarToken class' category: #'Powerlang-Kernel'!
StarToken class
	instanceVariableNames: ''!

!classDefinition: #Stretch category: #'Powerlang-Kernel'!
Object subclass: #Stretch
	instanceVariableNames: 'start end'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'Stretch class' category: #'Powerlang-Kernel'!
Stretch class
	instanceVariableNames: ''!

!classDefinition: #StringPattern category: #'Powerlang-Kernel'!
Object subclass: #StringPattern
	instanceVariableNames: 'stream tokens'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'StringPattern class' category: #'Powerlang-Kernel'!
StringPattern class
	instanceVariableNames: ''!

!classDefinition: #Unicode category: #'Powerlang-Kernel'!
Object subclass: #Unicode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'Unicode class' category: #'Powerlang-Kernel'!
Unicode class
	instanceVariableNames: ''!

!classDefinition: #UTF16 category: #'Powerlang-Kernel'!
Unicode subclass: #UTF16
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'UTF16 class' category: #'Powerlang-Kernel'!
UTF16 class
	instanceVariableNames: ''!

!classDefinition: #UTF32 category: #'Powerlang-Kernel'!
Unicode subclass: #UTF32
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'UTF32 class' category: #'Powerlang-Kernel'!
UTF32 class
	instanceVariableNames: ''!

!classDefinition: #UTF8 category: #'Powerlang-Kernel'!
Unicode subclass: #UTF8
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'UTF8 class' category: #'Powerlang-Kernel'!
UTF8 class
	instanceVariableNames: ''!

!classDefinition: #ModuleLoader category: #'Powerlang-ModuleImporter'!
Object subclass: #ModuleLoader
	instanceVariableNames: 'module spec'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ModuleImporter'!
!classDefinition: 'ModuleLoader class' category: #'Powerlang-ModuleImporter'!
ModuleLoader class
	instanceVariableNames: ''!

!classDefinition: #NameOfSubclass category: #'Powerlang-ModuleImporter'!
Object subclass: #NameOfSubclass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ModuleImporter'!
!classDefinition: 'NameOfSubclass class' category: #'Powerlang-ModuleImporter'!
NameOfSubclass class
	instanceVariableNames: ''!

!classDefinition: #ModuleSpecReader category: 'Powerlang-ModuleSpecReader'!
Object subclass: #ModuleSpecReader
	instanceVariableNames: 'module path metadata'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-ModuleSpecReader'!
!classDefinition: 'ModuleSpecReader class' category: 'Powerlang-ModuleSpecReader'!
ModuleSpecReader class
	instanceVariableNames: ''!

!classDefinition: #MessageInlinerTest category: 'Powerlang-Compiler.Tests'!
TestCase subclass: #MessageInlinerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Compiler.Tests'!
!classDefinition: 'MessageInlinerTest class' category: 'Powerlang-Compiler.Tests'!
MessageInlinerTest class
	instanceVariableNames: ''!

!classDefinition: #SmalltalkScannerTest category: 'Powerlang-Compiler.Tests'!
TestCase subclass: #SmalltalkScannerTest
	instanceVariableNames: 'scanner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Compiler.Tests'!
!classDefinition: 'SmalltalkScannerTest class' category: 'Powerlang-Compiler.Tests'!
SmalltalkScannerTest class
	instanceVariableNames: ''!

!classDefinition: #LMRClosure category: #'Powerlang-Kernel'!
ProtoObject subclass: #LMRClosure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'LMRClosure class' category: #'Powerlang-Kernel'!
LMRClosure class
	instanceVariableNames: ''!

!classDefinition: #LMRProtoObject category: #'Powerlang-Kernel'!
ProtoObject subclass: #LMRProtoObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'LMRProtoObject class' category: #'Powerlang-Kernel'!
LMRProtoObject class
	instanceVariableNames: ''!

!classDefinition: #LMRSpecies category: #'Powerlang-Kernel'!
ProtoObject subclass: #LMRSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Powerlang-Kernel'!
!classDefinition: 'LMRSpecies class' category: #'Powerlang-Kernel'!
LMRSpecies class
	instanceVariableNames: ''!


!LMRArrayedCollection commentStamp: '<historical>' prior: 0!
Copyright (c) 2023, Javier Pimás.
	See (MIT) license in root directory.
!

!LMRSymbol commentStamp: '<historical>' prior: 0!
Copyright (c) 2022, Javier Pimás.
	See (MIT) license in root directory.
!

!WideSymbol commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!WideString commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!LMRCharacterArray commentStamp: '<historical>' prior: 0!
Copyright (c) 2023, Javier Pimás.
	See (MIT) license in root directory.
!

!Namespace commentStamp: '<historical>' prior: 0!
Copyright (c) 2022 Javier Pimás. 
    See (MIT) license in root directory.
!

!WeakIdentityDictionary commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!ArgParser commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!Command commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!Option commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!ParseResult commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!MethodSpec commentStamp: '<historical>' prior: 0!
Copyright (c) 2024 Quorum Software.
	See (MIT) license in root directory.
!

!ModuleSpec commentStamp: '<historical>' prior: 0!
Copyright (c) 2024 Quorum Software.
	See (MIT) license in root directory.
!

!SpeciesSpec commentStamp: '<historical>' prior: 0!
Copyright (c) 2024 Quorum Software.
	See (MIT) license in root directory.
!

!ClassSpec commentStamp: '<historical>' prior: 0!
Copyright (c) 2024 Quorum Software.
	See (MIT) license in root directory.
!

!MetaclassSpec commentStamp: '<historical>' prior: 0!
Copyright (c) 2024 Quorum Software.
	See (MIT) license in root directory.
!

!MessageInliner commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!Config commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!ProjectGenerator commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!LMRObject commentStamp: '<historical>' prior: 0!
Copyright (c) 2024, Javier Pimás.
	See (MIT) license in root directory.
!

!Module commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!ArgParserModule commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!CodeSpecsModule commentStamp: '<historical>' prior: 0!
Copyright (c) 2022, Quorum Software. 
    See (MIT) license in root directory.
!

!TestsModule commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!CompilerModule commentStamp: '<historical>' prior: 0!
Copyright (c) 2022, Javier Pimás. 
    See (MIT) license in root directory.
!

!EPMModule commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!LMRModule commentStamp: '<historical>' prior: 0!
Copyright (c) 2024, Javier Pimás.
	See (MIT) license in root directory.
!

!ModuleImporterModule commentStamp: '<historical>' prior: 0!
Copyright (c) 2022, Quorum Software.
    See (MIT) license in root directory.
!

!NumberParser commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!ObjectReference commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!Species commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!StarToken commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!Stretch commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!StringPattern commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!Unicode commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!UTF16 commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna.
    See (MIT) license in root directory.
!

!UTF32 commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna.
    See (MIT) license in root directory.
!

!UTF8 commentStamp: '<historical>' prior: 0!
Copyright (c) 2020 Aucerna. 
    See (MIT) license in root directory.
!

!ModuleLoader commentStamp: '<historical>' prior: 0!
Copyright (c) 2024 Quorum Software.
	See (MIT) license in root directory.
!

!ModuleSpecReader commentStamp: '<historical>' prior: 0!
Copyright (c) 2024 Quorum Software.
	See (MIT) license in root directory.
!

!MessageInlinerTest commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!SmalltalkScannerTest commentStamp: '<historical>' prior: 0!
Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
!

!LMRClosure commentStamp: '<historical>' prior: 0!
Copyright (c) 2022, Javier Pimás.
	See (MIT) license in root directory.
!

!LMRProtoObject commentStamp: '<historical>' prior: 0!
Copyright (c) 2022, Javier Pimás.
	See (MIT) license in root directory.
!

!LMRSpecies commentStamp: '<historical>' prior: 0!
Copyright (c) 2022, Javier Pimás.
	See (MIT) license in root directory.
!

!SFFIDescriptor methodsFor: 'calls' stamp: 'KenD 28/Jun/2026 13:27:40'!
arguments: aCollection
	self replaceFrom: 1 to: aCollection size with: aCollection
! !

!SFFIDescriptor methodsFor: 'calls' stamp: 'KenD 28/Jun/2026 13:27:40'!
callingConvention: anInteger
	self at: self size put: anInteger
! !

!SFFIDescriptor methodsFor: 'calls' stamp: 'KenD 28/Jun/2026 13:27:40'!
return: anInteger
	self at: self size - 1 put: anInteger
! !

!SFFIDescriptor class methodsFor: 'class initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	self initializeFFITypes; initializeCallingConventions
! !

!SFFIDescriptor class methodsFor: 'class initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initializeCallingConventions
	FFICallingConventions := Dictionary new.
	FFICallingConventions
		at: 'cdecl' put: 20;
		at: 'com' put: 21;
		at: 'callback' put: 22
! !

!SFFIDescriptor class methodsFor: 'class initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initializeFFITypes
	FFITypes := Dictionary new.
	FFITypes
		at: 'uint8' put: 0;
		at: 'sint8' put: 1;
		at: 'uint16' put: 2;
		at: 'sint16' put: 3;
		at: 'uint32' put: 4;
		at: 'sint32' put: 5;
		at: 'uint64' put: 6;
		at: 'sint64' put: 7;

		at: 'float' put: 8;
		at: 'double' put: 9;

		at: 'uchar' put: 10;
		at: 'schar' put: 11;
		at: 'ushort' put: 12;
		at: 'sshort' put: 13;
		at: 'ulong' put: 14;
		at: 'slong' put: 15;
		at: 'ularge' put: 16;
		at: 'large' put: 17;
		at: 'longdouble' put: 18;
		at: 'pointer' put: 19;
		at: 'complex-float' put: 20;
		at: 'complex-double' put: 21;
		at: 'complex-longdouble' put: 22;

		at: 'void' put: 23
! !

!SFFIDescriptor class methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
ret: aString args: aCollection cc: ccName
	| args return cc result |
	args := aCollection
		collect: [ :argname | 
			FFITypes
				at: argname asString
				ifAbsent: [ self error: 'undefined argument type ' , argname ] ].
	return := FFITypes
		at: aString
		ifAbsent: [ self error: 'undefined result type ' , aString ].
	cc := FFICallingConventions
		at: ccName
		ifAbsent: [ self error: 'unsupported calling convention ' , ccName ].
	result := self new: args size + 2.
	^ result
		callingConvention: cc;
		return: return;
		arguments: args
! !

!LMRSymbol methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
flushCacheFor: species
	GlobalDispatchCache current flush: self forSpecies: species.
	SendSite flush: self
! !

!WideSymbol methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026 13:27:38'!
<= aString
	^UTF16 current isString: self lessThanOrEqualTo: aString
! !

!WideSymbol methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asByteCharacters
	| n result |
	n := self size.
	result := Symbol new: n.
	1 to: n do: [:i | | code char |
		code := self codeAt: i.
		char := code < 256 ifTrue: [code] ifFalse: [$? asInteger].
		result byteAt: i put: char].
	^result
! !

!WideSymbol methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asLowercase
	^UTF16 current lowercaseOf: self
! !

!WideSymbol methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asString
	| n string |
	n := self size.
	string := WideString new: n.
	^string replaceFrom: 1 to: n with: self
! !

!WideSymbol methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asUppercase
	^UTF16 current uppercaseOf: self
! !

!WideSymbol methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asWideSymbol
	^self
! !

!WideSymbol methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
at: index
	| cp |
	cp := self checkIndex: index; codeAt: index.
	^Character value: cp
! !

!WideSymbol methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
at: index putCode: codePoint
	^self
		checkIndex: index;
		uLongAtOffset: index - 1 * 4 put: codePoint
! !

!WideSymbol methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
atValid: index
	| cp |
	cp := self codeAt: index.
	^Character value: cp
! !

!WideSymbol methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
size
	^self _size // 4
! !

!WideSymbol methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
sizeInBytes
	^self size * 4
! !

!WideSymbol methodsFor: 'unassigned' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicSize
	^self _size
! !

!WideSymbol methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
codeAt: index
	^self uLongAtOffset: index - 1 * 4
! !

!WideSymbol methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
species
	^WideString
! !

!WideSymbol methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
td1
	| m td1 |
	m := self size.
	td1 := Dictionary new: m.
	m to: 1 by: -1 do: [:i | | code |
		code := self uLongAtOffset: i - 1 * 4.
		td1 at: code + 1 ifAbsentPut: [m - i + 1]].
	^td1
! !

!WideSymbol methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isByteCompliant
	^false
! !

!WideSymbol methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isWide
	^true
! !

!WideSymbol methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isWideSymbol
	^true
! !

!WideSymbol class methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
findInterned: aString
	| symbol string |
	string := aString reduced.
	string == aString ifFalse: [^super findInterned: string].
	symbol := aString bytes changeClassTo: self.
	^SymbolTable lookup: symbol
! !

!WideSymbol class methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
intern: aString
	| symbol canonical |
	aString isByteCompliant ifTrue: [^aString reduced asSymbol].
	symbol := aString bytes changeClassTo: self.
	canonical := SymbolTable lookup: symbol.
	canonical == nil ifTrue: [^SymbolTable add: symbol].
	^canonical
! !

!WideString methodsFor: 'operations' stamp: 'KenD 28/Jun/2026 13:27:38'!
, aString
	| n string |
	aString isString ifFalse: [^super , aString].
	n := self size.
	string := WideString new: n + aString size.
	^string
		replaceBytesFrom: 1 to: self sizeInBytes with: self startingAt: 1;
		replaceFrom: n + 1 to: string size with: aString startingAt: 1
! !

!WideString methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026 13:27:38'!
<= aString
	^UTF16 current isString: self lessThanOrEqualTo: aString
! !

!WideString methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026 13:27:38'!
hash
	| hash |
	hash := self size.
	0
		to: self sizeInBytes - 4
		by: 4
		do: [:i | hash := (hash hashMultiply: 16r19660D)
			bitXor: (self uLongAtOffset: i)].
	^hash
! !

!WideString methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asByteCharacters
	| n result |
	n := self size.
	result := String new: n.
	1 to: n do: [:i | | code char |
		code := self codeAt: i.
		char := code < 256 ifTrue: [code] ifFalse: [$? asInteger].
		result byteAt: i put: char].
	^result
! !

!WideString methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asLowercase
	^UTF16 current lowercaseOf: self
! !

!WideString methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asSymbol
	^WideSymbol intern: self
! !

!WideString methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asUppercase
	^UTF16 current uppercaseOf: self
! !

!WideString methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
asWideString
	^self
! !

!WideString methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
existingSymbol
	^WideSymbol findInterned: self
! !

!WideString methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
reduced
	^self isByteCompliant ifTrue: [self asByteCharacters] ifFalse: [self]
! !

!WideString methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
sizeInBytes
	^self basicSize
! !

!WideString methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:38'!
utf8Bytes
	^UTF8 current encode: self
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
at: index
	| cp |
	cp := self checkIndex: index; codeAt: index.
	^Character value: cp
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
at: index putCode: codePoint
	^self
		checkIndex: index;
		uLongAtOffset: index - 1 * 4 put: codePoint
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
atValid: index
	| cp |
	cp := self codeAt: index.
	^Character value: cp
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
atValid: anInteger put: aCharacter
	self at: anInteger putCode: aCharacter codePoint.
	^aCharacter
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
atValid: index putCode: codePoint
	^self uLongAtOffset: index - 1 * 4 put: codePoint
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
checkByteIndex: index
	index isInteger ifFalse: [self error: 'strings are indexed by integers'].
	(index between: 1 and: self sizeInBytes)
		ifFalse: [self
			error: 'index: ' , index printString , ' is outside of string bounds']
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
codeAt: index
	^self uLongAtOffset: index - 1 * 4
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromCodePoints: aCollection
	1 to: aCollection size do: [:i | | ci |
		ci := aCollection at: i.
		self at: i putCode: ci]
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
indexAt: anInteger
	^anInteger
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
primitiveULongAtOffset: offset
put: anInteger
	offset _isSmallInteger ifFalse: [^self outOfBoundsIndex: offset].
	(0 <= offset and: [offset + 3 <= self _size])
		ifFalse: [^self outOfBoundsIndex: offset].
	^self uLongAtValidOffset: offset put: anInteger
! !

!WideString methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
td1
	| m td1 |
	m := self size.
	td1 := Dictionary new: m.
	m to: 1 by: -1 do: [:i | | code |
		code := self codeAt: i.
		td1 at: code + 1 ifAbsentPut: [m - i + 1]].
	^td1
! !

!WideString methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
at: anInteger put: aCharacter
	self
		checkCharacter: aCharacter;
		at: anInteger putCode: aCharacter codePoint.
	^aCharacter
! !

!WideString methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicAt: anInteger
	^self basicByteAt: anInteger
! !

!WideString methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicAt: anInteger put: anObject
	^self basicByteAt: anInteger put: anObject
! !

!WideString methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicSize
	^self _size
! !

!WideString methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
byteAt: anInteger
	anInteger _isSmallInteger ifFalse: [^self error: 'Non integer index'].
	(1 <= anInteger and: [anInteger <= self _size])
		ifFalse: [^self outOfBoundsIndex: anInteger].
	^self _byteAt: anInteger
! !

!WideString methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
byteAt: position put: asciiValue
	position _isSmallInteger ifFalse: [^self error: 'Non integer index'].
	(1 <= position and: [position <= self _size])
		ifFalse: [^self outOfBoundsIndex: position].
	(0 <= asciiValue and: [asciiValue < 256])
		ifFalse: [^self error: 'invalid character'].
	^self _byteAt: position put: asciiValue
! !

!WideString methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
characterSize
	^4
! !

!WideString methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
size
	^self basicSize // 4
! !

!WideString methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
composeCharacters
	^UTF16 current compose: self
! !

!WideString methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
decomposeCharacters
	^UTF16 current decompose: self
! !

!WideString methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
foldDigits
	^UTF16 current foldDigitsOf: self
! !

!WideString methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
normalizeToC
	^UTF16 current normalizeToC: self
! !

!WideString methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
normalizeToD
	^(UTF16 current normalizeToD: self) reduced
! !

!WideString methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
normalizeToKC
	^UTF16 current normalizeToKC: self
! !

!WideString methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
normalizeToKD
	^UTF16 current normalizeToKD: self
! !

!WideString methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
unaccented
	^self normalizeToD reject: [:ch | ch isNonSpacingMark]
! !

!WideString methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:38'!
indexOfString: aString from: start to: stop td1: anArray
	| m k |
	m := aString size.
	m = 0 ifTrue: [^0].
	k := start.
	[k + m - 1 <= stop] whileTrue: [| i code delta |
		i := 1.
		[i <= m and: [(aString at: i) = (self at: k + i - 1)]]
			whileTrue: [i := i + 1].
		i > m ifTrue: [^k].
		k + m > stop ifTrue: [^0].
		code := self codeAt: k + m.
		delta := anArray at: code + 1 ifAbsent: nil.
		delta isNil ifTrue: [delta := m + 1].
		k := k + delta].
	^0
! !

!WideString methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isByteCompliant
	1 to: self size do: [:i | | char |
		char := self at: i.
		char isByteCharacter ifFalse: [^false]].
	^true
! !

!WideString methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isCNormal
	^UTF16 current isCNormal: self
! !

!WideString methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isDNormal
	^UTF16 current isDNormal: self
! !

!WideString methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isKCNormal
	^UTF16 current isKCNormal: self
! !

!WideString methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isKDNormal
	^UTF16 current isKDNormal: self
! !

!WideString methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isWide
	^true
! !

!WideString methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isWideString
	^true
! !

!WideString methodsFor: 'inquires' stamp: 'KenD 28/Jun/2026 13:27:38'!
length
	^UTF16 current lengthOf: self
! !

!WideString methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:38'!
printChunkOn: aStream from: anInteger
	^self printUTF8ChunkOn: aStream from: anInteger
! !

!WideString methodsFor: 'replacing' stamp: 'KenD 28/Jun/2026 13:27:38'!
replace: anInteger with: aString
	1 to: anInteger do: [:i | | char |
		char := aString at: i.
		self at: i put: char]
! !

!WideString methodsFor: 'replacing' stamp: 'KenD 28/Jun/2026 13:27:38'!
replaceFirst: anInteger with: aString
	1 to: anInteger do: [:i | | char |
		char := aString at: i.
		self at: i put: char]
! !

!WideString methodsFor: 'replacing' stamp: 'KenD 28/Jun/2026 13:27:38'!
replaceFrom: start to: stop with: aString startingAt: position
	| string |
	string := self replacementFrom: aString.
	super
		replaceFrom: start - 1 * 4 + 1
		to: stop * 4
		with: string
		startingAt: position - 1 * 4 + 1
! !

!WideString methodsFor: 'replacing' stamp: 'KenD 28/Jun/2026 13:27:38'!
replaceFrom: start to: stop withObject: aCharacter
	self checkIndex: start; checkIndex: stop.
	start to: stop do: [:i | self at: i put: aCharacter]
! !

!WideString methodsFor: 'replacing' stamp: 'KenD 28/Jun/2026 13:27:38'!
replacementFrom: aString
	| n wide |
	aString class == self class ifTrue: [^aString].
	aString isExternalMemory ifTrue: [^WideString fromMemory: aString].
	n := aString size.
	wide := WideString new: n.
	1 to: n do: [:i | | ch |
		ch := aString atValid: i.
		wide atValid: i put: ch].
	^wide
! !

!WideString methodsFor: 'unclassified' stamp: 'KenD 28/Jun/2026 13:27:38'!
uLongAtValidOffset: offset put: anInteger
	anInteger size > 4 ifTrue: [self error: 'does not fit in 32 bits'].
	self _uLongAtOffset: offset put: anInteger.
	^anInteger
! !

!WideString class methodsFor: 'instances' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicNew: anInteger
	^self primitiveNewBytes: anInteger
! !

!WideString class methodsFor: 'instances' stamp: 'KenD 28/Jun/2026 13:27:38'!
new: anInteger
	^self basicNew: anInteger * 4
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromBytes: aByteArray
	^UTF16 current
		decodeStringFrom: aByteArray readStream
		on: (self new: aByteArray size)
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromCodePoints: aCollection
	| string |
	string := self new: aCollection size.
	^string fromCodePoints: aCollection
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromExternalUTF16: anExternalMemory
	^UTF16 current decodeStringFrom: anExternalMemory readStream
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromExternalUTF16: anExternalMemory length: anInteger
	| stream |
	stream := anExternalMemory readStream.
	stream readLimit: anInteger.
	^UTF16 current decodeStringFrom: stream
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromExternalUTF8: anExternalMemory
	^UTF8 current decodeStringFrom: anExternalMemory readStream
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromMemory: anExternalMemory
	| s i |
	s := self new: 1.
	i := 1.
	[
		s replaceBytesFrom: 1 to: 2 with: anExternalMemory startingAt: i.
		(s codeAt: 1) = 0]
		whileFalse: [i := i + 2].
	^self fromMemory: anExternalMemory length: i - 1 // 2
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromMemory: anExternalMemory length: anInteger
	| bytes |
	bytes := anExternalMemory readStream readLimit: anInteger * 2.
	^UTF16 current decodeStringFrom: bytes on: (self new: anInteger)
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromMultiByte: aByteArray codePage: anInteger
	"
	WideString fromMultiByte: #[16rFA] codePage: 1251
	"
	| bytes string |
	bytes := aByteArray externalCopy.
	string := self
		fromMultiByteAddress: bytes
		codePage: anInteger
		size: aByteArray sizeInBytes.
	bytes free.
	^string
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromString: aString
	aString class == String ifTrue: [^aString asWideString].
	aString class == self ifTrue: [^aString].
	^self fromUTF8: aString asString utf8
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
fromUTF8: aByteArray
	^UTF8 current
		decodeStringFrom: aByteArray readStream
		on: (self new: aByteArray size)
! !

!WideString class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
stringFromMemory: anExternalMemory
	| s i |
	s := self new: 1.
	i := 1.
	[
		s replaceBytesFrom: 1 to: 2 with: anExternalMemory startingAt: i.
		(s codeAt: 1) = 0]
		whileFalse: [i := i + 2].
	^UTF16 decodeFromAddress: anExternalMemory length: i - 1 // 2
! !

!WideString class methodsFor: 'gs' stamp: 'KenD 28/Jun/2026 13:27:38'!
newFrom: aByteArray
	^aByteArray copy changeClassTo: self
! !

!WideString class methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
stringsFromAddress: anExternalMemory
	| strings memory |
	strings := OrderedCollection new.
	memory := anExternalMemory.
	[(memory at: 1) = 0 and: [(memory at: 2) = 0]] whileFalse: [| s |
		s := self stringFromMemory: memory.
		strings add: s.
		memory := memory + (s size + 1 * 2)].
	^strings
! !

!CharacterArray methodsFor: 'converting' stamp: 'KenD 29/Jun/2026 12:12:21'!
dosToUnix
	^self species streamContents: [:s | | source |
		source := self readStream.
		[source atEnd] whileFalse: [| c |
			c := source next.
			(c = `Character cr`)
				ifTrue: [
					s nextPut: `Character lf`.
					source next]
				ifFalse: [s nextPut: c]]]! !

!CharacterArray methodsFor: 'converting' stamp: 'KenD 29/Jun/2026 12:11:33'!
unixToMac
	| result |
	result := self species new: self size.
	self
		withIndexDo: [:c :i | (c = `Character lf`)
			ifTrue: [result at: i put: `Character cr`]
			ifFalse: [result at: i put: c]].
	^result! !

!LMRCharacterArray methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
primitiveSize
	^self _size
! !

!Namespace methodsFor: 'lookup' stamp: 'KenD 28/Jun/2026 13:27:38'!
_namespaceLookup: aSymbol
	| table |
	table := namespace _basicAt: 2.
	2
		to: table _size
		do: [:j | | assoc |
			assoc := (table _basicAt: j).
			assoc == nil ifFalse: [
				assoc key == aSymbol
					ifTrue: [^table _basicAt: j + 1]]].
	^nil
! !

!Namespace class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
new
	^super new
! !

!WeakIdentityDictionary methodsFor: 'adding' stamp: 'KenD 28/Jun/2026 13:27:38'!
add: anAssociation
	self ASSERT: anAssociation class == Ephemeron.
	^self critical: [super add: anAssociation]
! !

!WeakIdentityDictionary methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
associationClass
	^Ephemeron new registry: self
! !

!WeakIdentityDictionary methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
critical: aBlock
	| save |
	save := critical.
	critical := true.
	^[aBlock value] ensure: [critical := save]
! !

!WeakIdentityDictionary methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
equates: element with: ephemeron
	^element == ephemeron key
! !

!WeakIdentityDictionary methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
hashFor: element
	^element basicHash
! !

!WeakIdentityDictionary methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
keyCollector
	^IdentitySet new: self size
! !

!WeakIdentityDictionary methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
rescue: anEphemeron
	critical
		ifTrue: [anEphemeron activate]
		ifFalse: [self removeKey: anEphemeron key ifAbsent: nil]
! !

!WeakIdentityDictionary methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:38'!
associationsDo: aBlock
	self critical: [
		super associationsDo: [:ephemeron | | hold |
			hold := ephemeron key.
			hold notNil ifTrue: [aBlock value: ephemeron]]]
! !

!WeakIdentityDictionary methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:38'!
do: aBlock
	self associationsDo: [:assoc | aBlock evaluateWith: assoc value]
! !

!WeakIdentityDictionary methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:38'!
ephemeronsDo: aBlock
	self associationsDo: aBlock
! !

!WeakIdentityDictionary methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:38'!
onTable: aHashTable
	critical := false.
	super onTable: aHashTable
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
beFatal
	resumable := retryable := false
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
beResumable
	resumable := true
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
beWarning
	resumable := true
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiler
	^compiler
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiler: aCompiler
	compiler := aCompiler.
	compiler result error: self
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
description: aString
	description := aString
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isResumable
	^resumable

! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
proceed
	retryable := false.
	compiler result beSuccessful.
	self isResumable ifTrue: [ self resume ] ifFalse: [ self return ]
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
source
	^compiler sourceCode copyFrom: stretch start to: stretch end
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
stretch
	^stretch
! !

!SCompilationError methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
stretch: aStretch
	stretch := aStretch
! !

!SCompilationError methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isUndeclaredAccess
	^false
! !

!SCompilationError methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isUndeclaredAssignment
	^ false
! !

!SUndeclaredIdentifierError methodsFor: 'accessing-token' stamp: 'KenD 28/Jun/2026 13:27:40'!
assignment: aBoolean
	assigned := aBoolean
! !

!SUndeclaredIdentifierError methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
identifier
	^ identifier
! !

!SUndeclaredIdentifierError methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isUndeclaredAccess
	^assigned not
! !

!SUndeclaredIdentifierError methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isUndeclaredAssignment
	^assigned
! !

!SUndeclaredIdentifierError methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
stretch: aStretch
	super stretch: aStretch.
	identifier := self source
! !

!ArgParser methodsFor: 'commands' stamp: 'KenD 28/Jun/2026 13:27:37'!
addCommand: aCommand
	commands at: aCommand name put: aCommand
! !

!ArgParser methodsFor: 'options' stamp: 'KenD 28/Jun/2026 13:27:37'!
addGlobalOption: anOption
	globalOptions add: anOption
! !

!ArgParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
description
	^description
! !

!ArgParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
description: aString
	description := aString
! !

!ArgParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
name
	^name
! !

!ArgParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
name: aString
	name := aString
! !

!ArgParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:37'!
extractGlobalArgs: args
	| remaining i |
	remaining := OrderedCollection new.
	i := 1.
	[i <= args size] whileTrue: [
		| arg match rest |
		arg := args at: i.
		match := globalOptions detect: [:opt | opt matches: arg] ifNone: [nil].
		match ifNotNil: [
			match hasValue ifTrue: [i := i + 1]
		] ifNil: [
			rest := args copyFrom: i to: args size.
			^remaining addAll: rest; yourself].
		i := i + 1].
	^remaining
! !

!ArgParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:37'!
parse: args
	| remaining key command result tail |
	remaining := self extractGlobalArgs: args.
	remaining isEmpty ifTrue: [self printHelp. ^nil].
	key := remaining first.
	command := commands at: key ifAbsent: [
		self error: 'Unknown command: ', key, '. Run with no args for help.'].
	result := ParseResult new.
	result command: key.
	tail := remaining copyFrom: 2 to: remaining size.
	command parse: tail into: result.
	command action ifNotNil: [:act | act value: result].
	^result
! !

!ArgParser methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:37'!
initialize
	commands := OrderedDictionary new.
	globalOptions := OrderedCollection new
! !

!ArgParser methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:37'!
printHelp
	| text |
	text := name ifNil: ['command'].
	description ifNotNil: [
		text := text , ' - ' , description].
	text := text , String cr , String cr , 'Commands:' , String cr.
	commands keysAndValuesDo: [:key :cmd |
		text := text , '  ' , key.
		cmd description ifNotNil: [:d |
			text := text , '  - ' , d].
		text := text , String cr].
	Kernel log: text
! !

!Command methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
action
	^action
! !

!Command methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
action: aBlock
	action := aBlock
! !

!Command methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
description
	^description
! !

!Command methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
description: aString
	description := aString
! !

!Command methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
name
	^name
! !

!Command methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
name: aString
	name := aString
! !

!Command methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
options
	^options
! !

!Command methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
positionalNames
	^positionalNames
! !

!Command methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
subcommands
	^subcommands
! !

!Command methodsFor: 'configuration' stamp: 'KenD 28/Jun/2026 13:27:37'!
addOption: anOption
	options add: anOption
! !

!Command methodsFor: 'configuration' stamp: 'KenD 28/Jun/2026 13:27:37'!
addPositional: aString
	positionalNames add: aString
! !

!Command methodsFor: 'configuration' stamp: 'KenD 28/Jun/2026 13:27:37'!
addSubcommand: aCommand
	subcommands at: aCommand name put: aCommand
! !

!Command methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:37'!
applyDefaults: aResult
	options do: [:opt |
		(aResult hasOption: opt name) ifFalse: [
			opt defaultValue ifNotNil: [:v |
				aResult setOption: opt name to: v]]]
! !

!Command methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:37'!
checkRequired: aResult
			options do: [:opt |
		| name |
		name := opt long ifNil: [opt short].
		(opt required and: [(aResult hasOption: opt name) not])
			ifTrue: [self error: 'Required option missing: ', name]]
! !

!Command methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:37'!
findOption: aString
	^options detect: [:opt | opt matches: aString] ifNone: [nil]
! !

!Command methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:37'!
hasSubcommands
	^subcommands notEmpty
! !

!Command methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:37'!
initialize
	options := OrderedCollection new.
	positionalNames := OrderedCollection new.
	subcommands := OrderedDictionary new
! !

!Command methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:37'!
parse: args into: result
	| i |
	i := 1.
	[i <= args size] whileTrue: [
		| arg |
		arg := args at: i.
		(arg first = $-)
			ifTrue: [i := self parseOption: arg from: args at: i into: result]
			ifFalse: [result addPositional: arg].
		i := i + 1].
	self checkRequired: result.
	self applyDefaults: result
! !

!Command methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:37'!
parseOption: aString from: anArray at: anInteger into: aResult
	| opt |
	opt := self findOption: aString.
	opt ifNil: [self error: 'Unknown option: ', aString].
	opt hasValue ifTrue: [
		| val next |
		next := anInteger + 1.
		next > anArray size ifTrue: [self error: 'Option ', aString, ' requires a value'].
		val := anArray at: next.
		aResult setOption: opt name to: val.
		^next]
	ifFalse: [
		aResult setOption: opt name to: true].
	^anInteger
! !

!Command methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:37'!
printUsageOn: aStream
	aStream nextPutAll: name.
	positionalNames do: [:pname |
		aStream nextPutAll: ' <'; nextPutAll: pname; nextPut: $>].
	options do: [:opt |
		aStream nextPutAll: ' ['.
		opt short ifNotNil: [:s | aStream nextPutAll: s].
		(opt short notNil and: [opt long notNil]) ifTrue: [aStream nextPutAll: '|'].
		opt long ifNotNil: [:l | aStream nextPutAll: l].
		opt hasValue ifTrue: [aStream nextPutAll: ' <value>'].
		aStream nextPut: $]]
! !

!Option methodsFor: 'configuration' stamp: 'KenD 28/Jun/2026 13:27:37'!
beFlag
	hasValue := false.
	defaultValue := false
! !

!Option methodsFor: 'configuration' stamp: 'KenD 28/Jun/2026 13:27:37'!
beRequired
	required := true
! !

!Option methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
defaultValue
	^defaultValue
! !

!Option methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
defaultValue: anObject
	defaultValue := anObject
! !

!Option methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
description
	^description
! !

!Option methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
description: aString
	description := aString
! !

!Option methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
long
	^long
! !

!Option methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
long: aString
	long := aString
! !

!Option methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
name
	long ifNotNil: [^long copyFrom: 3].
	^short copyFrom: 2
! !

!Option methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
short
	^short
! !

!Option methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
short: aString
	short := aString
! !

!Option methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:37'!
hasValue
	^hasValue
! !

!Option methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:37'!
matches: aString
	^aString = short or: [aString = long]
! !

!Option methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:37'!
required
	^required
! !

!Option methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:37'!
initialize
	required := false.
	hasValue := true.
	defaultValue := nil
! !

!ParseResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
addPositional: aString
	positionals add: aString
! !

!ParseResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
command
	^command
! !

!ParseResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
command: aString
	command := aString
! !

!ParseResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
optionAt: aString
	^options at: aString ifAbsent: [nil]
! !

!ParseResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
optionAt: aString ifAbsent: aBlock
	^options at: aString ifAbsent: aBlock
! !

!ParseResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
options
	^options
! !

!ParseResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
positionalAt: anInteger
	^positionals at: anInteger
! !

!ParseResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
positionals
	^positionals
! !

!ParseResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:37'!
setOption: aString to: aValue
	options at: aString put: aValue
! !

!ParseResult methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:37'!
hasOption: aString
	^options includesKey: aString
! !

!ParseResult methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:37'!
initialize
	positionals := OrderedCollection new.
	options := OrderedDictionary new
! !

!MethodSpec methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026 13:27:39'!
= aMethodSpec
	^aMethodSpec class = self class
		and: [aMethodSpec selector == selector]
		and: [aMethodSpec classBinding = class]
! !

!MethodSpec methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026 13:27:39'!
hash
	^class name hash hashWith: selector
! !

!MethodSpec methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:39'!
asCompiledMethod
	self canBeCompiled ifFalse: [^nil].
	^self
		propertyAt: #compiledMethod
		ifAbsentPut: [self compiler compileMethod: source]
! !

!MethodSpec methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:39'!
ast
	self canBeCompiled ifFalse: [^nil].
	^ast ifNil: [ast := self compiler parseMethod: source]
! !

!MethodSpec methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:39'!
cannonicalAst
	^self halt propertyAt: #cannonicalAst ifAbsentPut: [self ast]
! !

!MethodSpec methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:39'!
referencedIdentifiers
	^self ast ifNil: [#()] ifNotNil: [:node | node identifiers]
! !

!MethodSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
bytecodes
	^self canBeCompiled ifTrue: [self asCompiledMethod bytecodes]
! !

!MethodSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
classname
	^class name
! !

!MethodSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
canBeCompiled
	^self compiler notNil
! !

!MethodSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
canBeParsed
	^self cannonicalAst notNil
! !

!MethodSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
equals: aMethodSpec
	^self canBeCompiled
		and: [aMethodSpec canBeCompiled]
		and: [self isFrameless not]
		and: [self isEquivalentTo: aMethodSpec]
! !

!MethodSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isEquivalentTo: aMethodSpec
	| m1 m2 |
	selector == aMethodSpec selector ifFalse: [^false].
	class == aMethodSpec classBinding ifFalse: [^false].
	m1 := self asCompiledMethod.
	m1 isNil ifTrue: [^false].
	m2 := aMethodSpec asCompiledMethod.
	m2 isNil ifTrue: [^false].
	^m1 equals: m2
! !

!MethodSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isExtension
	^class isExtension
! !

!MethodSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isFrameless
	^self halt asCompiledMethod isFrameless
! !

!MethodSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
referencesIdentifier: aString
	^self referencedIdentifiers
		anySatisfy: [:identifier | identifier name = aString]
! !

!MethodSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
usesInstanceVariableNamed: aString
	^(self ast variableNamed: aString) notNil
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
category
	^self isExtension
		ifTrue: ['*' , (module name readStream upToLast: $-)]
		ifFalse: [category]
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
category: aString
	category := aString
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
classBinding
	^class
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
classBinding: aSpeciesSpec
	class := aSpeciesSpec
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
module
	^module
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
module: aModuleSpec
	module := aModuleSpec
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeFromClass
	class removeMethod: self
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
selector
	^selector
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
selector: aSymbol
	selector := aSymbol
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
source
	^source
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
source: aString
	source := aString.
	ast := nil
! !

!MethodSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
sourceCode
	^source
! !

!MethodSpec methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:39'!
printOn: aStream
	aStream nextPutAll: class name asString , '>>#' , selector asString
! !

!MethodSpec methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:39'!
resolveClass
	^module resolveClass: class name
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
addClass: aClassSpec
	classes add: aClassSpec
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
addClassExtension: aClassSpec
	extendedClasses add: aClassSpec
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
addClasses: aCollection
	aCollection do: [:c | self addClass: c]
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
addDependencies: aCollection
	aCollection keysAndValuesDo: [:dep :objects | 
		dependencies
			at: dep
			put: objects
			ifPresent: [:current | (current addAll: objects) withoutDuplicates]]
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
addSubclassifiedClass: aClassSpec
	subclassifiedClasses addIfAbsent: aClassSpec
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
associationAt: aSymbol ifAbsent: aBlock
	^imports associationAt: aSymbol ifAbsent: aBlock
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
cleanDependencies
	| needed |
	needed := OrderedCollection new.
	self methodReferences keys do: [:identifier | needed add: identifier name].
	self hierarchyReferences keys
		do: [:identifier | needed add: identifier name].
	extendedClasses do: [:c | needed add: c name].
	dependencies copy keysAndValuesDo: [:module :identifiers | 
		(identifiers keys anySatisfy: [:identifier | needed includes: identifier])
			ifFalse: [dependencies removeKey: module]]
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
hierarchyReferences
	| references |
	references := Dictionary new.
	self allClassesDo: [:c | | list |
		c superclass ifNotNil: [
			list := references at: c superclass ifAbsentPut: [OrderedCollection new].
			list add: c]].
	^references
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
methodReferences
	| references |
	references := Dictionary new.
	self allMethodsDo: [:m | 
		m referencedIdentifiers reject: #isLocal thenDo: [:identifier | | list |
			list := references at: identifier ifAbsentPut: [OrderedCollection new].
			list add: m]].
	^references
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
printOn: aStream
	aStream
		nextPut: $<;
		print: name;
		nextPutAll: '> module'
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeCategory: aSymbol inClass: aClassSpec
	| class |
	class := self resolveClass: aClassSpec.
	class removeCategory: aSymbol
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeClass: aClassSpec
	| class |
	class := self resolveClass: aClassSpec.
	classes remove: class ifAbsent: nil
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeEmptyExtensions
	extendedClasses copy
		reject: #hasMethods
		thenDo: [:c | extendedClasses remove: c]
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeExtendedClass: aClassSpec
	| class |
	class := self resolveClass: aClassSpec.
	extendedClasses remove: class ifAbsent: nil
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeMethod: aMethodSpec
	self ASSERT: (self includesClass: aMethodSpec classBinding).
	aMethodSpec classBinding removeMethod: aMethodSpec
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeSelectors: aCollection
	self allClassesDo: [:c | 
		c removeSelectors: aCollection.
		c metaclass removeSelectors: aCollection]
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeSelectors: aCollection inClass: aClassSpec
	| class |
	class := self resolveClass: aClassSpec.
	class removeSelectors: aCollection
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeSelectors: aCollection inScope: aClassSpec
	| class all |
	class := self resolveClass: aClassSpec.
	all := self withAllSubclasses: class.
	all do: [:c | c removeSelectors: aCollection]
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeSubclassesOf: aClassSpec
	| class |
	class := self resolveClass: aClassSpec.
	class allSubclasses do: [:c | self removeClass: c; removeExtendedClass: c]
! !

!ModuleSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeSubclassifiedClass: aClassSpec
	| class |
	class := self resolveClass: aClassSpec.
	subclassifiedClasses remove: class ifAbsent: nil
! !

!ModuleSpec methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:39'!
addImport: anAssociation
	imports add: anAssociation
! !

!ModuleSpec methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:39'!
addImports: aCollection
	aCollection do: [:token | self addImport: token asSymbol -> nil]
! !

!ModuleSpec methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:39'!
initialize
	classes := OrderedCollection new.
	extendedClasses := OrderedCollection new.
	subclassifiedClasses := OrderedCollection new.
	imports := Dictionary new.
	dependencies := Dictionary new
! !

!ModuleSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
allClasses
	^classes , extendedClasses
! !

!ModuleSpec methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:39'!
allClassesDo: aBlock
	classes do: aBlock.
	extendedClasses do: aBlock
! !

!ModuleSpec methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:39'!
allMethods
	| methods |
	methods := OrderedCollection new.
	self allMethodsDo: [:m | methods add: m].
	^methods
! !

!ModuleSpec methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:39'!
allMethodsDo: aBlock
	self allClassesDo: [:c | 
		c metaclass methods do: aBlock.
		c methods do: aBlock]
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
at: aSymbol
	^self at: aSymbol ifAbsent: nil
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
at: aSymbol ifAbsent: aBlock
	| string |
	string := aSymbol asString.
	classes do: [:c | c name = string ifTrue: [^c]].
	extendedClasses do: [:c | c name = string ifTrue: [^c]].
	subclassifiedClasses do: [:c | c name = string ifTrue: [^c]].
	^imports at: aSymbol ifAbsent: aBlock
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
classes
	^classes
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
dependencies
	^dependencies
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
dependencies: aDictionary
	dependencies := aDictionary
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
description
	^description
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
description: aString
	description := aString
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
extendedClasses
	^extendedClasses
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
name
	^name
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
name: aString
	name := aString
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
referencedGlobals
	| referenced |
	referenced := Dictionary new.
	self allMethodsDo: [:m | 
		m referencedIdentifiers
			select: [:identifier | | b |
				b := identifier binding.
				b refersToGlobal or: [b isUnresolved]]
			thenDo: [:global | (referenced
				at: global name
				ifAbsentPut: [OrderedCollection new])
				add: m]].
	^referenced
! !

!ModuleSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
requiredImports
	| required |
	required := Dictionary new.
	self referencedGlobals
		keysAndValuesDo: [:global :dependents | (self definesGlobal: global)
			ifFalse: [required at: global put: dependents]].
	^required
! !

!ModuleSpec methodsFor: 'resolving' stamp: 'KenD 28/Jun/2026 13:27:39'!
basicResolveClass: aString
	classes do: [:c | c name asString = aString ifTrue: [^c]].
	extendedClasses do: [:c | c name asString = aString ifTrue: [^c]].
	subclassifiedClasses do: [:c | c name asString = aString ifTrue: [^c]].
	^nil
! !

!ModuleSpec methodsFor: 'resolving' stamp: 'KenD 28/Jun/2026 13:27:39'!
definesGlobal: aString
	^classes anySatisfy: [:c | c name = aString]
! !

!ModuleSpec methodsFor: 'resolving' stamp: 'KenD 28/Jun/2026 13:27:39'!
resolveClass: class
	| moniker metaclass found |
	moniker := class isString ifTrue: [class] ifFalse: [class name].
	metaclass := moniker endsWith: ' class'.
	metaclass ifTrue: [moniker := moniker trimTail: ' class'].
	found := self basicResolveClass: moniker.
	^found ifNotNil: [metaclass ifTrue: [found metaclass] ifFalse: [found]]
! !

!ModuleSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
definesClassNamed: aString
	^classes anySatisfy: [:c | c name = aString]
! !

!ModuleSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
extendsClassNamed: aString
	^extendedClasses anySatisfy: [:c | c name = aString]
! !

!ModuleSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
includesClass: aClassSpec
	^(self resolveClass: aClassSpec) notNil
! !

!ModuleSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
subclassifiesClassNamed: aString
	^subclassifiedClasses anySatisfy: [:c | c name = aString]
! !

!ModuleSpec methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:39'!
sortedClasses
	| remaining sorted |
	remaining := classes copy.
	sorted := OrderedCollection new.
	[remaining isEmpty] whileFalse: [| c |
		c := remaining first.
		(remaining includes: c superclass)
			ifTrue: [remaining removeFirst; add: c]
			ifFalse: [
				remaining remove: c.
				sorted add: c]].
	^sorted
! !

!ModuleSpec methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:39'!
withAllSubclasses: aClassSpec
	| all |
	all := self allClasses.
	aClassSpec isMetaclass ifTrue: [all := all collect: #metaclass].
	^all select: [:c | c withAllSuperclasses includes: aClassSpec]
! !

!SpeciesSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
addMethod: aMethodSpec
	^methods add: aMethodSpec
! !

!SpeciesSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
addMethods: aCollection
	aCollection do: [:m | self addMethod: m]
! !

!SpeciesSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeCategory: aSymbol
	methods removeAllSuchThat: [:m | m category == aSymbol]
! !

!SpeciesSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeMethod: aMethodSpec
	methods remove: aMethodSpec ifAbsent: nil
! !

!SpeciesSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeSelector: aSymbol
	methods removeAllSuchThat: [:m | m selector == aSymbol]
! !

!SpeciesSpec methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:39'!
removeSelectors: aCollection
	methods removeAllSuchThat: [:m | aCollection includes: m selector]
! !

!SpeciesSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
allInstVarNames
	^(self withAllSuperclasses reversed gather: [:c | c instVarNames]) asArray
! !

!SpeciesSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
allSharedPools
	| pools |
	pools := Set new.
	self withAllSuperclasses do: [:c | pools addAll: c sharedPools].
	^pools
! !

!SpeciesSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
allSuperclasses
	| superclasses |
	superclasses := OrderedCollection new.
	self allSuperclassesDo: [:s | superclasses add: s].
	^superclasses
! !

!SpeciesSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
withAllSuperclasses
	^OrderedCollection with: self withAll: self allSuperclasses
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
allSubclasses
	| all |
	all := OrderedCollection new.
	self allSubclassesDo: [:cls | all add: cls].
	^all
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
allSubclassesDo: aBlock
	self subclasses do: [:class | 
		aBlock value: class.
		class allSubclassesDo: aBlock]
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
beArrayed
	format := format | IsArrayed
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
beBytes
	format := format | IsBytes
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
instVarNames
	^instanceVariables
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
instVarNames: aCollection
	instanceVariables := aCollection asOrderedCollection
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
ivars: aCollection
	instanceVariables := aCollection asOrderedCollection
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
methods
	^methods
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
module: aModuleSpec
	module := aModuleSpec
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
selectors
	^methods collect: #selector
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
subclasses
	^module allClasses select: [:c | c supername = self name]
! !

!SpeciesSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
withAllSubclasses
	^OrderedCollection with: self withAll: self allSubclasses
! !

!SpeciesSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
hasMethods
	^methods notEmpty
! !

!SpeciesSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
instancesAreArrayed
	^format anyMask: IsArrayed
! !

!SpeciesSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
instancesHavePointers
	^(format anyMask: IsBytes) not
! !

!SpeciesSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isExtension
	^module extendedClasses includes: self instanceClass
! !

!SpeciesSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isMetaclass
	^false
! !

!SpeciesSpec methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:39'!
initialize
	super initialize.
	methods := OrderedCollection new.
	instanceVariables := #().
	format := 0
! !

!SpeciesSpec methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:39'!
printOn: aStream
	aStream nextPutAll: '<' , self name , '>'
! !

!SpeciesSpec class methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:39'!
initializeFormatMasks
	self addNamespaceAs: #Format.
	Format
		at: 'IsArrayed' put: 0x1;
		at: 'IsBytes' put: 0x2
! !

!ClassSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
allMethods
	^methods & metaclass methods
! !

!ClassSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
classVarNames
	^classVariables keys
! !

!ClassSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
metaMethods
	^metaclass methods
! !

!ClassSpec methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:39'!
allSuperclassesDo: aBlock
	| s |
	supername isNil ifTrue: [^self].
	s := self superclass.
	s isNil ifTrue: [^self].
	aBlock value: s.
	s allSuperclassesDo: aBlock
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
classVariables
	^classVariables
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
configureCompiler: aCompiler
	
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
cvarNames: aCollection
	aCollection do: [:cvar | classVariables at: cvar put: nil]
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
cvars: aCollection
	classVariables := aCollection
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
instanceClass
	^self
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isPointers
	^pointers
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isPointers: aBoolean
	pointers := aBoolean
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isVariable
	^variable
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isVariable: aBoolean
	variable := aBoolean
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
metaclass
	^metaclass
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
metaclass: aMetaclassSpec
	metaclass := aMetaclassSpec
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
name
	^name
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
name: aString
	name := aString
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
sharedPools
	^sharedPools
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
sharedPools: aCollection
	sharedPools addAll: aCollection
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
superclass
	supername ifNil: [^nil].
	^module resolveClass: supername
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
supername
	^supername
! !

!ClassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
supername: aString
	supername := aString
! !

!ClassSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
hasMethods
	^super hasMethods or: [metaclass hasMethods]
! !

!ClassSpec methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:39'!
initialize
	super initialize.
	classVariables := OrderedDictionary new.
	sharedPools := OrderedCollection new
! !

!MetaclassSpec methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:39'!
allSuperclassesDo: aBlock
	| s c |
	class supername isNil ifTrue: [
		c := module resolveClass: 'Class'.
		c ifNil: [c := Class].
		c allSuperclassesDo: aBlock].
	s := self superclass.
	s isNil ifTrue: [^self].
	aBlock value: s.
	s allSuperclassesDo: aBlock
! !

!MetaclassSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
classVarNames
	^class classVarNames
! !

!MetaclassSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
metaMethods
	^#()
! !

!MetaclassSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
name
	^class name , ' class'
! !

!MetaclassSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
sharedPools
	^class sharedPools
! !

!MetaclassSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
superclass
	^class superclass ifNotNil: [:c | c metaclass]
! !

!MetaclassSpec methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:39'!
supername
	^self superclass name
! !

!MetaclassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
instanceClass
	^class
! !

!MetaclassSpec methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:39'!
instanceClass: aClassSpec
	class := aClassSpec
! !

!MetaclassSpec methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:39'!
isMetaclass
	^true
! !

!IdentifierBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
contents
	^contents
! !

!IdentifierBinder methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
keyFor: aString
	^self subclassResponsibility
! !

!IdentifierBinder methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
printOn: aStream
	self printOn: aStream indent: 0
! !

!IdentifierBinder methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
printOn: aStream indent: anInteger
	self subclassResponsibility
! !

!StaticBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
at: aString
	^contents at: aString ifAbsent: nil
! !

!StaticBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
at: aString ifAbsentPut: aBlock
	^contents at: aString ifAbsentPut: aBlock
! !

!StaticBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
at: aString put: aBinding
	contents at: aString put: aBinding
! !

!StaticBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
define: aString as: aBinding
	contents at: aString put: aBinding
! !

!StaticBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
defines: identifier
	^contents includesKey: identifier
! !

!StaticBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
do: aBlock
	contents do: aBlock
! !

!StaticBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
select: aBlock
	^contents select: aBlock
! !

!StaticBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
values
	^contents values
! !

!StaticBinder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
withIndexDo: aBlock
	contents withIndexDo: aBlock
! !

!StaticBinder methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	contents := OrderedDictionary new
! !

!StaticBinder methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
printOn: aStream indent: anInteger
	aStream tab: anInteger; nextPut: $<.
	contents keys
		do: [:name | name printOn: aStream]
		separatedBy: [aStream space].
	aStream nextPut: $>
! !

!LocalEnvironment methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isInlinedArgument
	^false
! !

!ArrayEnvironment methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureType
	^CaptureEnvironmentValue
! !

!ArrayEnvironment methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
index
	^index
! !

!ArrayEnvironment methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
index: anInteger
	index := anInteger
! !

!ArrayEnvironment methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isCurrent
	^index isNil
! !

!ArrayEnvironment methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isIndirect
	^self isCurrent not
! !

!ArrayEnvironment methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isStack
	^false
! !

!StackEnvironment methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
index
	^nil
! !

!StackEnvironment methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
isStack
	^true
! !

!ArgumentEnvironment methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureType
	^CaptureLocalArgument
! !

!InlinedArgEnvironment methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
captureType
	^CaptureInlinedArgument
! !

!InlinedArgEnvironment methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isInlinedArgument
	^true
! !

!MessageInliner methodsFor: 'transforming' stamp: 'KenD 28/Jun/2026 13:27:40'!
inline: aMessageNode
	| s keywords |
	message := aMessageNode.
	message receiver isSuper
		ifTrue: [ ^ self ].
	message isCascadeMessage
		ifTrue: [ ^ self ].
	s := message selector value.
	s == #ifTrue:
		ifTrue: [ ^ self inlineConditional ].
	s == #ifFalse:
		ifTrue: [ ^ self inlineConditional ].
	s == #or:
		ifTrue: [ ^ self inlineConditional ].
	s == #and:
		ifTrue: [ ^ self inlineConditional ].
	s == #timesRepeat:
		ifTrue: [ ^ self inlineConditional ].
	s == #ifTrue:ifFalse:
		ifTrue: [ ^ self inlineConditional ].
	s == #ifFalse:ifTrue:
		ifTrue: [ ^ self inlineConditional ].
	s == #andNot:
		ifTrue: [ ^ self inlineConditional ].
	s == #orNot:
		ifTrue: [ ^ self inlineConditional ].
	s == #ifNil:
		ifTrue: [ ^ self inlineConditional ].
	s == #ifNotNil:
		ifTrue: [ ^ self inlineIfNotNil ].
	s == #ifNil:ifNotNil:
		ifTrue: [ ^ self inlineIfNilIfNotNil ].
	s == #ifNotNil:ifNil:
		ifTrue: [ ^ self inlineIfNotNilIfNil ].
	s == #whileTrue:
		ifTrue: [ ^ self inlineWhile ].
	s == #whileFalse:
		ifTrue: [ ^ self inlineWhile ].
	s == #whileTrue
		ifTrue: [ ^ self inlineUnitaryWhile ].
	s == #whileFalse
		ifTrue: [ ^ self inlineUnitaryWhile ].
	s == #repeat
		ifTrue: [ ^ self inlineRepeat ].
	s == #to:do:
		ifTrue: [ ^ self inlineToDo ].
	"s == #to:by:do:
		ifTrue: [ ^ self inlineToByDo ]."
	keywords := $: split: s.
	keywords last = ''
		ifTrue: [ keywords := keywords allButLast ].
	(keywords conform: [ :k | k = 'and' ])
		ifTrue: [ ^ self inlineConditional ].
	(keywords conform: [ :k | k = 'or' ])
		ifTrue: [ ^ self inlineConditional ].
	((keywords allButLast conform: [ :k | k = 'and' ])
		and: [ #('ifTrue' 'ifFalse') includes: keywords last ])
		ifTrue: [ ^ self inlineConditional ].
	((keywords allButLast conform: [ :k | k = 'or' ])
		and: [ #('ifTrue' 'ifFalse') includes: keywords last ])
		ifTrue: [ self inlineConditional ]
! !

!MessageInliner methodsFor: 'transforming' stamp: 'KenD 28/Jun/2026 13:27:40'!
inlineRepeat
	| receiver arguments |
	receiver := message receiver.
	receiver isEvaluable
		ifFalse: [ ^ self ].
	arguments := message arguments.
	arguments isEmpty
		ifFalse: [ ^ self ].
	receiver isBlockNode
		ifFalse: [ ^ self ].
	message beInlined.
	receiver beInlined
! !

!MessageInliner methodsFor: 'transforming' stamp: 'KenD 28/Jun/2026 13:27:40'!
inlineUnitaryWhile
	| receiver arguments |
	receiver := message receiver.
	receiver isEvaluable ifFalse: [^self].
	arguments := message arguments.
	arguments size = 0 ifFalse: [^self].
	self inlineConditional.
	receiver isBlockNode ifTrue: [
		message beInlined.
		receiver beInlined]
! !

!MessageInliner methodsFor: 'inlining' stamp: 'KenD 28/Jun/2026 13:27:40'!
inlineConditional
	| arguments |
	arguments := message arguments.
	arguments size >= 1 ifFalse: [^self].
	arguments do: [:arg | arg isEvaluable ifFalse: [^self]].
	message beInlined.
	arguments select: #isBlockNode thenDo: #beInlined
! !

!MessageInliner methodsFor: 'inlining' stamp: 'KenD 28/Jun/2026 13:27:40'!
inlineIfNilIfNotNil
	| arguments arg |
	arguments := message arguments.
	arguments size = 2 ifFalse: [^self].
	arguments first isEvaluable ifFalse: [^self].
	arg := arguments second.
	(arg isEvaluable or: [arg isBlockNode and: [arg arguments size = 1]])
		ifFalse: [^self].
	message beInlined.
	arguments select: #isBlockNode thenDo: #beInlined
	
! !

!MessageInliner methodsFor: 'inlining' stamp: 'KenD 28/Jun/2026 13:27:40'!
inlineIfNotNil
	| arguments arg |
	arguments := message arguments.
	arguments size = 1 ifFalse: [^self].
	arg := arguments first.
	(arg isEvaluable or: [arg isBlockNode and: [arg arguments size = 1]])
		ifFalse: [^self].
	message beInlined.
	arg isBlockNode ifTrue: [arg beInlined]
! !

!MessageInliner methodsFor: 'inlining' stamp: 'KenD 28/Jun/2026 13:27:40'!
inlineIfNotNilIfNil
	| arguments arg |
	arguments := message arguments.
	arguments size = 2 ifFalse: [^self].
	arguments second isEvaluable ifFalse: [^self].
	arg := arguments first.
	(arg isEvaluable or: [arg isBlockNode and: [arg arguments size = 1]])
		ifFalse: [^self].
	message beInlined.
	arguments select: #isBlockNode thenDo: #beInlined
! !

!MessageInliner methodsFor: 'inlining' stamp: 'KenD 28/Jun/2026 13:27:40'!
inlineToByDo
	| arguments arg step |
	arguments := message arguments.
	arguments size = 3 ifFalse: [^self].
	arg := arguments at: 3.
	arg isBlockNode ifFalse: [^self].
	arg arguments size = 1 ifFalse: [^self].
	step := arguments at: 2.
	(step isNumberNode and: [step value isSmallInteger]) ifFalse: [^self].
	message beInlined.
	arg beInlined
! !

!MessageInliner methodsFor: 'inlining' stamp: 'KenD 28/Jun/2026 13:27:40'!
inlineToDo
	| arguments last |
	arguments := message arguments.
	arguments size = 2 ifFalse: [^self].
	last := arguments at: 2.
	last isBlockNode ifFalse: [^self].
	last arguments size = 1 ifFalse: [^self].
	message beInlined.
	last beInlined
! !

!MessageInliner methodsFor: 'inlining' stamp: 'KenD 28/Jun/2026 13:27:40'!
inlineWhile
	| receiver arguments |
	receiver := message receiver.
	receiver isEvaluable
		ifFalse: [ ^ self ].
	arguments := message arguments.
	arguments size = 1
		ifFalse: [ ^ self ].
	arguments last isNullary
		ifFalse: [ ^ self ].
	self inlineConditional.
	receiver isBlockNode
		ifTrue: [ receiver beInlined ]
! !

!SCompilationResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
ast
	^ast
! !

!SCompilationResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
ast: aParseNode
	ast := aParseNode
! !

!SCompilationResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiler: aSmalltalkCompiler
	compiler := aSmalltalkCompiler
! !

!SCompilationResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
method
	^method
! !

!SCompilationResult methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
method: aCompiledMethod
	method := aCompiledMethod
! !

!SCompilationResult methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
beSuccessful
	error := nil
! !

!SCompilationResult methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
error
	^error
! !

!SCompilationResult methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
error: aCompilationError
	error := aCompilationError
! !

!SCompiler methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
canBeInIdentifier: aCharacter
	^aCharacter isLetter or: [aCharacter isDigit] or: [aCharacter = $_]
! !

!SCompiler methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
canStartIdentifier: aCharacter
	^aCharacter isLetter or: [aCharacter = $_]
! !

!SCompiler methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
peekForIdentifier: aStream
	| char next |
	char := aStream peek.
	(self canBeInIdentifier: char) ifTrue: [
		aStream skip: 1.
		^true].
	char = $. ifFalse: [^false].
	aStream prev isLetter ifFalse: [
		aStream skip: 1.
		^false].
	next := aStream skip: 2; peek.
	next isNil ifTrue: [
		aStream skip: -1.
		^false].
	^next isLetter ifFalse: [aStream skip: -1]; yourself
! !

!SCompiler methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
protect: aBlock
	^aBlock value
! !

!SCompiler methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
classBinding
	 ^class
! !

!SCompiler methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
classBinding: aSpecies
	| instance |
	class := aSpecies.
	instance := aSpecies instanceClass.
	(instance respondsTo: #configureCompiler)
		ifTrue: [instance configureCompiler: self]
! !

!SCompiler methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize: aDictionary
	class := aDictionary at: #UndefinedObject ifAbsent: nil
! !

!SCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
compile: aString
	result := self smalltalkCompiler compileMethod: aString.
	^result method
! !

!SCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parse: aString
	result := self smalltalkCompiler parseMethod: aString.
	^result ast
! !

!SCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
smalltalkCompiler
	^ SSmalltalkCompiler new frontend: self
! !

!SCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
smalltalkParser
	^ self smalltalkCompiler parser
! !

!SCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
smalltalkScanner
	^ self smalltalkCompiler scanner
! !

!SCompiler methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
forClass: aClass
	| c |
	c := aClass ifNil: [UndefinedObject].
	self classBinding: c
! !

!SCompiler class methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
compile: aString in: aClass
	| compiler |
	compiler := self forClass: aClass.
	^compiler compile: aString
! !

!SCompiler class methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parse: aString in: aClass
	| compiler |
	compiler := self forClass: aClass.
	^compiler parse: aString
! !

!SCompiler class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:40'!
forClass: aClass
	^self new forClass: aClass
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visit: aParseNode
	^aParseNode notNil ifTrue: [aParseNode acceptVisitor: self] 
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitAssignment: anAssignmentNode
	^self visitParseNode: anAssignmentNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitBlock: aBlockNode
	^self visitParseNode: aBlockNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitBraceNode: aBraceNode
	^self visitParseNode: aBraceNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitCascade: aCascadeNode
	^self visitParseNode: aCascadeNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitCascadeMessage: aCascadeMessageNode
	^self visitMessage: aCascadeMessageNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitForeignNode: anForeignNode
	self visitLiteral: anForeignNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitIdentifier: anIdentifierNode
	^self visitParseNode: anIdentifierNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitLiteral: aLiteralNode
	^self visitParseNode: aLiteralNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitMessage: aMessageNode
	^self visitParseNode: aMessageNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitMethod: aMethodNode
	^self visitParseNode: aMethodNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitNumberNode: aNumberNode
	^self visitLiteral: aNumberNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitParseNode: aParseNode
	^self subclassResponsibility
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitPragma: aPragmaNode
	^self visitParseNode: aPragmaNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitReturn: aReturnNode
	^self visitParseNode: aReturnNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitSelector: aSelectorNode
	^self visitParseNode: aSelectorNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitString: aStringNode
	^self visitLiteral: aStringNode
! !

!SParseTreeVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitSymbolicPragma: aPragmaNode
	^self visitPragma: aPragmaNode
! !

!SSemanticVisitor methodsFor: 'analizing' stamp: 'KenD 28/Jun/2026 13:27:40'!
analyzeAssignment: anAssignmentNode
	anAssignmentNode assignees
		do: [:v | self analyzeIdentifier: v assignee: true]
! !

!SSemanticVisitor methodsFor: 'analizing' stamp: 'KenD 28/Jun/2026 13:27:40'!
analyzeBlock: aBlockNode while: aBlock
	aBlockNode isInlined
		ifFalse: [aBlockNode index: aBlockNode compiler blockIndex].
	self analyzeScript: aBlockNode while: aBlock
! !

!SSemanticVisitor methodsFor: 'analizing' stamp: 'KenD 28/Jun/2026 13:27:40'!
analyzeIdentifier: anIdentifierNode
	self analyzeIdentifier: anIdentifierNode assignee: false
! !

!SSemanticVisitor methodsFor: 'analizing' stamp: 'KenD 28/Jun/2026 13:27:40'!
analyzeIdentifier: anIdentifierNode assignee: aBoolean
	| script binding |
	anIdentifierNode resolveAssigning: aBoolean.
	aBoolean ifTrue: [anIdentifierNode beAssigned].
	script := anIdentifierNode compiler activeScript.
	binding := anIdentifierNode binding.
	script reference: binding.
	binding isLocal ifTrue: [binding := script scope captureLocal: binding].
	anIdentifierNode binding: binding
! !

!SSemanticVisitor methodsFor: 'analizing' stamp: 'KenD 28/Jun/2026 13:27:40'!
analyzeMessage: aMessageNode
	inliner inline: aMessageNode.
	aMessageNode isInlined ifFalse: [aMessageNode compiler noticeSend]
! !

!SSemanticVisitor methodsFor: 'analizing' stamp: 'KenD 28/Jun/2026 13:27:40'!
analyzeMethod: aMethodNode while: aBlock
	self analyzeScript: aMethodNode while: aBlock
! !

!SSemanticVisitor methodsFor: 'analizing' stamp: 'KenD 28/Jun/2026 13:27:40'!
analyzeReturn: aReturnNode
	aReturnNode compiler activeScript realScript captureHome
! !

!SSemanticVisitor methodsFor: 'analizing' stamp: 'KenD 28/Jun/2026 13:27:40'!
analyzeScript: aScriptNode while: aBlock
	aScriptNode compiler activate: aScriptNode while: aBlock
! !

!SSemanticVisitor methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	inliner := MessageInliner new
! !

!SSemanticVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitAssignment: anAssignmentNode
	self analyzeAssignment: anAssignmentNode.
	anAssignmentNode expression acceptVisitor: self
! !

!SSemanticVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitBlock: aBlockNode
	self
		analyzeBlock: aBlockNode
		while: [aBlockNode statements do: [:node | node acceptVisitor: self]]
! !

!SSemanticVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitBraceNode: aBraceNode
	aBraceNode isLiteral
		ifFalse: [aBraceNode asMessageNode acceptVisitor: self]
! !

!SSemanticVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitCascade: aCascadeNode
	aCascadeNode receiver acceptVisitor: self.
	aCascadeNode messages do: [:msg | msg acceptVisitor: self]
! !

!SSemanticVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitIdentifier: anIdentifierNode
	self analyzeIdentifier: anIdentifierNode
! !

!SSemanticVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitMessage: aMessageNode
	self analyzeMessage: aMessageNode.
	aMessageNode receiver acceptVisitor: self.
	aMessageNode arguments do: [:arg | arg acceptVisitor: self]
! !

!SSemanticVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitMethod: aMethodNode
	self analyzeMethod: aMethodNode while: [
		aMethodNode bindLocals.
		aMethodNode statements do: [:s | s acceptVisitor: self].
		aMethodNode positionLocals]
! !

!SSemanticVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitParseNode: aParseNode
	"
	do nothing
	"
	
! !

!SSemanticVisitor methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitReturn: aReturnNode
	aReturnNode expression acceptVisitor: self.
	self analyzeReturn: aReturnNode
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiledBlockIndexOf: aBlockNode
	| index |
	index := method
		findFirst: [:literal | literal isBlock
			and: [literal blockNumber == aBlockNode index]].
	^index
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeArgument: anInteger env: environment
	| encoded |
	encoded := self encodedEnvironment: environment.
	self
		nextPut: ArgumentId;
		nextIntegerPut: anInteger;
		nextIntegerPut: encoded
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeClosureElements: aBlockNode
	| scope parent |
	scope := aBlockNode scope.
	parent := aBlockNode realParent.
	^Array streamContents: [:s |
		scope capturesSelf ifTrue: [ s nextPut: CaptureSelf ].
		scope capturedEnvironments do: [:e | | index |
			e == parent ifTrue: [s nextPut: CaptureEnvironment] ifFalse: [
				index := aBlockNode environmentIndexOf: e.
				self ASSERT: index notNil.
				s nextPut: CaptureEnvironmentValue; nextPut: index]].
		scope capturedArguments do: [:a | | binding |
			binding := aBlockNode parent scope resolve: a name.
			s 	nextPut: binding environmentCaptureType; nextPut: binding index]]
	
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeDynamicVar: name
	stream nextPut: DynamicVarId.
	self nextSymbolPut: name
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeFalse
	stream nextPut: FalseId
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeLoadRvisitingReceiver
	stream nextPut: LoadRvisitingReceiverId
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeNestedDynamicVar: name
	stream nextPut: NestedDynamicVarId.
	self nextLiteralPut: name 
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeNil
	stream nextPut: NilId
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodePopR
	stream nextPut: PopRid 
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodePushR
	stream nextPut: PushRid 
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeSelf
	stream nextPut: SelfId
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeSuper
	stream nextPut: SuperId
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeTemporary: anInteger env: environment
	| encoded |
	encoded := self encodedEnvironment: environment.
	self
		nextPut: TemporaryId;
		nextIntegerPut: anInteger;
		nextIntegerPut: encoded
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeTrue
	stream nextPut: TrueId
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodedEnvironment: aLocalEnvironment
	aLocalEnvironment isStack
		ifTrue: [ ^ aLocalEnvironment isInlinedArgument
				ifTrue: [ -1 ]
				ifFalse: [ -2 ] ].
	aLocalEnvironment isCurrent
		ifTrue: [ ^ 0 ].
	^ aLocalEnvironment index
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextBigIntegerPut: anInteger
	stream
		nextPut: 16r80;
		nextInt64Put: anInteger
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextBooleanPut: aBoolean
	stream nextPut: aBoolean asParameter

! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextIntegerPut: anInteger
	| value |
	(anInteger > 127 or: [ anInteger < -127 ])
		ifTrue: [ ^ self nextBigIntegerPut: anInteger ].
	value := anInteger >= 0
		ifTrue: [ anInteger ]
		ifFalse: [ anInteger + 16r100 ].
	stream nextPut: value
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextLiteralPut: anObject
	| index |
	index := method
		indexOf: anObject
		ifAbsent: [ self ASSERT: false ].
	self nextIntegerPut: index
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextPut: anInteger
	stream nextPut: anInteger
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextPutAll: aCollection
	stream nextPut: aCollection size; nextPutAll: aCollection
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextSymbolPut: aSymbol
	| index |
	index := method
		indexOf: aSymbol asSymbol
		ifAbsent: [ self ASSERT: false ].
	self nextIntegerPut: index
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextTypePut: anInteger
	stream nextPut: anInteger
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitAssignment: anAssignmentNode
	| assignees |
	self nextTypePut: AssignmentId.
	assignees := anAssignmentNode assignees.
	self nextIntegerPut: assignees size.
	assignees do: [ :node | node acceptVisitor: self ].
	anAssignmentNode expression acceptVisitor: self
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitBlock: aBlockNode
	| args inlined |
	self nextTypePut: BlockId.
	inlined := aBlockNode isInlined.
	self nextBooleanPut: inlined.
	inlined
		ifTrue: [ args := aBlockNode arguments collect: [ :id | id binding index ].
			self nextPutAll: args asArray ]
		ifFalse: [ | index captured |
			index := self compiledBlockIndexOf: aBlockNode.
			self nextPut: index.
			captured := self encodeClosureElements: aBlockNode.
			self nextPutAll: captured ].
	self visitScript: aBlockNode
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitBraceNode: aBraceNode
	aBraceNode isLiteral
		ifTrue: [self visitLiteral: aBraceNode asLiteralNode]
		ifFalse: [self visitCascade: aBraceNode asMessageNode]
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitCascade: aCascadeNode
	| messages |
	self nextTypePut: CascadeId.
	aCascadeNode receiver acceptVisitor: self.
	messages := aCascadeNode messages.
	self nextIntegerPut: messages size.
	messages do: [ :node | self visitCascadeMessage: node ]
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitCascadeMessage: aCascadeMessageNode
	| arguments |
	self nextSymbolPut: aCascadeMessageNode selector symbol.
	arguments := aCascadeMessageNode arguments.
	self nextIntegerPut: arguments size.
	arguments do: [ :arg | arg acceptVisitor: self ]
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitIdentifier: anIdentifierNode
	self nextTypePut: IdentifierId.
	anIdentifierNode binding encodeUsing: self
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitLiteral: aLiteralNode
	| index |
	index := method indexOf: aLiteralNode value.
	self
		nextTypePut: LiteralId;
		nextIntegerPut: index.
	index = 0
		ifTrue: [ self nextIntegerPut: aLiteralNode value ]
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitMessage: aMessageNode
	| arguments |
	self
		nextTypePut: MessageId;
		nextBooleanPut: aMessageNode isInlined;
		nextSymbolPut: aMessageNode selector symbol.
	aMessageNode receiver acceptVisitor: self.
	arguments := aMessageNode arguments.
	self nextIntegerPut: arguments size.
	arguments do: [ :arg | arg acceptVisitor: self ]
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitMethod: aMethodNode
	| pragma |
	self nextTypePut: MethodId.
	pragma := aMethodNode pragma.
	pragma isUsed
		ifTrue: [ self nextTypePut: PragmaId.
			pragma name
				ifNotNil: [ self nextSymbolPut: pragma name ]
				ifNil: [ self nextPut: 0 ] ].
	self visitScript: aMethodNode.
	^ stream contents 
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitParseNode: aParseNode
	^self ASSERT: false
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitReturn: aReturnNode
	self
		nextTypePut: ReturnId;
		nextBooleanPut: script realScript isMethod.
	
		aReturnNode expression acceptVisitor: self
! !

!TreecodeEncoder methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
visitScript: aScriptNode
	| prev statements |
	prev := script.
	script := aScriptNode.
	statements := aScriptNode statements.
	self nextIntegerPut: statements size.
	statements do: [ :node | node acceptVisitor: self ].
	script := prev
! !

!TreecodeEncoder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	stream := #[] writeStream
! !

!TreecodeEncoder methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
method: aCompiledMethod
	method := aCompiledMethod
! !

!TreecodeEncoder class methodsFor: 'class initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initializeBindingIds
	| named |
	named := self addNamespaceAs: #BindingIds.
	named
		at: #NilId put: 1;
		at: #TrueId put: 2;
		at: #FalseId put: 3;
		at: #ArgumentId put: 4;
		at: #TemporaryId put: 5;
		at: #SelfId put: 6;
		at: #SuperId put: 7;
		at: #DynamicVarId put: 14;
		at: #NestedDynamicVarId put: 15;
		at: #PushRid put: 50;
		at: #PopRid put: 51
! !

!TreecodeEncoder class methodsFor: 'class initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initializeTreecodeIds
	| named |
	named := self addNamespaceAs: #TreecodeIds.
	named
		at: #MethodId put: 101;
		at: #BlockId put: 102;
		at: #IdentifierId put: 103;
		at: #LiteralId put: 104;
		at: #MessageId put: 105;
		at: #CascadeId put: 106;
		at: #BraceId put: 107;
		at: #AssignmentId put: 108;
		at: #ReturnId put: 109;
		at: #PragmaId put: 110
! !

!ScriptScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
capturesSelf
	^ captureSelf
! !

!ScriptScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
describe: identifier
	| binding type |
	binding := self resolve: identifier.
	type := self class name asLowercase allButLast: 'scope' size.
	^binding description , ' of ' , type
! !

!ScriptScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentSize
	^envSize
! !

!ScriptScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
scopeOf: aString
	| s |
	s := self scriptDefining: aString.
	^s notNil ifTrue: [s scope]
! !

!ScriptScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
stackSize
	^stackSize
! !

!ScriptScope methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
defineArgument: identifier
	| binding |
	(self resolves: identifier) ifTrue: [self redefinitionError: identifier].
	binding := ArgumentBinding new name: identifier.
	arguments define: identifier as: binding.
	^binding
! !

!ScriptScope methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
defineTemporary: identifier
	| binding |
	(temporaries defines: identifier)
		ifTrue: [self redefinitionError: identifier].
	binding := TemporaryBinding new name: identifier.
	temporaries define: identifier as: binding.
	^binding
! !

!ScriptScope methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
defines: aString
	^(temporaries defines: aString) or: [arguments defines: aString]
! !

!ScriptScope methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
localBindings
	^arguments values , temporaries values
! !

!ScriptScope methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
resolveLocal: aString
	(temporaries at: aString) ifNotNil: [:binding | ^binding].
	^arguments at: aString
! !

!ScriptScope methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
resolves: aString
	^(self resolve: aString) isDynamic not
! !

!ScriptScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
growEnvironment
	^envSize := envSize + 1
! !

!ScriptScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
growStack
	^stackSize := stackSize + 1
! !

!ScriptScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionDefinedArguments
	arguments withIndexDo: [:binding :index | binding index: index]
! !

!ScriptScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionDefinedLocals
	self positionDefinedTemporariesIn: self; positionDefinedArguments
! !

!ScriptScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionDefinedTemporariesIn: aScriptScope
	temporaries do: [:binding | | position |
		position := binding isInStack
			ifTrue: [aScriptScope growStack]
			ifFalse: [aScriptScope growEnvironment].
		binding index: position]
! !

!ScriptScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionLocals
	self positionDefinedLocals
! !

!ScriptScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
realScope
	^script realScript scope
! !

!ScriptScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
redefinitionError: name
	| scope description |
	scope := self scopeOf: name.
	description := scope describe: name.
	script compiler
		warning: name , ' already declared as ' , description
		at: script stretch
! !

!ScriptScope methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	arguments := StaticBinder new.
	temporaries := StaticBinder new.
	stackSize := envSize := 0.
		captureSelf := false.
! !

!ScriptScope methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
script: aScriptNode
	script := aScriptNode
! !

!ScriptScope class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:40'!
on: aScriptNode
	^self new script: aScriptNode
! !

!BlockScope methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureArgument: anArgumentBinding
	| name |
	name := anArgumentBinding name.
	^captured at: name ifAbsentPut: [| transferred copy |
		transferred := self parent transferLocal: name.
		copy := self copyLocal: transferred.
		copy declaration: transferred declaration]
! !

!BlockScope methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
localBindings
	^super localBindings , captured values
! !

!BlockScope methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
resolve: aString
	(self resolveLocal: aString) ifNotNil: [:binding | ^binding].
	^self parent resolve: aString
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureEnvironment: aScriptNode
	script == aScriptNode ifTrue: [^self].
	(environments includesIdentical: aScriptNode) ifTrue: [^self].
	self realParent captureEnvironment: aScriptNode.
	aScriptNode isMethod
		ifTrue: [environments addFirst: aScriptNode]
		ifFalse: [environments addLast: aScriptNode]
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
capturedEnvironmentIndexOf: aScriptNode
	| index |
	aScriptNode realScript == script realScript
		ifTrue: [ ^ nil ].
	index := environments indexOf: aScriptNode ifAbsent: nil.
	self ASSERT: index notNil.
	^self capturesSelf ifTrue: [ index + 1 ] ifFalse: [ index ]
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
copyLocal: binding
	^script isInlined ifTrue: [binding] ifFalse: [binding copy beInArray]
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentIndexOf: aScriptNode
	"
	temporal compatibility
	"
	(aScriptNode isKindOf: SScriptNode)
		ifFalse: [ self ASSERT: false. ^nil ].
	^self capturedEnvironmentIndexOf: aScriptNode
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentSizeUpToCapturedArguments
	^self environmentSizeUpToEnvironments + self capturedArguments size
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentSizeUpToEnvironments
	| receiver |
	receiver := self capturesSelf ifTrue: [ 1 ] ifFalse: [ 0 ].
	^receiver + environments size
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
parent
	^script parent scope
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionCapturedArgument: anArgumentBinding
	anArgumentBinding index: self growEnvironment
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionCapturedLocals
	script isInlined ifTrue: [^self].
	envSize := self environmentSizeUpToEnvironments.
	captured do: [:binding | 
		binding isArgument
			ifTrue: [self positionCapturedArgument: binding]
			ifFalse: [self positionCapturedTemporary: binding]]
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionCapturedTemporary: aTemporaryBinding
	| outest index declaration |
	outest := self scriptDefining: aTemporaryBinding name.
	index := self capturedEnvironmentIndexOf: outest realScript.
	aTemporaryBinding environmentIndex: index.
	declaration := outest scope resolve: aTemporaryBinding name.
	self ASSERT: declaration index isInteger.
	aTemporaryBinding index: declaration index
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionDefinedArgumentsIn: aScriptScope
	arguments do: [:binding | | index |
		index := binding isInArray
			ifTrue: [aScriptScope growEnvironment]
			ifFalse: [aScriptScope growStack].
		binding index: index]
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionDefinedLocals
	| real |
	script isInlined
		ifTrue: [
			real := self realScope.
			self
				positionDefinedTemporariesIn: real;
				positionDefinedArgumentsIn: real]
		ifFalse: [super positionDefinedLocals]
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionLocals
	self positionCapturedLocals.
	super positionLocals
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
realParent
	^script realParent scope
! !

!BlockScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
transferLocal: name
	| binding copy |
	(self resolveLocal: name) ifNotNil: [:b | ^b].
	binding := self parent transferLocal: name.
	copy := self copyLocal: binding.
	captured at: name put: copy.
	^copy
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureLocal: aLocalBinding
	(self defines: aLocalBinding name) ifTrue: [^aLocalBinding].
	^aLocalBinding isTemporary
		ifTrue: [self captureTemporary: aLocalBinding]
		ifFalse: [self captureArgument: aLocalBinding]
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureSelf
	captureSelf ifTrue: [^self].
	captureSelf := true.
	self parent captureSelf
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureTemporary: aTemporaryBinding
	| name |
	name := aTemporaryBinding name.
	(self defines: name) ifTrue: [^aTemporaryBinding].
	^captured at: name ifAbsentPut: [| parent declaration transferred copy |
		parent := self parent.
		declaration := parent scriptDefining: name.
		self realScope captureEnvironment: declaration realScript.
		transferred := parent transferLocal: name.
		copy := self copyLocal: transferred.
		copy isInArray ifTrue: [aTemporaryBinding beInArray].
		copy declaration: transferred declaration]
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
capturedArguments
	^captured select: [:b | b isArgument]
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
capturedEnvironments
	^environments
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
capturesHome
	^self home notNil
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
environments
	"
	compatibility, removes the home environment
	"
	| first |
	environments isEmpty ifTrue: [^#()].
	first := environments first.
	^first isMethod ifTrue: [environments allButFirst] ifFalse: [environments]
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
home
	| first |
	environments isEmpty ifTrue: [^nil].
	first := environments first.
	^first isMethod ifTrue: [first]
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
resolveLocal: aString
	(super resolveLocal: aString) ifNotNil: [:binding | ^binding].
	^captured at: aString
! !

!BlockScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
scriptDefining: aString
	(self defines: aString) ifTrue: [^script].
	^self parent scriptDefining: aString
! !

!BlockScope methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	captured := StaticBinder new.
	environments := OrderedCollection new
! !

!MethodScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureEnvironment: aScriptNode
	self ASSERT: aScriptNode == script
! !

!MethodScope methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
transferLocal: name
	^self resolveLocal: name
! !

!MethodScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureLocal: aLocalBinding
	self ASSERT: (self resolveLocal: aLocalBinding name) notNil.
	^aLocalBinding
! !

!MethodScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureSelf
	captureSelf := true.

! !

!MethodScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentIndexOf: aScriptNode
	self ASSERT: aScriptNode == script.
	^nil
! !

!MethodScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
resolve: aString
	(self resolveLocal: aString) ifNotNil: [ :binding | ^ binding ].
	(self resolvePseudo: aString) ifNotNil: [ :binding | ^ binding ].
	^ DynamicBinding named: aString
! !

!MethodScope methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
scriptDefining: aString
	(self resolveLocal: aString) ifNotNil: [^script].
	self ASSERT: false.
	^nil
! !

!MethodScope methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	self initializePseudoVars
! !

!MethodScope methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initializePseudoVars
	pseudo := StaticBinder new.
	pseudo
		at: 'nil' put: NilBinding new;
		at: 'true' put: TrueBinding new;
		at: 'false' put: FalseBinding new;
		at: 'self' put: SelfBinding new;
		at: 'super' put: SuperBinding new
! !

!MethodScope methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
resolvePseudo: aString
	^pseudo at: aString

! !

!Binding methodsFor: 'actions' stamp: 'KenD 28/Jun/2026 13:27:40'!
beReferencedFrom: aScriptNode
	
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
canBeAssigned
	^true
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
declaration
	^self
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeUsing: aTreecodeEncoder
	self ASSERT: false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isArgument
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isClassBinding
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isClassVariable
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isConstantBinding
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isDynamic
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isGlobal
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isInStack
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isInstVar
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isLiteral
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isLocal
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isPoolVariableBinding
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isSelf
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isSelfOrSuper
	^self isSelf or: [self isSuper]
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isSuper
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isTemporary
	^false
! !

!Binding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
literal
	^nil
! !

!Binding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
name
	^name
! !

!Binding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
name: aString
	name := aString
! !

!Binding methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
printNameOn: aStream
		aStream
		print: name

! !

!Binding methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
printOn: aStream
	self printNameOn: aStream.
	aStream
		nextPutAll: ' ('.
	super printOn: aStream.
	aStream nextPutAll: ')'
! !

!DynamicBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
beReferencedFrom: aScriptNode
	"a dynamic binding could refer to an ivar, so we have to be conservative"
	aScriptNode useSelf
! !

!DynamicBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeUsing: aTreecodeEmitter
	aTreecodeEmitter encodeDynamicVar: name
! !

!DynamicBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isDynamic
	^true
! !

!DynamicBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
literal
	^name asSymbol
! !

!DynamicBinding class methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
default
	^Default ifNil: [Default := self new name: '<unresolved>']
! !

!DynamicBinding class methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
named: aString
	| index first second |
	index := aString indexOf: $..
	index = 0 ifTrue: [ ^self new name: aString ].
	first := aString copyFrom: 1 to: index - 1.
	second := aString copyFrom: index + 1 to: aString size.
	^NestedDynamicBinding new name: { first. second }
! !

!NestedDynamicBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeUsing: aTreecodeEmitter
	aTreecodeEmitter encodeNestedDynamicVar: name
! !

!NestedDynamicBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
literal
	^name collect: [ :n | n asSymbol]
! !

!NestedDynamicBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
printNameOn: aStream
	name do: [ :n | aStream nextPutAll: n ] separatedBy: [ aStream nextPut: $. ]
! !

!LiteralBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isLiteral
	^true
! !

!FalseBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeUsing: aTreecodeEmitter
	aTreecodeEmitter encodeFalse
! !

!FalseBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
name
	^'false'
! !

!FalseBinding methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:40'!
value
	^false
! !

!NilBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
encodeUsing: aTreecodeEmitter
	aTreecodeEmitter encodeNil
! !

!NilBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
name
	^'nil'
! !

!NilBinding methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:41'!
value
	^nil
! !

!TrueBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeUsing: aTreecodeEmitter
	aTreecodeEmitter encodeTrue
! !

!TrueBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
name
	^'true'
! !

!TrueBinding methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:40'!
value
	^true
! !

!LocalBinding methodsFor: 'actions' stamp: 'KenD 28/Jun/2026 13:27:40'!
beInArray
	environment := ArrayEnvironment new
! !

!LocalBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
declaration
	^declaration
! !

!LocalBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
declaration: anIdentifierNode
	declaration := anIdentifierNode
! !

!LocalBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
environment
	^environment index
! !

!LocalBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentCaptureType
	^environment captureType
! !

!LocalBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentIndex
	^environment index
! !

!LocalBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentIndex: anInteger
	environment index: anInteger
! !

!LocalBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentObject
	^environment
! !

!LocalBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
index
	^index
! !

!LocalBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
index: aNumber
	index := aNumber
! !

!LocalBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isInArray
	^self isInStack not
! !

!LocalBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isInStack
	^environment isStack
! !

!LocalBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isLocal
	^true
! !

!ArgumentBinding methodsFor: 'actions' stamp: 'KenD 28/Jun/2026 13:27:40'!
beInlined
	environment := InlinedArgEnvironment new
! !

!ArgumentBinding methodsFor: 'actions' stamp: 'KenD 28/Jun/2026 13:27:40'!
description
	^'argument ' , name
! !

!ArgumentBinding methodsFor: 'actions' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeUsing: aTreecodeEncoder
	aTreecodeEncoder encodeArgument: index env: environment
! !

!ArgumentBinding methodsFor: 'actions' stamp: 'KenD 28/Jun/2026 13:27:40'!
isInlined
	^environment isInlinedArgument
! !

!ArgumentBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
canBeAssigned
	^false
! !

!ArgumentBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
index: aNumber
	index := aNumber.

! !

!ArgumentBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isArgument
	^true
! !

!ArgumentBinding methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	environment := ArgumentEnvironment new
! !

!TemporaryBinding methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
description
	^'temporary ' , name
! !

!TemporaryBinding methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeUsing: aTreecodeEncoder
	aTreecodeEncoder encodeTemporary: index env: environment
! !

!TemporaryBinding methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	environment := StackEnvironment new
! !

!TemporaryBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isTemporary
	^true
! !

!SelfBinding methodsFor: 'actions' stamp: 'KenD 28/Jun/2026 13:27:40'!
beReferencedFrom: aScriptNode
	aScriptNode useSelf
! !

!SelfBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
canBeAssigned
	^false
! !

!SelfBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeUsing: aTreecodeEmitter
	aTreecodeEmitter encodeSelf
! !

!SelfBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isSelf
	^true
! !

!SelfBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
name
	^'self'
! !

!SuperBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
encodeUsing: aTreecodeEmitter
	aTreecodeEmitter encodeSuper
! !

!SuperBinding methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
name
	^'super'
! !

!SuperBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isSelf
	^false
! !

!SuperBinding methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isSuper
	^true
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
activate: aScriptNode while: aBlock
	| current |
	current := activeScript.
	activeScript := aScriptNode.
	aBlock value.
	activeScript := current
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
activeScope
	^activeScript scope
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
activeScript
	^activeScript
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
activeScript: aParseNode
	activeScript := aParseNode
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
ast
	^ast
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
frontend
	^frontend
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
frontend: aCompiler
	frontend := aCompiler
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
parser
	^SSmalltalkParser new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
result
	^result
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
scanner
	^SSmalltalkScanner new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
sourceCode
	^source
! !

!SSmalltalkCompiler methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
sourceCode: aString
	source := aString
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
assignmentNode
	^SAssignmentNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
blockNode
	^SBlockNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
braceNode
	^SBraceNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildMethod
	result method: ast buildMethod
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
cascadeMessageNode
	^SCascadeMessageNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
cascadeNode
	^SCascadeNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
commentNode
	^SCommentNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
compileMethod: aString
	source := aString.
	frontend protect: [
		self
			parseMethod;
			resolveSemantics;
			buildMethod].
	^result
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
delimiterToken
	^SDelimiterToken new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
endToken
	^SEndToken new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasBlocks
	^ blocks > 0
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasSends
^ leaf not
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
identifierNode
	^SIdentifierNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	self reset

! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
literalNode
	^SLiteralNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
messageNode
	^SMessageNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
methodNode
	^SMethodNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
noticeSend
	leaf := false
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
numericLiteralNode
	^SNumberNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
pragmaNode
	^SPragmaNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
reset
	self resetResult.
	leaf := true.
	blocks := 0.
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
returnNode
	^SReturnNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
selectorNode
	^SSelectorNode new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'nodes' stamp: 'KenD 28/Jun/2026 13:27:40'!
stringToken
	^SStringToken new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'emitting' stamp: 'KenD 28/Jun/2026 13:27:40'!
blockCount
	^blocks
! !

!SSmalltalkCompiler methodsFor: 'emitting' stamp: 'KenD 28/Jun/2026 13:27:40'!
blockIndex
	blocks := blocks + 1.
	^blocks - 1
! !

!SSmalltalkCompiler methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
compilationError: aString stretch: aStretch
	^SCompilationError new
		compiler: self;
		stretch: aStretch;
		description: aString
! !

!SSmalltalkCompiler methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
error: aString at: anInteger
	| stretch |
	stretch := anInteger thru: anInteger.
	^self error: aString stretch: stretch
! !

!SSmalltalkCompiler methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
error: aString stretch: aStretch
	| error |
	error := self compilationError: aString stretch: aStretch.
	^error beFatal; signal
! !

!SSmalltalkCompiler methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
warning: aString at: aStretch
	| error |
	error := self compilationError: aString stretch: aStretch.
	error beWarning; signal
! !

!SSmalltalkCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parseFragment
	headless := false.
	self reset.
	ast := self parser methodFragment.
	result ast: ast
! !

!SSmalltalkCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parseFragment: aString
	source := aString.
	[self parseFragment; resolveSemantics] on: SCompilationError do: [].
	^ast
! !

!SSmalltalkCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parseMethod
	headless := false.
	self reset.
	ast := self parser method.
	result ast: ast
! !

!SSmalltalkCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parseMethod: aString
	source := aString.
	frontend protect: [self parseMethod; resolveSemantics].
	^result
! !

!SSmalltalkCompiler methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
resolveSemantics
	ast acceptVisitor: SSemanticVisitor new
! !

!SSmalltalkCompiler methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
resetResult
	result := SCompilationResult new compiler: self
! !

!SSmalltalkCompiler methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
supportsBraceNodes
	^true
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
addBodyTo: aMethodNode
	self
		addTemporariesTo: aMethodNode;
		addPragmaTo: aMethodNode;
		addStatementsTo: aMethodNode
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
addStatementsTo: aMethodNode
	aMethodNode
		position: token position;
		addStatements: self statements;
		end: token position;
		moveCommentsFrom: token.
	token isEnd
		ifFalse: [^self unexpectedStatementError: aMethodNode statements]
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
addTemporariesTo: aMethodNode
	aMethodNode temporaries: self temporaries
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
cascadeSequence: aMessageNode
	| cascade receiver messages msg node |
	(token is: $;) ifFalse: [^aMessageNode].
	cascade := self buildNode: compiler cascadeNode at: aMessageNode position.
	receiver := aMessageNode receiver.
	cascade receiver: receiver.
	node := compiler cascadeMessageNode from: aMessageNode.
	node cascade: cascade.
	messages := OrderedCollection with: node.
	[token is: $;] whileTrue: [
		self step.
		msg := self buildCascadeMessageNode: receiver.
		msg
			cascade: cascade;
			position: token position;
			moveCommentsFrom: token.
		messages add: msg.
		self cascadeMessage: msg].
	^cascade messages: messages asArray; end: msg end
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
expression
	| primary expression |
	(token isNameToken and: [self peek isAssignment]) ifTrue: [^self assignment].
	primary := self primary ifNil: [^self missingExpression].
	expression := self unarySequence: primary.
	expression := self binarySequence: expression.
	expression := self keywordSequence: expression.
	expression == primary
		ifFalse: [expression := self cascadeSequence: expression].
	token endsExpression ifFalse: [self errorIn: primary].
	^expression
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
keywordSignature
	| selector arguments node |
	selector := '' writeStream.
	arguments := OrderedCollection new.
	node := self buildNode: compiler selectorNode at: token position.
	[token isKeyword] whileTrue: [
		selector nextPutAll: token value.
		node addKeyword: token asSelectorNode.
		self step.
		token isNameToken ifFalse: [self missingArgument].
		arguments add: token asIdentifierNode.
		self step].
	arguments isEmpty ifTrue: [^nil].
	node
		symbol: selector contents;
		end: token end;
		moveCommentsFrom: token.
	^self buildMethodNode: node arguments: arguments
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
methodPragma
	self step.
	^[| method |
		method := self methodSignature.
		self addTemporariesTo: method; attachPragmaTo: method.
		method pragma]
		on: SCompilationError
		do: [:ex | ex return: compiler pragmaNode]
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
methodSignature
	self keywordSignature ifNotNil: [:m | ^m].
	self binarySignature ifNotNil: [:m | ^m].
	self unarySignature ifNotNil: [:m | ^m].
	self error: 'method signature expected'
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
parenthesizedExpression
	| start open expression |
	start := token position.
	open := self step.
	expression := self expression.
	expression moveCommentsFrom: open.
	(token is: $)) ifFalse: [self missingToken: ')'].
	expression isImmediate
		ifFalse: [expression position: start; end: token position].
	self step.
	^expression
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
primary
	token isNameToken ifTrue: [^self step asIdentifierNode].
	token isLiteral ifTrue: [^self step].
	(token is: $[) ifTrue: [^self block].
	(token is: $() ifTrue: [^self parenthesizedExpression].
	(token is: #'#(') ifTrue: [^self literalArray].
	(token is: #'#[') ifTrue: [^self literalByteArray].
	(compiler supportsBraceNodes and: [token is: ${]) ifTrue: [^self bracedArray].
	(token is: #'-') ifTrue: [^self negativeNumber].
	(token is: #'<') ifTrue: [^self taggedNode].
	^nil
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
return
	| return expression end node |
	return := self step.
	expression := self expression.
	expression moveCommentsFrom: token.
	end := token position.
	self skipDots.
	node := self buildNode: compiler returnNode at: return position.
	^node
		return: return;
		end: end;
		expression: expression;
		moveCommentsFrom: return
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
statement
	| expression |
	((token is: $^) or: [token is: $↑]) ifTrue: [^self return].
	expression := self expression.
	token moveCommentsTo: expression.
	^expression
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
statements
	| statements |
	statements := OrderedCollection new.
	[
		token endsExpression ifTrue: [^statements].
		statements add: self statement.
		token is: $.]
		whileTrue: [self skipDots].
	^statements
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
step
	| save comments |
	save := token.
	self next isComment ifFalse: [^save].
	comments := OrderedCollection new: 2.
	[
		comments add: token.
		self next isComment] whileTrue.
	token comments: comments.
	^save
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
temporaries
	| temporaries |
	(token is: #'||') ifTrue: [
		self step.
		^#()].
	token isBar ifFalse: [^#()].
	temporaries := OrderedCollection new.
	[
		self step.
		token isNameToken]
		whileTrue: [
			self validateLocalName: token.
			temporaries add: token asIdentifierNode].
	token isBar ifFalse: [self missingToken: '|'].
	self step.
	^temporaries
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
unaryMessage: aMessageNode
	| selector |
	selector := self unarySelector.
	aMessageNode
		selector: selector;
		end: selector end;
		arguments: #();
		moveCommentsFrom: selector
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
unarySelector
	| selector start end node |
	selector := token value.
	start := token position.
	end := start + selector size - 1.
	self step.
	node := self buildNode: compiler selectorNode at: start.
	^node
		symbol: selector;
		end: end;
		moveCommentsFrom: token
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
unarySequence: aParseNode
	| node receiver |
	node := aParseNode.
	node isNameToken ifTrue: [node := node asIdentifierNode].
	[
		receiver := node.
		self hasUnarySelector]
		whileTrue: [
			node := self buildMessageNode: receiver.
			self unaryMessage: node].
	^node moveCommentsFrom: token
! !

!SSmalltalkParser methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
unarySignature
	self hasUnarySelector ifFalse: [^nil].
	^self buildMethodNode: self unarySelector arguments: #()
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
addByteTo: aCollection
	| byte |
	byte := token isLiteral ifTrue: [token value] ifFalse: [token literalValue].
	byte isInteger ifFalse: [self nonIntegerToken].
	(byte between: 0 and: 255) ifFalse: [self invalidByteValue].
	aCollection add: byte
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
assignment
	| position variable delimiter expression assignment |
	position := token position.
	variable := self step asIdentifierNode moveCommentsFrom: token.
	delimiter := self step.
	expression := self expression.
	expression isAssign
		ifTrue: [^expression assign: variable operator: delimiter].
	expression moveCommentsFrom: token.
	assignment := self buildNode: compiler assignmentNode at: position.
	^assignment assign: variable with: expression operator: delimiter
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
attachPragmaTo: aMethodNode
	| start pragma |
	(aMethodNode isHeadless orNot: [token is: #'<']) ifTrue: [^false].
	start := token position.
	self step.
	pragma := token isKeyword
		ifTrue: [self ffiOrPrimitive: aMethodNode]
		ifFalse: [self symbolicPragma].
	pragma position: start; end: token position.
	aMethodNode pragma: pragma.
	(token is: #'>') ifFalse: [self missingToken: '>'].
	^true
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildBraceNode: elements at: position
	| node |
	node := self buildNode: compiler braceNode at: position.
	^node elements: elements
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildCascadeMessageNode: receiver
	| node |
	node := self buildNode: compiler cascadeMessageNode at: receiver position.
	^node receiver: receiver
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildMessageNode: receiver
	| node |
	node := self buildNode: compiler messageNode at: receiver position.
	^node receiver: receiver
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildMethodNode: selector arguments: arguments
	| node |
	node := self buildNode: compiler methodNode at: selector position.
	compiler activeScript: node.
	^node selector: selector; arguments: arguments
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildNode: aParserNode at: anInteger
	^aParserNode position: anInteger; end: token position
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildNode: aParseNode at: anInteger with: anObject
	| node |
	node := scanner buildToken: aParseNode at: anInteger with: anObject.
	^node end: token position
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
cascadeMessage: aMessageNode
	| msg |
	self hasUnarySelector ifTrue: [^self unaryMessage: aMessageNode].
	self hasBinarySelector ifTrue: [^self binaryMessage: aMessageNode].
	self hasKeywordSelector ifTrue: [^self keywordMessage: aMessageNode].
	msg := token value = ''
		ifTrue: ['unfinished cascade']
		ifFalse: [token value asString , ' not allowed in cascade'].
	self error: msg
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
ffiArguments
	| args type |
	args := OrderedCollection new.
	self step.
	token value !!= $(
		ifTrue: [ self error: 'expected "("' ].
	self peek value = $)
		ifTrue: [ self step.
			^ args ].
	[ type := self ffiType.
	args add: type.
	self step.
	token value = #, ] whileTrue.
	token value !!= $)
		ifTrue: [ self error: 'expected ")"' ].
	^ args
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
ffiCall: aBoolean method: aMethodNode
	| cc return name args descriptor |
	cc := token value.
	return := self ffiType.
	aBoolean
		ifTrue: [ self step.
			name := token value ifNil: [ self error: 'invalid function name' ] ].
	args := self ffiArguments.
	args size = aMethodNode selector arity
		ifFalse:
			[ ^ self error: 'method arity does not match with function arguments' ].
	self step.
	descriptor := SFFIDescriptor ret: return args: args cc: cc.
	^ compiler pragmaNode ffi: cc name: name with: descriptor
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
ffiOrPrimitive: aMethodNode
	| tag |
	tag := token value asLowercase.
	tag last = $: ifFalse: [self invalidPragma].
	tag := tag allButLast.
	token value: tag.
	tag = 'primitive' ifTrue: [^self primitive].
	tag = 'callback' ifTrue: [ ^self ffiCall: false method: aMethodNode ].
	tag = 'callout' ifTrue: [ ^self ffiCall: true method: aMethodNode ].	
	self invalidPragma
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
ffiType
	| type |
	self step.
	token isNameToken ifFalse: [self error: 'expected type name'].
	type := token value.
	type = 'struct' ifFalse: [ ^type].
	self step.
	token isNameToken ifFalse: [self error: 'expected type name'].	
	^token value
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasKeywordSelector
	^token isKeyword
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasUnarySelector
	^token isNameToken
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
invalidPragma
	| position stretch |
	position := token position.
 	stretch := position thru: position.
	^SInvalidPragmaError new stretch: stretch; signal
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
keywordArgument
	| arg |
	arg := self primary ifNil: [self missingArgument].
	arg := self unarySequence: arg.
	^self binarySequence: arg
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
keywordMessage: aMessageNode
	| selector arguments node |
	node := self buildNode: compiler selectorNode at: token position.
	selector := '' writeStream.
	arguments := OrderedCollection new.
	[token isKeyword] whileTrue: [
		selector nextPutAll: token value.
		node addKeyword: self step.
		arguments add: self keywordArgument].
	node symbol: selector contents; end: token prevPosition.
	aMessageNode
		arguments: arguments;
		end: token prevPosition;
		selector: node
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
keywordSequence: aParseNode
	| expression |
	self hasKeywordSelector ifFalse: [^aParseNode].
	expression := self buildMessageNode: aParseNode.
	self keywordMessage: expression.
	^expression
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
literalKeyword
	| keyword |
	keyword := token value , scanner nextKeyword value.
	^keyword reduced asSymbol
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
namedPrimitive
	| name pragma |
	token isNameToken
		ifFalse: [ self invalidPragma ].
	name := token value.
	pragma := self buildNode: compiler pragmaNode at: token position.
	^ pragma primitive: 0 name: name asSymbol
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
negativeNumber
	token := nil.
	^self negativeNumberOrBinary; step
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
numberedPrimitive
	| number pragma |
	number := token value.
	number isInteger ifFalse: [self invalidPragma].
	pragma := self buildNode: compiler pragmaNode at: token position.
	^pragma primitive: number name: nil
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
primitive
	| primitive |
	self step.
	primitive := token isNumberNode
		ifTrue: [self numberedPrimitive]
		ifFalse: [self namedPrimitive].
	self step.
	^primitive
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
pseudoLiteralValue
	| value |
	token isPoolLiteral ifTrue: [^token literalValue].
	value := token value.
	value = 'nil' ifTrue: [^nil].
	value = 'true' ifTrue: [^true].
	value = 'false' ifTrue: [^false].
	^token isPoolLiteral ifTrue: [token literalValue] ifFalse: [value asSymbol]
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
skipDots
	[token is: $.] whileTrue: [self step]
! !

!SSmalltalkParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
validateLocalName: aSmalltalkToken
	aSmalltalkToken isDelimitedIdentifier ifTrue: [^self].
	(aSmalltalkToken value includes: $.)
		ifTrue: [self error: 'invalid embedded dot']
! !

!SSmalltalkParser methodsFor: 'api support' stamp: 'KenD 28/Jun/2026 13:27:40'!
addPragmaTo: aMethodNode
	(self attachPragmaTo: aMethodNode) ifTrue: [self step]
! !

!SSmalltalkParser methodsFor: 'arrays' stamp: 'KenD 28/Jun/2026 13:27:40'!
arrayBody
	| literals position |
	literals := OrderedCollection new.
	position := token position.
	[
		self step.
		(token is: $)) or: [token isEnd]]
		whileFalse: [| element |
			element := self arrayElement.
			literals add: element].
	token isEnd ifTrue: [self missingToken: ')'].
	^self buildNode: compiler literalNode at: position with: literals asArray
! !

!SSmalltalkParser methodsFor: 'arrays' stamp: 'KenD 28/Jun/2026 13:27:40'!
arrayElement
	token isLiteral ifTrue: [^token value].
	token isNameToken ifTrue: [^self pseudoLiteralValue].
	token isKeyword ifTrue: [^self literalKeyword].
	(token is: #'-') ifTrue: [^self negativeNumberOrBinary].
	token hasSymbol ifTrue: [^token value].
	(token is: $() ifTrue: [^self arrayBody value].
	(token is: #'#(') ifTrue: [^self arrayBody value].
	(token is: #'#[') ifTrue: [^self byteArrayBody value].
	self invalidArrayToken
! !

!SSmalltalkParser methodsFor: 'arrays' stamp: 'KenD 28/Jun/2026 13:27:40'!
braceBody
	| elements position |
	elements := OrderedCollection new.
	position := token position.
	self step.
	[
		token isEnd ifTrue: [self missingToken: '}'].
		token is: $}]
		whileFalse: [
			elements add: self expression.
			(token is: $.) ifTrue: [self step]].
	^self buildBraceNode: elements at: position
! !

!SSmalltalkParser methodsFor: 'arrays' stamp: 'KenD 28/Jun/2026 13:27:40'!
bracedArray
	| array |
	array := self braceBody.
	self step.
	^array
! !

!SSmalltalkParser methodsFor: 'arrays' stamp: 'KenD 28/Jun/2026 13:27:40'!
byteArrayBody
	| bytes save start array node |
	bytes := OrderedCollection new.
	save := token.
	start := token position.
	[
		self step.
		token isLiteral or: [token isPoolLiteral]]
		whileTrue: [self addByteTo: bytes].
	(token is: $]) ifFalse: [
		token isNameToken
			ifTrue: [self missingLiteral]
			ifFalse: [self missingToken: ']']].
	array := ByteArray new: bytes size.
	bytes withIndexDo: [:b :i | array at: i put: b].
	node := self buildNode: compiler literalNode at: start with: array.
	^node moveCommentsFrom: save
! !

!SSmalltalkParser methodsFor: 'arrays' stamp: 'KenD 28/Jun/2026 13:27:40'!
literalArray
	| array |
	array := self arrayBody.
	self step.
	^array
! !

!SSmalltalkParser methodsFor: 'arrays' stamp: 'KenD 28/Jun/2026 13:27:40'!
literalByteArray
	| node |
	node := self byteArrayBody.
	self step.
	^node
! !

!SSmalltalkParser methodsFor: 'arrays' stamp: 'KenD 28/Jun/2026 13:27:40'!
negativeNumberOrBinary
	self peek isNumberNode
		ifTrue: [token := self next negate position: token position - 1].
	^token value
! !

!SSmalltalkParser methodsFor: 'binary' stamp: 'KenD 28/Jun/2026 13:27:40'!
binaryMessage: aMessageNode
	| selector primary argument |
	selector := self step.
	primary := self primary.
	primary isNil ifTrue: [
		((selector is: $:) and: [token is: #'='])
			ifTrue: [self
				error: 'stray whitespaces left in assignment'
				at: token position - 1]
			ifFalse: [self error: 'primary missing']].
	argument := self unarySequence: primary.
	aMessageNode
		selector: selector asSelectorNode;
		end: argument end;
		arguments: {argument}
! !

!SSmalltalkParser methodsFor: 'binary' stamp: 'KenD 28/Jun/2026 13:27:40'!
binarySequence: aParseNode
	| node rcvr |
	node := aParseNode.
	[
		rcvr := node.
		self hasBinarySelector]
		whileTrue: [
			node := self buildMessageNode: rcvr.
			self binaryMessage: node].
	^node
! !

!SSmalltalkParser methodsFor: 'binary' stamp: 'KenD 28/Jun/2026 13:27:40'!
binarySignature
	| selector arguments |
	((token isStringToken and: [token hasSymbol])
		or: [token is: $^]
		or: [token is: $:])
		ifFalse: [^nil].
	selector := self step asSelectorNode.
	token isNameToken ifFalse: [self missingArgument].
	self validateLocalName: token.
	arguments := {token asIdentifierNode}.
	self step.
	token moveCommentsTo: selector.
	^self buildMethodNode: selector arguments: arguments
! !

!SSmalltalkParser methodsFor: 'binary' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasBinarySelector
	^(token isStringToken and: [token hasSymbol])
		or: [token is: $^]
		or: [token is: $:]
! !

!SSmalltalkParser methodsFor: 'blocks' stamp: 'KenD 28/Jun/2026 13:27:40'!
block
	| block |
	block := self buildNode: compiler blockNode at: token position.
	block parent: compiler activeScript.
	compiler activate: block while: [
		token moveCommentsTo: block.
		self step.
		block
			arguments: self blockArguments;
			temporaries: self temporaries;
			addStatements: self statements.
		(token is: $]) ifFalse: [self missingToken: ']'].
		block end: token position.
		token moveCommentsTo: block.
		self step].
	^block
! !

!SSmalltalkParser methodsFor: 'blocks' stamp: 'KenD 28/Jun/2026 13:27:40'!
blockArguments
	| arguments |
	(token is: $:) ifFalse: [^#()].
	arguments := OrderedCollection new.
	[
		self step.
		token isNameToken ifFalse: [self missingArgument].
		self validateLocalName: token.
		arguments add: self step asIdentifierNode.
		token is: $:] whileTrue.
	token isBar ifTrue: [self step] ifFalse: [
		(token is: #'||')
			ifTrue: [token value: #'|']
			ifFalse: [self missingToken: '|']].
	^arguments
! !

!SSmalltalkParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiler
	^compiler
! !

!SSmalltalkParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiler: aSmalltalkCompiler
	compiler := aSmalltalkCompiler.
	scanner := compiler scanner
! !

!SSmalltalkParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
next
	token := next.
	next := nil.
	^token ifNil: [token := scanner next]
! !

!SSmalltalkParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
on: aString
	scanner on: aString
! !

!SSmalltalkParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
peek
	| comments |
	next ifNotNil: [^next].
	next := scanner next.
	next isComment ifFalse: [^next].
	comments := OrderedCollection new: 2.
	[
		comments add: next.
		next := scanner next.
		next isComment] whileTrue.
	^next comments: comments
! !

!SSmalltalkParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
token
	^token
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
error: aString
	self error: aString at: token position
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
error: aString at: position
	^compiler error: aString at: position
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
invalidArrayToken
	self error: 'invalid literal entry'
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
invalidByteValue
	self error: 'value not between 0 and 255'
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
missingArgument
	self error: 'argument missing'
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
missingExpression
	self error: 'missing expression'
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
missingLiteral
	self error: 'missing literal or named literal'
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
missingToken: aString
	self error: 'missing ' , aString
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
nonIntegerToken
	self error: 'non-integer token'
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
notify: aString
	compiler notify: aString at: token position
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
notify: aString at: position
	compiler notify: aString at: position
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
warning: aString
	compiler warning: aString at: token position
! !

!SSmalltalkParser methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
warning: aString at: position
	compiler warning: aString at: position
! !

!SSmalltalkParser methodsFor: 'productions' stamp: 'KenD 28/Jun/2026 13:27:40'!
headlessMethod
	| method |
	self step.
	method := compiler methodNode.
	compiler activeScript: method.
	self addBodyTo: method.
	^method
! !

!SSmalltalkParser methodsFor: 'productions' stamp: 'KenD 28/Jun/2026 13:27:40'!
method
	| method |
	self step.
	method := self methodSignature.
	method isNil ifTrue: [^nil].
	self addBodyTo: method.
	^method
! !

!SSmalltalkParser methodsFor: 'productions' stamp: 'KenD 28/Jun/2026 13:27:40'!
methodFragment
	| method |
	self step.
	method := self methodSignature.
	method isNil ifTrue: [^nil].
	[self addBodyTo: method] on: SCompilationError do: [].
	^method
! !

!SSmalltalkParser methodsFor: 'productions' stamp: 'KenD 28/Jun/2026 13:27:40'!
methodSelector
	self step.
	^self methodSignature ifNotNil: [:m | m selectorNode]
! !

!SSmalltalkParser methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parse: aString
	^self on: aString; method
! !

!SSmalltalkParser methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parseExpression: aString
	^self on: aString; headlessMethod
! !

!SSmalltalkParser methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parseFragment: aString
	| method |
	self on: aString; step.
	[
		method := self methodSignature.
		method notNil ifTrue: [self addBodyTo: method]]
		on: SCompilationError
		do: [].
	^method
! !

!SSmalltalkParser methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:40'!
parseTemporaries: aString
	self on: aString; step.
	^self methodSignature notNil ifTrue: [self temporaries]
! !

!SSmalltalkParser methodsFor: 'ffi support' stamp: 'KenD 28/Jun/2026 13:27:40'!
symbolicPragma
	| position symbol pragma |
	position := token position.
	symbol := self step value.
	pragma := self buildNode: compiler pragmaNode at: position.
	^pragma symbol: symbol
! !

!SSmalltalkParser class methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:40'!
parseSelector: aString
	| cmp parser |
    cmp := SCompiler new. 
	parser := self new compiler: cmp smalltalkCompiler; on: aString.
	^parser methodSelector ifNotNil: [:n | n value]
! !

!SSmalltalkScanner methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildToken: aSmalltalkToken
	^self buildToken: aSmalltalkToken at: stream position
! !

!SSmalltalkScanner methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildToken: aSmalltalkToken at: anInteger
	| string |
	string := stream copyFrom: anInteger to: stream position.
	^self buildToken: aSmalltalkToken at: anInteger with: string
! !

!SSmalltalkScanner methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildToken: aSmalltalkToken at: anInteger with: anObject
	^aSmalltalkToken
		position: anInteger;
		value: anObject;
		end: stream position
! !

!SSmalltalkScanner methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
canBeInIdentifier: aCharacter
	^compiler frontend canBeInIdentifier: aCharacter
! !

!SSmalltalkScanner methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
canStartIdentifier: aCharacter
	(compiler frontend canStartIdentifier: aCharacter) ifFalse: [^false].
	aCharacter = $_
		ifTrue: [^stream peek ifNil: [false] ifNotNil: [:ch | ch asInteger >= 33]].
	^true
! !

!SSmalltalkScanner methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiler
	^compiler
! !

!SSmalltalkScanner methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiler: aSmalltalkCompiler
	compiler := aSmalltalkCompiler.
	compiler sourceCode ifNotNil: [:s | self sourceCode: s]
! !

!SSmalltalkScanner methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
on: aString
	stream := aString readStream.
	compiler notNil ifTrue: [compiler sourceCode: aString]
! !

!SSmalltalkScanner methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
sourceCode: aString
	stream := aString readStream
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
end
	^self buildToken: compiler endToken at: stream position + 1
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
isBinary: aCharacter
	| code |
	aCharacter isNil ifTrue: [^false].
	code := aCharacter asInteger.
	code < 128 ifTrue: [
		^#($+ $- $< $> $= $* $/ $\ $| $& $~ $, $@ $% $? $!! $: $^)
			includes: aCharacter].
	^code > 255
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
next
	^self nextToken
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextArrayPrefix
	| string |
	string := stream copyFrom: stream position - 1 to: stream position.
	^self
		buildToken: compiler delimiterToken
		at: stream position - 1
		with: string
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextAssignment
	^self buildToken: compiler delimiterToken at: stream position with: #':='
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextBinarySelector
	stream back.
	^self
		buildToken: compiler stringToken
		at: stream position + 1
		with: self scanBinarySymbol
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextBinarySymbol
	^self
		buildToken: compiler literalNode
		at: stream position
		with: self scanBinarySymbol
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextColon
	| start char |
	start := stream position.
	char := stream peek.
	((char = Character space or: [char = Character tab]) and: [(stream peek: 2) second = $=]) ifTrue: [
		stream skip: 1.
		char := $=].
	char = $= ifTrue: [
		stream skip.
		^self nextAssignment position: start].
	^(self isBinary: stream peek)
		ifTrue: [self nextBinarySelector]
		ifFalse: [self nextSpecialCharacter]

! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextComment
	| start comment |
	start := stream position.
	[ stream atEnd not and:[stream peek !!== $"] ] whileTrue: [stream next].
	stream atEnd ifTrue: [self error: 'unfinished comment' at: start].
	stream position: start.
	comment := stream upTo: $".
	^self buildToken: compiler commentNode at: start with: comment

! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextIdentifierOrKeyword
	| start |
	start := stream position.
	self skipIdentifier.
	((stream peekFor: $:) and: [stream peekFor: $=]) ifTrue: [stream skip: -2].
	^self buildToken: compiler stringToken at: start
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextKeyword
	| start string |
	start := stream position + 1.
	self skipKeyword.
	string := stream copyFrom: start to: stream position.
	^self buildToken: compiler literalNode at: start - 1 with: string asSymbol
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextLiteralCharacter
	stream atEnd ifTrue: [^self error: 'character expected'].
	^self
		buildToken: compiler literalNode
		at: stream position
		with: stream next
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextLiteralString
	^self
		buildToken: compiler literalNode
		at: stream position
		with: self scanString reduced
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextNumber
	| parser assoc |
	stream skip: -1.
	parser := NumberParser new on: stream.
	assoc := parser next.
	parser error ifNotNil: [:e | ^self error: e key at: e value].
	^self
		buildToken: compiler numericLiteralNode
		at: assoc value start
		with: assoc key
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextQuotedSymbol
	| node |
	node := self nextLiteralString.
	^node beSymbol; position: node position - 1
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextSpecialCharacter
	| token |
	token := self buildToken: compiler delimiterToken.
	^token beCharacter
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextSymbolOrArrayPrefix
	| char |
	stream atEnd ifTrue: [self error: 'character expected'].
	char := stream peek.
	(self canBeInIdentifier: char) ifTrue: [^self nextKeyword].
	(self isBinary: char) ifTrue: [^self nextBinarySymbol].
	stream next.
	(char = $[ or: [char = $(]) ifTrue: [^self nextArrayPrefix].
	char = $' ifTrue: [^self nextQuotedSymbol].
	self error: 'character expected'
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
nextToken
	| first |
	first := self scanChar.
	first isNil ifTrue: [^self end].
	(self canStartIdentifier: first) ifTrue: [^self nextIdentifierOrKeyword].
	(first = $→ or: [first = $_]) ifTrue: [^self nextAssignment].
	first = $: ifTrue: [^self nextColon].
	first = $' ifTrue: [^self nextLiteralString].
	first = $$ ifTrue: [^self nextLiteralCharacter].
	first = $# ifTrue: [^self nextSymbolOrArrayPrefix].
	first = $" ifTrue: [^self nextComment].
	first isDigit ifTrue: [^self nextNumber].
	(first !!= $^ and: [first !!= $↑ and: [self isBinary: first]])
		ifTrue: [^self nextBinarySelector].
	^self nextSpecialCharacter
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
scanBinarySymbol
	| start symbol |
	start := stream position.
	self skipBinary.
	symbol := stream copyFrom: start + 1 to: stream position.
	^symbol asSymbol
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
scanChar
	^(stream skipSeparators; atEnd) ifFalse: [stream next]

! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
scanString
	| current start |
	start := current := stream position.
	^String streamContents: [:writer | 
		[| fragment |
			fragment := stream upTo: $'.
			writer nextPutAll: fragment.
			(current < stream position and: [(stream back; next) = $'])
				ifFalse: [self error: 'string end expected' at: start].
			stream peekFor: $']
			whileTrue: [
				writer nextPut: $'.
				current := stream position]]
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
skipBinary
	[self isBinary: stream peek] whileTrue: [stream next]
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
skipIdentifier
	| frontend |
	frontend := compiler frontend.
	[stream atEnd]
		whileFalse: [(frontend peekForIdentifier: stream) ifFalse: [^self]]
! !

!SSmalltalkScanner methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:40'!
skipKeyword
	| frontend continue pos |
	frontend := compiler frontend.
	[
		self skipIdentifier.
		continue := false.
		(stream peekFor: $:) ifTrue: [
			pos := stream position.
			stream atEnd
				ifFalse: [continue := frontend canStartIdentifier: stream peek]].
		continue] whileTrue.
	pos isNil ifFalse: [stream position: pos]
! !

!SSmalltalkScanner methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
error: aString
	^self error: aString at: stream position
! !

!SSmalltalkScanner methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:40'!
error: aString at: anInteger
	^compiler error: aString at: anInteger
! !

!SToken methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
comment
	^comments notNil ifTrue: [comments anyOne]
! !

!SToken methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
comments
	^comments
! !

!SToken methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
comments: aCollection
	aCollection isNil ifTrue: [^self].
	comments isNil
		ifTrue: [comments := aCollection]
		ifFalse: [comments addAll: aCollection]
! !

!SToken methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:40'!
moveCommentsTo: aParseNode
	aParseNode comments: comments.
	comments := nil
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compileWarning: aString
	compiler notify: aString at: self stretch
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiler
	^compiler
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
compiler: aSmalltalkCompiler
	compiler := aSmalltalkCompiler
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
end
	^stretch end
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
end: aNumber
	stretch end: aNumber
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
position
	^stretch start
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
position: aNumber
	stretch start: aNumber
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
prevPosition
	^stretch start - 1
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
source
	^compiler sourceCode copyFrom: stretch start to: stretch end
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
stretch
	^stretch
! !

!SToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
stretch: aStretch
	stretch := aStretch
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
endsExpression
	^self isEnd
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasSymbol
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
is: anObject
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isAssignment
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isBar
	^(self is: #'|') or: [self is: #'/']
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isBlockNode
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isComment
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isDelimiter
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isEnd
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isIdentifier
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isKeyword
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isLiteral
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isNameToken
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isNumberNode
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isPoolLiteral
	^false
! !

!SToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isStringToken
	^false
! !

!SToken methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	stretch := 1 thru: 0
! !

!SToken methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
isDelimitedIdentifier
	^false
! !

!SEndToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isEnd
	^true
! !

!SEndToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
position: aNumber
	super position: aNumber - 1
! !

!SEndToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
prevPosition
	^stretch start
! !

!SEndToken methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:40'!
value: aString
	''
! !

!SParseNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:41'!
acceptVisitor: visitor
	^visitor visitParseNode: self
! !

!SParseNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:41'!
allNodesDo: aBlock
	self nodesDo: aBlock includingDeclarations: true
! !

!SParseNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:41'!
nodeWithLiteral: anObject
	^self nodesDetect: [:n | (n isLiteral or: [n isSelector]) and: [n value = anObject]] ifAbsent: nil

! !

!SParseNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:41'!
nodesDetect: aBlock ifAbsent: absentBlock
	self nodesDo: [:node | (aBlock value: node) ifTrue: [ ^node ] ] includingDeclarations: false.
	^absentBlock value
! !

!SParseNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:41'!
nodesDo: aBlock
	self nodesDo: aBlock includingDeclarations: false
! !

!SParseNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:41'!
nodesDo: aBlock includingDeclarations: aBoolean
	aBlock value: self
! !

!SParseNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
ast
	^compiler ast
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
hasAssign
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isAssign
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isBraceNode
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isCascade
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isCascadeMessage
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isEvaluable
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isImmediate
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isMessageNode
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isMethod
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isMethodArgument
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isMethodTemporary
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isReturn
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isSelector
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isSelf
	^false
! !

!SParseNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isSuper
	^false
! !

!SParseNode methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:41'!
moveCommentsFrom: aParseNode
	aParseNode moveCommentsTo: self
! !

!SParseNode methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:41'!
variableNamed: aString
	self
		allNodesDo: [:node | (node isIdentifier and: [node name = aString])
			ifTrue: [^node]].
	^nil
! !

!SAssignmentNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: visitor
	^visitor visitAssignment: self
! !

!SAssignmentNode methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:40'!
assign: anIdentifierNode operator: aDelimiterToken
	assignees add: anIdentifierNode.
	operators add: aDelimiterToken
! !

!SAssignmentNode methodsFor: 'adding / removing' stamp: 'KenD 28/Jun/2026 13:27:40'!
assign: anIdentifierNode with: aParseNode operator: aDelimiterToken
	assignees add: anIdentifierNode.
	operators add: aDelimiterToken.
	expression := aParseNode
! !

!SAssignmentNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
assignees
	^assignees
! !

!SAssignmentNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
expression
	^expression
! !

!SAssignmentNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
operators
	^operators
! !

!SAssignmentNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasAssign
	^true
! !

!SAssignmentNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isAssign
	^true
! !

!SAssignmentNode methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	assignees := OrderedCollection new: 1.
	operators := OrderedCollection new: 1
! !

!SAssignmentNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:40'!
nodesDo: aBlock includingDeclarations: aBoolean
	super nodesDo: aBlock includingDeclarations: aBoolean.
	assignees do: [:v | v nodesDo: aBlock includingDeclarations: aBoolean].
	expression nodesDo: aBlock includingDeclarations: aBoolean
! !

!SBraceNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: visitor
	^visitor visitBraceNode: self
! !

!SBraceNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
asMessageNode
	message notNil ifTrue: [^message].
	^message := self expanded
! !

!SBraceNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isBraceNode
	^true
! !

!SBraceNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
elements
	^elements
! !

!SBraceNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
elements: aCollection
	elements := aCollection asArray
! !

!SBraceNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
expanded
	| receiver n new argument array messages i you yourself cascade |
	receiver := compiler identifierNode name: 'Array'.
	n := elements size.
	new := compiler selectorNode symbol: #new:.
	argument := compiler numericLiteralNode value: n.
	array := compiler messageNode.
	array receiver: receiver.
	array selector: new.
	array arguments: (Array with: argument).
	i := 0.
	messages := elements collect: [:elem | | msg sel idx args |
		i := i + 1.
		msg := compiler cascadeMessageNode position: elem position; end: elem end.
		sel := compiler selectorNode symbol: #at:put:.
		idx := compiler numericLiteralNode value: i.
		args := Array with: idx with: elem.
		msg selector: sel; arguments: args].
	you := compiler selectorNode symbol: #yourself.
	yourself := compiler cascadeMessageNode.
	yourself selector: you.
	yourself arguments: #().
	messages := messages copyWith: yourself.
	cascade := compiler cascadeNode receiver: array.
	messages do: [:msg | msg cascade: cascade].
	^cascade messages: messages
! !

!SBraceNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:40'!
nodesDo: aBlock includingDeclarations: aBoolean
	super nodesDo: aBlock includingDeclarations: aBoolean.
	elements do: [:n | n nodesDo: aBlock includingDeclarations: aBoolean]
! !

!SCascadeNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: visitor
	^visitor visitCascade: self
! !

!SCascadeNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasAssign
	receiver hasAssign ifTrue: [^true].
	messages detect: [:msg | msg hasAssign] ifNone: [^false].
	^true
! !

!SCascadeNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:40'!
isCascade
	^true
! !

!SCascadeNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:40'!
nodesDo: aBlock includingDeclarations: aBoolean
	super nodesDo: aBlock includingDeclarations: aBoolean.
	receiver nodesDo: aBlock includingDeclarations: aBoolean.
	messages do: [:msg | msg nodesDo: aBlock includingDeclarations: aBoolean]
! !

!SCascadeNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
messages
	^messages
! !

!SCascadeNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
messages: aCollection
	messages := aCollection
! !

!SCascadeNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
receiver
	^receiver
! !

!SCascadeNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
receiver: rcvr
	receiver := rcvr
! !

!SCommentNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isComment
	^true
! !

!SCommentNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
value
	^value
! !

!SCommentNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
value: aString
	value := aString
! !

!SIdentifierNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: visitor
	^visitor visitIdentifier: self
! !

!SIdentifierNode methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
beAssigned
	| immutable |
	binding canBeAssigned ifTrue: [^self].
	immutable := binding isClassBinding
		ifTrue: ['class']
		ifFalse: [compiler activeScope describe: binding name].
	self compileError: 'cannot assign to ' , immutable
! !

!SIdentifierNode methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
resolveAssigning: aBoolean
	binding := compiler activeScope resolve: name.
	^binding

! !

!SIdentifierNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
binding
	^binding
! !

!SIdentifierNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
binding: aBinding
	binding := aBinding
! !

!SIdentifierNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	binding := DynamicBinding default
! !

!SIdentifierNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
name
	^name
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
checkLowercase
	| char |
	char := name first.
	(char isLetter and: [char isUppercase]) ifFalse: [^self].
	self compileWarning: name storeString , ' should start with lowercase'
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isEvaluable
	^self isIdentifierLiteral
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isIdentifier
	^true
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isIdentifierLiteral
	binding isDynamic ifFalse: [^binding isLiteral].
	^self ast ifNil: [false] ifNotNil: [:ast | | b |
		b := ast scope resolve: name.
		b isLiteral]
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isImmediate
	^true
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isLocal
	^binding isLocal
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isMethodArgument
	| ast |
	binding isArgument ifFalse: [^false].
	ast := self ast ifNil: [^false].
	^ast arguments includes: self declaration
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isMethodTemporary
	^self ast temporaries includes: self declaration
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isSelf
	^binding isSelf
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isSuper
	^binding isSuper
! !

!SIdentifierNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
sourceIntervals
	| stretchs declaration ast string code index |
	stretchs := OrderedCollection new.
	declaration := binding declaration.
	ast := self ast.
	ast allNodesDo: [:node | 
		(node class == self class and: [node binding declaration == declaration])
			ifTrue: [stretchs add: node stretch]].
	string := self source.
	code := compiler sourceCode.
	index := ast stretch end.
	[
		index := code indexOfString: string startingAt: index + 1.
		index > 0]
		whileTrue: [stretchs add: (index to: index + string size - 1)].
	^stretchs
! !

!SIdentifierNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
declaration
	^binding declaration
! !

!SIdentifierNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
defineArgumentIn: aScriptScope
	binding := aScriptScope defineArgument: name.
	binding declaration: self
! !

!SIdentifierNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
defineTemporaryIn: scope
	binding := scope defineTemporary: name.
	binding declaration: self
! !

!SIdentifierNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
printOn: aStream
	aStream nextPut: $<;
	nextPutAll: name;
	nextPutAll: '> ('.
	super printOn: aStream.
	aStream nextPut: $)
! !

!SIdentifierNode methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:40'!
name: aString
	name := aString reduced
! !

!SLiteralNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
acceptVisitor: visitor
	^visitor visitLiteral: self
! !

!SLiteralNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
hasSymbol
	^value isSymbol
! !

!SLiteralNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isEvaluable
	^true
! !

!SLiteralNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isImmediate
	^true
! !

!SLiteralNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isLiteral
	^true
! !

!SLiteralNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:41'!
beSymbol
	value := value asSymbol
! !

!SLiteralNode methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:41'!
value
	^value
! !

!SLiteralNode methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:41'!
value: anObject
	value := anObject
! !

!SNumberNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: visitor
	^visitor visitNumberNode: self
! !

!SNumberNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isNumberNode
	^true
! !

!SNumberNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
negate
	value := value negated
! !

!SMessageNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: visitor
	^visitor visitMessage: self
! !

!SMessageNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
arguments
	^arguments
! !

!SMessageNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
arguments: aCollection
	arguments := aCollection
! !

!SMessageNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
receiver
	^receiver
! !

!SMessageNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
receiver: node
	receiver := node
! !

!SMessageNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
selector
	^selector
! !

!SMessageNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
selector: node
	selector := node
! !

!SMessageNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
symbol
	^selector symbol
! !

!SMessageNode methodsFor: 'emitting - inlined' stamp: 'KenD 28/Jun/2026 13:27:40'!
beInlined
	inlined := true
! !

!SMessageNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasAssign
	receiver hasAssign ifTrue: [^true].
	^arguments anySatisfy: [:arg | arg hasAssign]
! !

!SMessageNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasVolatileArguments
	^arguments anySatisfy: [:arg | 
		arg isIdentifier
			ifTrue: [arg binding canBeAssigned]
			ifFalse: [arg isBlockNode not andNot: [arg isLiteral]]]
! !

!SMessageNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasVolatileReceiver
	^ compiler hasBlocks
		  or: [ receiver isMethodTemporary not ]
		  or: [ arguments anySatisfy: [ :arg | arg hasAssign ] ]
! !

!SMessageNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	inlined := false
! !

!SMessageNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isCascadeMessage
	^false
! !

!SMessageNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isInlined
	^inlined
! !

!SMessageNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isMessageNode
	^true
! !

!SMessageNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
needsStrictEvaluationOrder
	arguments size = 0 ifTrue: [^false].
	receiver isBlockNode ifTrue: [^false].
	receiver isLiteral ifTrue: [^false].
	receiver isSelf ifTrue: [^false].
	receiver isSuper ifTrue: [^false].
	receiver isMethodArgument ifTrue: [^false].
	self hasVolatileReceiver ifFalse: [^false].
	(receiver isImmediate
		and: [arguments conform: [:arg | arg isImmediate or: [arg isBlockNode]]])
		ifTrue: [^false].
	receiver hasAssign ifTrue: [^true].
	receiver isMessageNode ifTrue: [ ^true ]. 
	^self hasVolatileArguments
! !

!SMessageNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:40'!
nodesDo: aBlock includingDeclarations: aBoolean
	super nodesDo: aBlock includingDeclarations: aBoolean.
	receiver nodesDo: aBlock includingDeclarations: aBoolean.
	arguments do: [:arg | arg nodesDo: aBlock includingDeclarations: aBoolean].
	selector nodesDo: aBlock includingDeclarations: aBoolean
! !

!SCascadeMessageNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: visitor
	^visitor visitCascadeMessage: self
! !

!SCascadeMessageNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
cascade: aCascadeNode
	cascade := aCascadeNode.
	receiver := cascade receiver
! !

!SCascadeMessageNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
from: aMessageNode
	arguments := aMessageNode arguments.
	receiver := aMessageNode receiver.
	selector := aMessageNode selector.
	inlined := aMessageNode isInlined.
	stretch := aMessageNode stretch.
	comments := aMessageNode comments
! !

!SCascadeMessageNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isCascadeMessage
	^true
! !

!SCascadeMessageNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:40'!
nodesDo: aBlock includingDeclarations: aBoolean
	aBlock value: self.
	arguments do: [:arg | arg nodesDo: aBlock includingDeclarations: aBoolean]
! !

!SReturnNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: visitor
	^visitor visitReturn: self
! !

!SReturnNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
expression
	^expression
! !

!SReturnNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
expression: node
	expression := node
! !

!SReturnNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
return: aSmalltalkToken
	return := aSmalltalkToken
! !

!SReturnNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasAssign
	^expression hasAssign
! !

!SReturnNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isReturn
	^true
! !

!SReturnNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:40'!
nodesDo: aBlock includingDeclarations: aBoolean
	super nodesDo: aBlock includingDeclarations: aBoolean.
	expression nodesDo: aBlock includingDeclarations: aBoolean
! !

!SScriptNode methodsFor: 'add/remove' stamp: 'KenD 28/Jun/2026 13:27:40'!
addChild: aBlockNode
	children add: aBlockNode
! !

!SScriptNode methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
addStatements: anOrderedCollection
	statements addAll: anOrderedCollection
! !

!SScriptNode methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
identifiers
	| result |
	result := OrderedCollection new.
	self nodesDo: [:node | node isIdentifier ifTrue: [result add: node]].
	^result withoutDuplicates
! !

!SScriptNode methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	statements := OrderedCollection new.
	arguments := #().
	temporaries := #().
	children := OrderedCollection new
! !

!SScriptNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
arguments
	^arguments
! !

!SScriptNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
arguments: aCollection
	arguments := aCollection
! !

!SScriptNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
children
	^children
! !

!SScriptNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentSize
	^scope environmentSize
! !

!SScriptNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
realScript
	self subclassResponsibility
! !

!SScriptNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
statements
	^statements
! !

!SScriptNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
temporaries
	^temporaries
! !

!SScriptNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
temporaries: aCollection
	temporaries := aCollection
! !

!SScriptNode methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
bindLocals
	arguments do: [:arg | arg defineArgumentIn: scope].
	temporaries do: [:temp | temp checkLowercase; defineTemporaryIn: scope].
	children do: [:block | block bindLocals]
! !

!SScriptNode methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
positionLocals
	scope positionLocals.
	children do: [:b | b positionLocals]
! !

!SScriptNode methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
reference: aBinding
	aBinding beReferencedFrom: self
! !

!SScriptNode methodsFor: 'binding' stamp: 'KenD 28/Jun/2026 13:27:40'!
scope
	^scope
! !

!SScriptNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasAssign
	statements do: [:s | s hasAssign ifTrue: [^true]].
	^false
! !

!SScriptNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:40'!
nodesDo: aBlock includingDeclarations: aBoolean
	super nodesDo: aBlock includingDeclarations: aBoolean.
	aBoolean ifTrue: [
		arguments do: [:a | a nodesDo: aBlock includingDeclarations: aBoolean].
		temporaries do: [:a | a nodesDo: aBlock includingDeclarations: aBoolean]].
	statements do: [:s | s nodesDo: aBlock includingDeclarations: aBoolean]
! !

!SScriptNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
useSelf
	scope captureSelf
! !

!SBlockNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: visitor
	^visitor visitBlock: self
! !

!SBlockNode methodsFor: 'emitting - inlined' stamp: 'KenD 28/Jun/2026 13:27:40'!
beInlined
	inlined := true.
	arguments do: [:arg | arg binding beInlined]
! !

!SBlockNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
buildBlock
	| block |
	self isInlined ifTrue: [ ^ nil ].
	block := CompiledBlock new.
	^ block
		blockNumber: index;
		argumentCount: arguments size;
		tempCount: scope stackSize;
		environmentCount: scope environmentSize;
		capturesSelf: scope capturesSelf;
		capturesHome: scope capturesHome
! !

!SBlockNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
captureHome
	scope captureEnvironment: self ast
! !

!SBlockNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
environmentIndexOf: aParseNode
	^scope environmentIndexOf: aParseNode
! !

!SBlockNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isBlockNode
	^true
! !

!SBlockNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isEvaluable
	^self isNullary
! !

!SBlockNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isInlined
	^inlined
! !

!SBlockNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isNullary
	^arguments isEmpty
! !

!SBlockNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
usesHome
	^inlined
		ifTrue: [children anySatisfy: [:block | block usesHome]]
		ifFalse: [scope capturesHome]
! !

!SBlockNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
index
	^index
! !

!SBlockNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
index: aNumber
	index := aNumber
! !

!SBlockNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
parent
	^parent
! !

!SBlockNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
parent: aScriptNode
	parent := aScriptNode addChild: self
! !

!SBlockNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
realParent
	^parent realScript
! !

!SBlockNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
realScript
	^inlined ifTrue: [parent realScript] ifFalse: [self]
! !

!SBlockNode methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	inlined := false.
	scope := BlockScope on: self
! !

!SMethodNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:41'!
acceptVisitor: visitor
	^visitor visitMethod: self
! !

!SMethodNode methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:41'!
buildMethod
	| cm encoder treecodes |
	cm := self methodClass withAll: self literals.
	cm
		blockCount: compiler blockCount;
		tempCount: scope stackSize;
		argumentCount: arguments size;
		environmentCount: scope environmentSize;
		capturesSelf: scope capturesSelf;
		hasEnvironment: self needsEnvironment;
		hasFrame: self needsFrame;
		selector: self selector;
		sourceObject: compiler sourceCode;
		classBinding: compiler frontend classBinding.
	cm pragma: pragma.
	cm blocks do: [ :block | block method: cm ].
	encoder := TreecodeEncoder new method: cm.
	treecodes := self acceptVisitor: encoder.
	^ cm treecodes: treecodes
! !

!SMethodNode methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:41'!
captureHome
	
! !

!SMethodNode methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:41'!
literals
	| literals v l |
	literals := OrderedCollection new.
	pragma isUsed
		ifTrue: [ literals add: pragma name ].
	self
		nodesDo: [ :n | 
			n isLiteral
				ifTrue: [ v := n value.
					v isSmallInteger
						ifFalse: [ literals add: v ] ].
			n isMessageNode
				ifTrue: [ literals add: n symbol ].
			n isBraceNode
				ifTrue: [ n isLiteral
						ifTrue: [ self halt ]
						ifFalse: [ literals
								add: #Array;
								add: #new:;
								add: #at:put:;
								add: #yourself ] ].
			(n isIdentifier
				and: [ l := n binding literal.
					l notNil ])
				ifTrue: [ literals add: l ].
			(n isBlockNode andNot: [ n isInlined ])
				ifTrue: [ literals add: n buildBlock ] ].
	^ literals withoutDuplicates
! !

!SMethodNode methodsFor: 'parsing' stamp: 'KenD 28/Jun/2026 13:27:41'!
methodClass
	| type |
	type := pragma type.
	type = #callback
		ifTrue: [ ^ CallbackMethod ].
	type = #callout
		ifTrue: [ ^ CalloutMethod ].
	^ CompiledMethod
! !

!SMethodNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
compiler: aSmalltalkCompiler
	super compiler: aSmalltalkCompiler.
	scope := MethodScope new script: self.
	pragma := aSmalltalkCompiler pragmaNode
! !

!SMethodNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
pragma
	^pragma
! !

!SMethodNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
pragma: anObject
	pragma := anObject
! !

!SMethodNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
realScript
	^self
! !

!SMethodNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
selector
	^selector value
! !

!SMethodNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
selector: aSelectorNode
	selector := aSelectorNode
! !

!SMethodNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
selectorNode
	^selector
! !

!SMethodNode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:41'!
environmentIndexOf: aParseNode
	^nil
! !

!SMethodNode methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:41'!
header
	"
	(Object >> #printOn:) ast header
	"
	| interval |
	interval := selector stretch.
	arguments notEmpty
		ifTrue: [interval := interval start thru: arguments last stretch end].
	^compiler sourceCode copyFrom: interval start to: interval end
! !

!SMethodNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isHeadless
	^selector isNil
! !

!SMethodNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isMethod
	^true
! !

!SMethodNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
needsEnvironment
	^scope environmentSize > 0
		or: [children anySatisfy: [:block | block usesHome]]
! !

!SMethodNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
needsFrame
	scope stackSize > 0 ifTrue: [ ^ true ].
	arguments size > 16 ifTrue: [ ^ true ].
	compiler hasSends ifTrue: [ ^ true ].
	compiler hasBlocks ifTrue: [ ^ true ].
	^ false
! !

!SMethodNode methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:41'!
nodesDo: aBlock includingDeclarations: aBoolean
	super nodesDo: aBlock includingDeclarations: aBoolean.
	(aBoolean and: [selector notNil]) ifTrue: [aBlock value: selector]
! !

!SSelectorNode methodsFor: 'visiting' stamp: 'KenD 28/Jun/2026 13:27:41'!
acceptVisitor: visitor
	^visitor visitSelector: self
! !

!SSelectorNode methodsFor: 'accessing' stamp: 'KenD 30/Jun/2026 08:25:59'!
addKeyword: aSelectorNode
	keywords isNil ifTrue: [keywords := OrderedCollection new].
	keywords add: aSelectorNode
! !

!SSelectorNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
end
	stretch end ifNotNil: [:e | ^e].
	^keywords notNil ifTrue: [keywords last end]
! !

!SSelectorNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
keywords
	^keywords isNil ifTrue: [{self}] ifFalse: [keywords]
! !

!SSelectorNode methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:41'!
positions
	^self keywords collect: [:node | node position]
! !

!SSelectorNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
hasSymbol
	^symbol isSymbol
! !

!SSelectorNode methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:41'!
isSelector
	^true
! !

!SSelectorNode methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:41'!
isBinary
	^symbol isBinary
! !

!SSelectorNode methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:41'!
symbol
	^symbol
! !

!SSelectorNode methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:41'!
symbol: aString
	symbol := aString asSymbol
! !

!SSelectorNode methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:41'!
value
	^symbol
! !

!SPragmaNode methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
acceptVisitor: aVisitor
	self isFFI ifTrue: [^aVisitor visitFFIPragma: self].
	self isPrimitive ifTrue: [^aVisitor visitPrimitivePragma: self].
	self isSymbolic ifTrue: [^aVisitor visitSymbolicPragma: self]
! !

!SPragmaNode methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
ffi: cc name: aString with: anFFIDescriptor
	type := cc.
	name := aString.
	info := anFFIDescriptor
! !

!SPragmaNode methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
ffi: aString with: anFFIDescriptor
	type := #ffi.
	name := aString.
	info := anFFIDescriptor
! !

!SPragmaNode methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
info
	^info
! !

!SPragmaNode methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
isUsed
	^type notNil
! !

!SPragmaNode methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
name
	^name
! !

!SPragmaNode methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
primitive: anInteger name: aString
	type := #primitive.
	name := aString.
	info := anInteger
! !

!SPragmaNode methodsFor: 'as yet unclassified' stamp: 'KenD 28/Jun/2026 13:27:40'!
type
	^type
! !

!SSymbolicToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
is: anObject
	^value == anObject
! !

!SSymbolicToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
value
	^value
! !

!SSymbolicToken methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
value: anObject
	value := anObject
! !

!SDelimiterToken methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:40'!
asSelectorNode
	^compiler selectorNode symbol: value asString; stretch: stretch
! !

!SDelimiterToken methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:40'!
beCharacter
	value := value isCharacter ifTrue: [value] ifFalse: [value first]
! !

!SDelimiterToken methodsFor: 'evaluating' stamp: 'KenD 28/Jun/2026 13:27:40'!
value: aString
	super value: aString asSymbol
! !

!SDelimiterToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
endsExpression
	^value = $. or: [value = $]] or: [value = $)] or: [value = $}]
! !

!SDelimiterToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isAssignment
	^self is: #':='
! !

!SDelimiterToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isDelimiter
	^true
! !

!SStringToken methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:40'!
asIdentifierNode
	^compiler identifierNode
		name: value;
		stretch: stretch;
		comments: comments
! !

!SStringToken methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:40'!
asSelectorNode
	^compiler selectorNode symbol: value; stretch: stretch
! !

!SStringToken methodsFor: 'converting' stamp: 'KenD 28/Jun/2026 13:27:40'!
isStringToken
	^true
! !

!SStringToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
hasSymbol
	^value isSymbol
! !

!SStringToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isBinary
	^value isSymbol
! !

!SStringToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isDelimitedIdentifier
	^value first = ${
! !

!SStringToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isKeyword
	^value last = $:
! !

!SStringToken methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:40'!
isNameToken
	^(self isKeyword or: [self isBinary]) not
! !

!Config methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
at: aString
			^merged at: aString ifAbsent: [nil]
! !

!Config methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
at: aString ifAbsent: aBlock
			^merged at: aString ifAbsent: aBlock
! !

!Config methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
dependencies
			^self at: 'dependencies' ifAbsent: [OrderedDictionary new]
! !

!Config methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
modulePaths
	| paths section |
	paths := self at: 'paths'.
	paths ifNil: [^#()].
	section := paths at: 'modules' ifAbsent: [nil].
	section ifNil: [^#()].
	^section
! !

!Config methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
name
	| section |
	section := self at: 'project'.
	section ifNil: [^nil].
	^section at: 'name' ifAbsent: [nil]
! !

!Config methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
project
			^project
! !

!Config methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
user
			^user
! !

!Config methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
version
	| section |
	section := self at: 'project'.
	section ifNil: [^nil].
	^section at: 'version' ifAbsent: [nil]
! !

!Config methodsFor: 'loading' stamp: 'KenD 28/Jun/2026 13:27:40'!
load
			self loadUser.
	self loadProject.
	self merge
! !

!Config methodsFor: 'loading' stamp: 'KenD 28/Jun/2026 13:27:40'!
loadProject
	| cwd path contents |
	cwd := Kernel currentDirectory.
	path := cwd, '/epm.toml'.
	(Kernel pathExists: path)
		ifTrue: [
			contents := Kernel readFile: path.
			project := TOMLParser parse: contents]
		ifFalse: [project := OrderedDictionary new]
! !

!Config methodsFor: 'loading' stamp: 'KenD 28/Jun/2026 13:27:40'!
loadUser
	| home path contents |
	home := Kernel getEnv: 'HOME'.
	home ifNil: [user := OrderedDictionary new. ^self].
	path := home, '/.egg/config.toml'.
	(Kernel pathExists: path)
		ifTrue: [
			contents := Kernel readFile: path.
			user := TOMLParser parse: contents]
		ifFalse: [user := OrderedDictionary new]
! !

!Config methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
merge
			merged := OrderedDictionary new.
	self mergeFrom: user into: merged.
	self mergeFrom: project into: merged
! !

!Config methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
mergeFrom: aSource into: aTarget
			aSource keysAndValuesDo: [:k :v |
		| existing |
		existing := aTarget at: k ifAbsent: [nil].
		(v isKindOf: OrderedDictionary)
			ifTrue: [
				(existing isKindOf: OrderedDictionary)
					ifTrue: [self mergeFrom: v into: existing]
					ifFalse: [
						| copy |
						copy := OrderedDictionary new.
						self mergeFrom: v into: copy.
						aTarget at: k put: copy]]
			ifFalse: [aTarget at: k put: v]]
! !

!Config class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:40'!
load
			^self new load
! !

!ProjectGenerator methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
dir: aString
	dir := aString
! !

!ProjectGenerator methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
moduleName
	| first |
	first := name first asUppercase.
	^(String with: first), (name copyFrom: 2)
! !

!ProjectGenerator methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
name: aString
	name := aString
! !

!ProjectGenerator methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
ensureDir
	dir ifNil: [
		dir := Kernel currentDirectory, '/', name].
	Kernel createDirectory: dir
! !

!ProjectGenerator methodsFor: 'generating' stamp: 'KenD 28/Jun/2026 13:27:40'!
generate
	| modules module |
	self ensureDir.
	modules := dir, '/modules'.
	module := modules, '/', self moduleName.
	Kernel createDirectory: modules.
	Kernel createDirectory: module.
	self generateToml.
	self generateModule: module
! !

!ProjectGenerator methodsFor: 'generating' stamp: 'KenD 28/Jun/2026 13:27:40'!
generateModule: aString
	| filename contents module |
	module := self moduleName.
	filename := aString, '/', module, 'Module.st'.
	contents := '"
    See (MIT) license in root directory.
"

Class {
	#name : #', module, 'Module,
	#superclass : #Module,
	#instVars : [],
	#category : #', module, '
}

{ #category : #main }
', module, 'Module >> main: args [
	Kernel log: ''Hello from ', name, '''
]
'.
	Kernel writeFile: filename contents: contents
! !

!ProjectGenerator methodsFor: 'generating' stamp: 'KenD 28/Jun/2026 13:27:40'!
generateToml
	| filename contents |
	self ensureDir.
	filename := dir, '/epm.toml'.
	contents := '[project]
name = "', name, '"
version = "0.1.0"
description = ""

[dependencies]
'.
	Kernel writeFile: filename contents: contents
! !

!LMRObject methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
size
	^self primitiveSize
! !

!Module methodsFor: 'snapshotting' stamp: 'KenD 28/Jun/2026 13:27:38'!
prepareForSnapshot: aBuilder
	aBuilder
		importNilToken;
		addBoundary: Symbol symbolTable as: SymbolicReference symbolTable;
		map: overriden to: Dictionary new
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
addClass: aClass
	classes add: aClass.
	self exportClass: aClass
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
addExtension: aCompiledMethod
	| collection | 
	collection := extensions at: aCompiledMethod classBinding symbol ifAbsentPut: [OrderedCollection new].
	collection add: aCompiledMethod.
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
addOverride: aCompiledMethod
	overriden at: aCompiledMethod signature put: aCompiledMethod
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
bind
	classes
		reject: [:c | classes includes: c superclass]
		thenDo: [:c | c superclass addSubclass: c].
	extensions keysAndValuesDo: [:s :methods | | meta key target |
		meta := s endsWith: ' class'.
		key := meta ifTrue: [(s trimTail: ' class') asSymbol] ifFalse: [s].
		target := namespace at: key ifAbsent: [self _halt].
		meta ifTrue: [target := target class].
		methods do: [:m | | current extension |
			current := target compiledMethodAt: m selector.
			extension := m asExtensionFor: self.
			target addSelector: m selector withMethod: extension.
			current notNil ifTrue: [current module addOverride: current]]
	]
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
bind: anObject as: aSymbol
	namespace at: aSymbol put: anObject.
	self justDefined: aSymbol
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
bindKernelExports
	| bindings |
	bindings := Dictionary new.
	{
		Object. Class. Metaclass. CompiledMethod.
		Array. OrderedCollection. Set. Dictionary.
		SmallInteger. String. Character.
	} do: [:class |
			bindings at: class symbol put: class].
	bindings at: #Kernel put: Kernel.
	self bindAll: bindings
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
export: anObject as: aSymbol
	namespace at: aSymbol put: anObject.
	exports add: aSymbol
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
exportClass: aClass
	self export: aClass as: aClass name asSymbol
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
exports
	| result |
	result := Dictionary new.
	result at: '__module__' put: self.
	exports do: [:name | | value |
		value := namespace at: name.
		result at: name put: value].
	^result
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
import: moduleName
	| module |
	namespace at: moduleName ifPresent: [:loaded | ^loaded].
	module := Kernel load: moduleName.
	self bind: module as: moduleName.
	^module
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
import: name from: moduleName
	^self import: name from: moduleName as: name
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
import: name from: moduleName as: newName
	| module import |
	module := Kernel load: moduleName.
	import := module namespace at: name.
	self bind: import as: newName
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
importDescriptor: descriptor
	| moduleName token exportNames |
	moduleName := descriptor key.
	token := descriptor value.
	exportNames := token isArray ifTrue: [token] ifFalse: [{token}].
	exportNames do: [:name | self import: name from: moduleName]
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
importRequiredModules
	requires do: [:name | self import: name].
	self imports do: [:descriptor | self importDescriptor: descriptor]
! !

!Module methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
imports
	"
	Returns an array of import descriptors. A descriptor can be:
	 - A composite symbol (i.e #Core.Modules.Writer) (NOT IMPLEMENTED YET).
	 - An association of module name and exported name (i.e #Core.Modules.JSON -> #Writer)
	 - An association of module name, exported name and rename (i.e. #Core.Modules.JSON -> (#Writer -> #JSONWriter)) (NOT IMPLEMENTED YET)
	"
	^#()
! !

!Module methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicInitialize
	name := self defaultName.
	namespace ifNil: [namespace := Namespace new].
	exports := Set new.
	cachedLookups := Dictionary new.
	classes := OrderedCollection new.
	extensions := Dictionary new.
	overriden := Dictionary new.
	requires := #()
! !

!Module methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:38'!
defaultName
	| classname |
	classname := self class name.
	(classname endsWith: 'Module') ifTrue: [^classname trimTail: 'Module'].
	(classname beginsWith: 'Module') ifTrue: [^classname trimPrefix: 'Module'].
	^classname
! !

!Module methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
bindAll: aDictionary
	aDictionary keysAndValuesDo: [:symbol :value |
		namespace at: symbol put: value.
		self justDefined: symbol].
! !

!Module methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
justDefined: aSymbol
	| lookups |
	lookups := cachedLookups at: aSymbol ifAbsent: [^nil].
	lookups do: [:lookup | lookup flush]
! !

!Module methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
classes
	^classes
! !

!Module methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
extensions
	^extensions
! !

!Module methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
justLoaded
	self bind
! !

!Module methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
name
	^name
! !

!Module methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
name: aString
	name := aString
! !

!Module methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
namespace
	^namespace
! !

!Module methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
originalMethodFor: aCompiledMethod
	aCompiledMethod module == self ifTrue: [^aCompiledMethod].
	^overriden at: aCompiledMethod signature ifAbsent: nil
! !

!Module methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
overriden
	^overriden
! !

!Module methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
requires
	^requires
! !

!Module methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
classNamed: aString
	^classes detect: [:cls | cls name = aString ] ifNone: nil
! !

!Module methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
extensionClasses
	^extensions keys
		collect: [:s | | key |
			key := (s endsWith: ' class') ifTrue: [(s trimTail: ' class') asSymbol] ifFalse: [s].
			namespace at: key ifAbsent: [Class new name: (s , '__Not_Found') asSymbol]]
! !

!Module methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isModule
	^true
! !

!Module class methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
new
	^self basicNew basicInitialize
! !

!ArgParserModule methodsFor: 'spec' stamp: 'KenD 28/Jun/2026 13:27:37'!
imports
	^{
		#Kernel -> #(Error OrderedDictionary).
	}
! !

!CodeSpecsModule methodsFor: 'spec' stamp: 'KenD 28/Jun/2026 13:27:39'!
imports
	^{
		#Kernel -> #(#OrderedDictionary).
	}
! !

!TestsModule methodsFor: 'spec' stamp: 'KenD 28/Jun/2026 13:27:41'!
imports
	^{
		#Kernel -> #(Array Error Exception OrderedCollection UndefinedObject WideString WideSymbol).
		#Compiler -> #(SCompiler SCompilationError SMethodNode SSelectorNode SMessageNode SStringToken InlinedArgEnvironment MethodScope).
		#SUnit -> #(TestCase TestResult TestSuite)
	}
! !

!TestsModule methodsFor: 'main' stamp: 'KenD 28/Jun/2026 13:27:41'!
main: anArray
	| suite result |
	Kernel log: 'Running Compiler tests...
'.
	suite := TestSuite forModule: self.
	Kernel log: 'suite built with ', suite tests size printString, ' tests
'.
	result := suite run.
	Kernel log: 'Done.
'.
	Kernel log: result printString.
	Kernel log: '
'
! !

!CompilerModule methodsFor: 'initializing' stamp: 'KenD 28/Jun/2026 13:27:40'!
initialize
	super initialize.
	TreecodeEncoder initializeBindingIds; initializeTreecodeIds.
	self initializeClosureElementIds
! !

!CompilerModule methodsFor: 'spec' stamp: 'KenD 28/Jun/2026 13:27:40'!
imports
	^{
		#Kernel -> #(Error ByteArray CompiledBlock Module NumberParser Species OrderedDictionary)
	}
! !

!CompilerModule methodsFor: 'class initialization' stamp: 'KenD 28/Jun/2026 13:27:40'!
initializeClosureElementIds
	self namespace
		at: #CaptureSelf put: 0;
		at: #CaptureLocalArgument put: 1;
		at: #CaptureEnvironment put: 2;
		at: #CaptureEnvironmentValue put: 3;
		at: #CaptureInlinedArgument put: 4
! !

!EPMModule methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
addCommand: aString description: aDescription action: aSymbol
	| command |
	command := Command new
		name: aString;
		description: aDescription.
	command action: [:result | self perform: aSymbol with: result].
	parser addCommand: command.
	^command
! !

!EPMModule methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
loadConfig
	| host |
	config := Config load.
	host := Kernel host.
	config modulePaths do: [:path |
		host prependSearchPath: path type: #tonel.
		host prependSearchPath: path type: #ems]
! !

!EPMModule methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:40'!
setupParser
	| create |
	parser := ArgParser new name: 'epm'; description: 'Egg Package Manager'.
	create := self addCommand: 'new' description: 'Create a new project' action: #commandNew:.
	create addPositional: 'name'.
	self addCommand: 'init' description: 'Initialize epm.toml in current directory' action: #commandInit:.
	self addCommand: 'start' description: 'Run current project' action: #commandStart:.
	self addCommand: 'dev' description: 'Start development environment for current project' action: #commandDev:.
	self addCommand: 'install' description: 'Install dependencies from epm.toml' action: #commandInstall:.
	self addCommand: 'list' description: 'List project dependencies' action: #commandList:.
	((self addCommand: 'test' description: 'Run tests for a module' action: #commandTest:)
		addPositional: 'module';
		addOption: (Option new
			long: '--debug';
			description: 'Run tests without swallowing exceptions';
			beFlag;
			yourself))
! !

!EPMModule methodsFor: 'commands' stamp: 'KenD 28/Jun/2026 13:27:40'!
commandDev: aResult
	| cwd name dev module |
	cwd := Kernel currentDirectory.
	name := cwd copyAfterLast: $/.
	dev := Kernel load: #Development.
	module := Kernel load: name asSymbol.
	dev main: args
! !

!EPMModule methodsFor: 'commands' stamp: 'KenD 28/Jun/2026 13:27:40'!
commandInit: aResult
	| cwd name generator |
	cwd := Kernel currentDirectory.
	name := cwd copyAfterLast: $/.
	name isEmpty ifTrue: [name := 'myproject'].
	generator := ProjectGenerator new.
	generator name: name.
	generator dir: cwd.
	generator generateToml.
	Kernel log: 'Initialized epm.toml for: ', name
! !

!EPMModule methodsFor: 'commands' stamp: 'KenD 28/Jun/2026 13:27:40'!
commandInstall: aResult
	| dependencies |
	config ifNil: [self loadConfig].
	dependencies := config dependencies.
	dependencies isEmpty ifTrue: [
		Kernel log: 'No dependencies to install'.
		^self].
	Kernel log: 'Installing dependencies...'.
	dependencies keysAndValuesDo: [:name :constraint |
		Kernel log: '  ', name, ' (', constraint asString, ')'].
	Kernel log: 'Done'
! !

!EPMModule methodsFor: 'commands' stamp: 'KenD 28/Jun/2026 13:27:40'!
commandList: aResult
	| dependencies |
	config ifNil: [self loadConfig].
	dependencies := config dependencies.
	dependencies isEmpty ifTrue: [
		Kernel log: 'No dependencies'.
		^self].
	Kernel log: config name ifNil: ['(unnamed project)'].
	dependencies keysAndValuesDo: [:name :constraint |
		Kernel log: '  ', name, ' ', constraint asString]
! !

!EPMModule methodsFor: 'commands' stamp: 'KenD 28/Jun/2026 13:27:40'!
commandNew: aResult
	| name generator |
	aResult positionals isEmpty ifTrue: [
		^self error: 'Usage: epm new <project-name>'].
	name := aResult positionalAt: 1.
	generator := ProjectGenerator new.
	generator name: name.
	generator generate.
	Kernel log: 'Created project: ', name
! !

!EPMModule methodsFor: 'commands' stamp: 'KenD 28/Jun/2026 13:27:40'!
commandStart: aResult
	| cwd name module |
	cwd := Kernel currentDirectory.
	name := cwd copyAfterLast: $/.
	module := Kernel load: name asSymbol.
	module main: args
! !

!EPMModule methodsFor: 'commands' stamp: 'KenD 28/Jun/2026 13:27:40'!
commandTest: aResult
	| name module positionals |
	positionals := aResult positionals.
	name := positionals isEmpty
		ifTrue: [self projectName]
		ifFalse: [positionals first].
	name ifNil: [
		^self error: 'Usage: epm test [module-name]'].
	module := Kernel load: (name, '.Tests') asSymbol.
	(aResult optionAt: 'debug') == true
		ifTrue: [self debugTestModule: module]
		ifFalse: [module main: args]
! !

!EPMModule methodsFor: 'commands' stamp: 'KenD 28/Jun/2026 13:27:40'!
debugTestModule: aModule
	Kernel log: 'Running ', aModule name, ' tests in debug mode...'; log: String cr.
	(TestSuite forModule: aModule) runDebug.
	Kernel log: 'Done.'; log: String cr
! !

!EPMModule methodsFor: 'spec' stamp: 'KenD 28/Jun/2026 13:27:40'!
imports
	^{
		#Kernel -> #(Error OrderedDictionary).
		#ArgParser -> #(ArgParser Command Option).
		#SUnit -> #(TestSuite).
		#TOML -> #(TOMLParser TOMLWriter).
	}
! !

!EPMModule methodsFor: 'main' stamp: 'KenD 28/Jun/2026 13:27:40'!
main: aCollection
	| params |
	args := aCollection.
	self loadConfig.
	self setupParser.
	params := OrderedCollection new.
	3 to: args size do: [:i |
		| arg |
		arg := args at: i.
		params add: arg].
	parser parse: params asArray
! !

!EPMModule methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:40'!
projectName
	^config ifNotNil: [config name]
! !

!LMRModule methodsFor: 'spec' stamp: 'KenD 28/Jun/2026 13:27:38'!
imports
	^{
		#Kernel -> #(ArrayedCollection CharacterArray Closure Float ProtoObject Species Symbol)
	}
! !

!ModuleImporterModule methodsFor: 'spec' stamp: 'KenD 28/Jun/2026 13:27:37'!
imports
	^{
		#Kernel -> #(#InternalReadStream #Character #CharacterArray #IdentitySet #Module).
		#Tonel -> #(#TonelReader).
		#CodeSpecs -> #(#ModuleSpec #ClassSpec #MetaclassSpec #MethodSpec).
		#STON -> #(#STONReader).
		#Compiler -> #(#SCompiler).
	}
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
checkNumberEnd: position
	| char |
	stream atEnd ifTrue: [^self].
	char := stream peek.
	char = $. ifFalse: [^self].
	stream skip: 1.
	stream atEnd
		ifFalse: [stream peek isDigit
			ifTrue: [self error: 'invalid number' at: position]].
	stream skip: -1
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
completeFloat: anInteger
	| tenth |
	tenth := 10 raisedToInteger: self nextExponent.
	^(anInteger * tenth) asFloat
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
completeNumber: anInteger after: aCharacter
	aCharacter = $. ifTrue: [
		^(stream peekFor: $s)
			ifTrue: [self nextScaledFrom: anInteger fractionDigits: 0]
			ifFalse: [self nextFloat: anInteger]].
	(aCharacter = $e or: [aCharacter = $E])
		ifTrue: [^self completeFloat: anInteger].
	aCharacter = $r ifTrue: [^self nextIntegerRadix: anInteger].
	aCharacter = $s ifTrue: [^self nextScaledFrom: anInteger fractionDigits: 0].
	(anInteger = 0 and: [aCharacter = $x or: [aCharacter = $X]])
		ifTrue: [^self nextIntegerRadix: 16].
	stream skip: -1.
	^anInteger
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
completeNumber: anInteger at: start
	| number |
	stream atEnd ifTrue: [^anInteger].
	number := anInteger.
	number := self completeNumber: anInteger after: stream next.
	self checkNumberEnd: start.
	^number
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
digitFromChar: char base: radix
	| c |
	char isDigit ifTrue: [^char digitValue].
	char = $r ifTrue: [^nil].
	char = $x ifTrue: [^nil].
	char = $X ifTrue: [^nil].
	c := char asUppercase.
	(c asInteger between: $A asInteger and: $Z asInteger) ifFalse: [^nil].
	(c !!= $E and: [radix <= c digitValue]) ifTrue: [^nil].
	(c = $E and: [radix = 10]) ifTrue: [^nil].
	^c digitValue
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
endToken
	self error: 'end of stream' at: stream position
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
error: aString at: position
	error := aString -> position.
	return value: nil
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
negativeNumber
	| position |
	stream atEnd ifTrue: [^nil].
	stream peek isDigit ifFalse: [^nil].
	position := stream position.
	^self next key negated -> position
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
next
	| char |
	return isNil ifTrue: [return := [:value | ^value]].
	char := self nextChar.
	char isNil ifTrue: [^self endToken].
	char = $- ifTrue: [^self negativeNumber].
	char = $+ ifTrue: [^self positiveNumber].
	char isDigit ifTrue: [^self nextNumber: char].
	^nil
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
nextChar
	^stream skipWhitespace atEnd ifFalse: [stream next]
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
nextDigit: radix
	| char digit |
	stream atEnd ifTrue: [^nil].
	char := stream next.
	digit := self digitFromChar: char base: radix.
	digit isNil ifTrue: [
		stream skip: -1.
		^nil].
	radix <= digit
		ifTrue: [self error: 'digit greater than radix' at: stream position].
	^digit
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
nextExponent
	| negated exp |
	negated := false.
	(stream peekFor: $+) ifFalse: [negated := stream peekFor: $-].
	exp := self nextIntegerRadix: 10.
	negated ifTrue: [exp := exp negated].
	^exp
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
nextFloat: aNumber
	| base digit e exp |
	digit := self nextDigit: 10.
	digit isNil ifTrue: [
		stream skip: -1.
		^aNumber].
	e := 1.
	base := aNumber * 10 + digit.
	[
		digit := self nextDigit: 10.
		digit isNil]
		whileFalse: [
			base := base * 10 + digit.
			e := e + 1].
	((stream peekFor: $E) or: [stream peekFor: $e]) ifTrue: [
		exp := self nextExponent.
		^(base * (10 raisedToInteger: exp - e)) asFloat].
	(stream peekFor: $s) ifTrue: [^self nextScaledFrom: base fractionDigits: e].
	^(base * (10 raisedToInteger: e negated)) asFloat
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
nextIntegerRadix: radix
	| value valid digit |
	value := 0.
	valid := false.
	[
		digit := self nextDigit: radix.
		digit isNil]
		whileFalse: [
			valid := true.
			value := value * radix + digit].
	valid ifFalse: [self error: 'digit missing' at: stream position + 1].
	^value
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
nextNumber: aCharacter
	| start number digit |
	start := stream position.
	number := aCharacter digitValue.
	[
		digit := self nextDigit: 10.
		digit isNil]
		whileFalse: [number := number * 10 + digit].
	number := self completeNumber: number at: start.
	^number -> (start thru: stream position)
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
nextScaledFrom: aNumber fractionDigits: digits
	| scale denominator sd |
	scale := (stream atEnd not and: [stream peek isDigit])
		ifTrue: [self nextIntegerRadix: 10].
	denominator := 10 raisedToInteger: digits.
	sd := ScaledDecimal
		numerator: aNumber
		denominator: denominator
		scale: scale.
	^sd reduced
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
positiveNumber
	| position |
	stream peek isDigit ifFalse: [^nil].
	position := stream position.
	^self next key -> position
! !

!NumberParser methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
reset
	stream reset.
	return := nil
! !

!NumberParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
error
	^error
! !

!NumberParser methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
on: aString
	stream := aString readStream.
	return := nil
! !

!NumberParser methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
nextValue
	^self next ifNil: [0] ifNotNil: [:assoc | assoc key]
! !

!ObjectReference methodsFor: 'actions' stamp: 'KenD 28/Jun/2026 13:27:38'!
beAbsolute
	absolute := true
! !

!ObjectReference methodsFor: 'actions' stamp: 'KenD 28/Jun/2026 13:27:38'!
classBinding
	^source classBinding
! !

!ObjectReference methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
for: anObject
	self target: anObject
! !

!ObjectReference methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:38'!
initialize
	absolute := false
! !

!ObjectReference methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isAbsolute
	^absolute
! !

!ObjectReference methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isMethod
	^false
! !

!ObjectReference methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:38'!
printOn: aStream
	aStream nextPutAll: 'Ref to ' , target printString
! !

!ObjectReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
source: sourceObject
	source := sourceObject
! !

!ObjectReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
sourceOffset
	^sourceOffset
! !

!ObjectReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
sourceOffset: aNumber
	sourceOffset := aNumber
! !

!ObjectReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
target
	^target
! !

!ObjectReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
target: anObject
	target := anObject
! !

!ObjectReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
targetOffset
	^0
! !

!ObjectReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
valueToWriteAt: sourceAddress with: wordSize
	^self
		valueToWriteAt: sourceAddress
		targeting: target _asSmallInteger
		with: wordSize
! !

!ObjectReference methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
valueToWriteWith: wordSize
	^self valueToWriteAt: source _asSmallInteger + sourceOffset with: wordSize
! !

!ObjectReference methodsFor: 'unclassified' stamp: 'KenD 28/Jun/2026 13:27:38'!
valueToWriteAt: sourceAddress targeting: targetAddress with: wordSize
	| address correction |
	address := targetAddress + self targetOffset.
	correction := absolute
		ifTrue: [0]
		ifFalse: [sourceAddress + sourceOffset + wordSize].
	^address - correction
! !

!ObjectReference class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
absoluteFor: anObject
	^(self new for: anObject) beAbsolute
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
_instancesAreArrayed
	^format & Variable = Variable
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
_instancesAreFixed
	^format & Variable = 0
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
_instancesHavePointers
	^format & Pointers !!= 0
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
canUnderstand: aSymbol
	^instanceBehavior implements: aSymbol
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
includesSelector: aSymbol
	^self methodDictionary includesKey: aSymbol
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
instancesAreArrayed
	^self _instancesAreArrayed
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
instancesHavePointers
	^self _instancesHavePointers
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isBytes
	^self _instancesHavePointers not
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isCategorized
	^self organization notNil
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isSpecies
	^true
! !

!Species methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isVariable
	^self _instancesAreArrayed
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
>> aSelector
	^self compiledMethodAt: aSelector
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
classVariableAssociationAt: aString
	| c assoc |
	c := self.
	[
		c isNil ifTrue: [^nil].
		c classVariables notNil and: [
			assoc := c classVariables associationAt: aString ifAbsent: nil.
			assoc notNil]]
		whileFalse: [c := c superclass].
	^assoc
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
classVariableString
	| stream |
	stream := '' writeStream.
	self classVarNames asSortedCollection
		do: [:cvar | stream nextPutAll: cvar]
		separatedBy: [stream space].
	^stream contents
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
compiledMethodAt: aSymbol
	^self methodDictionary at: aSymbol ifAbsent: nil
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
fillFrom: aClass
	| ivars |
	self == aClass ifTrue: [^self].
	format := aClass format.
	ivars := aClass instVarNames.
	instanceVariables := ivars notEmpty ifTrue: [ivars]
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
format
	^format
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
format: anInteger
	format := anInteger
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
instVarNames: aCollection
	instanceVariables := aCollection isEmpty 
		ifFalse: [
			self isBytes ifTrue: [^self error: 'byte objects cannot have named instance variables'].
			aCollection asArray].
	self updateInstSize; allSubspeciesDo: [:class | class updateInstSize]
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
instanceBehavior
	^instanceBehavior
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
methodDictionary
	^instanceBehavior methods
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
selectors
	^self methodDictionary keys
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
superclass
	^superclass
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
superclass: aClass
	superclass := aClass
! !

!Species methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
timestamp
	^organization notNil ifTrue: [organization timestamp]
! !

!Species methodsFor: 'add/remove' stamp: 'KenD 28/Jun/2026 13:27:38'!
addSelector: aSymbol withMethod: aCompiledMethod
	| selector |
	selector := aSymbol asSymbol.
	self methodDictionary at: selector put: aCompiledMethod.
	self organization notNil ifTrue: [self organization classify: selector]
! !

!Species methodsFor: 'add/remove' stamp: 'KenD 28/Jun/2026 13:27:38'!
removeSelector: aSymbol
	self methodDictionary removeKey: aSymbol ifAbsent: [].
	self organization notNil ifTrue: [self organization remove: aSymbol]
! !

!Species methodsFor: 'add/remove' stamp: 'KenD 28/Jun/2026 13:27:38'!
removeSubclass: aClass
	"
	do nothing
	"
	
! !

!Species methodsFor: 'hierarchy' stamp: 'KenD 28/Jun/2026 13:27:38'!
addSubclass: aClass
	| copy |
	(self subclasses includes: aClass) ifTrue: [^self].
	copy := self subclasses copyWith: aClass.
	self subclasses: copy.
	aClass superclass: self
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
allClassVarNames
	^(self withAllSuperclasses reversed gather: [:cls | cls classVarNames]) asArray
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
allInstVarNames
	^(self withAllSuperclasses reversed gather: [:class | class instVarNames]) asArray
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
allSubclasses
	| all |
	all := OrderedCollection new.
	self allSubclassesDo: [:cls | all add: cls].
	^all
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
allSubclassesDo: aBlock
	self subclassesDo: [:class | 
		aBlock value: class.
		class allSubclassesDo: aBlock]
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
allSubinstances
	| subinstances |
	subinstances := OrderedCollection new.
	[
		self
			withAllSubclassesDo: [:cls | subinstances
				addAll: cls allExistingInstances]]
		evaluateAtomically.
	^subinstances asArray
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
allSubspecies
	| all |
	all := OrderedCollection new.
	self allSubspeciesDo: [:cls | all add: cls].
	^all
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
allSubspeciesDo: aBlock
	self subspeciesDo: [:class | 
		aBlock value: class.
		class allSubspeciesDo: aBlock]
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
allSuperclasses
	| superclasses |
	superclasses := OrderedCollection new.
	self allSuperclassesDo: [:s | superclasses add: s].
	^superclasses
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
allSuperclassesDo: aBlock
	superclass isNil ifTrue: [^self].
	aBlock value: superclass.
	superclass allSuperclassesDo: aBlock
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
methodsReadingInstVar: aString
	| methods index |
	methods := OrderedCollection new.
	index := self indexOfSlot: aString.
	index = 0 ifTrue: [^methods].
	self methodDictionary
		select: [:cm | cm usesInstanceVariable: index]
		thenDo: [:cm | methods add: cm].
	^methods
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
methodsReferencingClassVar: aString
	| methods assoc |
	methods := OrderedCollection new.
	assoc := self classVariableAssociationAt: aString.
	assoc isNil ifTrue: [^methods].
	self instanceClass methodDictionary
		& self instanceClass class methodDictionary
		select: [:cm | cm referencesAssociation: assoc]
		thenDo: [:cm | methods add: cm].
	^methods
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
methodsReferencingInstVar: aString
	| methods index |
	methods := OrderedCollection new.
	index := self indexOfSlot: aString.
	index = 0 ifTrue: [^methods].
	self methodDictionary
		select: [:cm | cm referencesInstanceVariable: index]
		thenDo: [:cm | methods add: cm].
	^methods
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
methodsWritingInstVar: aString
	| methods index |
	methods := OrderedCollection new.
	index := self indexOfSlot: aString.
	index = 0 ifTrue: [^methods].
	self methodDictionary
		select: [:cm | cm assignsInstanceVariable: index]
		thenDo: [:cm | methods add: cm].
	^methods
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
selectorsInCategory: aSymbol
	^self organization selectorsFor: aSymbol
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
withAllSubclasses
	^OrderedCollection with: self withAll: self allSubclasses
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
withAllSubspecies
	^OrderedCollection with: self withAll: self allSubspecies
! !

!Species methodsFor: 'queries' stamp: 'KenD 28/Jun/2026 13:27:38'!
withAllSuperclasses
	^OrderedCollection with: self withAll: self allSuperclasses
! !

!Species methodsFor: 'instances' stamp: 'KenD 28/Jun/2026 13:27:38'!
allInstances
	^Kernel memory allInstancesOf: self
! !

!Species methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicNew
	^self errorVMSpecific
! !

!Species methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicNew: anInteger
	^self errorVMSpecific
! !

!Species methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
new
	^self errorVMSpecific
! !

!Species methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
new: anInteger
	^self errorVMSpecific
! !

!Species methodsFor: 'flags' stamp: 'KenD 28/Jun/2026 13:27:38'!
bePointers
	format := Pointers + self instSize
! !

!Species methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
browse
	Smalltalk browsingTools browse: self
! !

!Species methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
buildBehavior
	| behavior |
	behavior := Behavior with: self methodDictionary copy.
	superclass ifNotNil: [behavior next: superclass instanceBehavior].
	instanceBehavior := behavior
! !

!Species methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
instVarNames
	instanceVariables isNil ifTrue: [^#()].
	instanceVariables isArray ifTrue: [^instanceVariables].
	^instanceVariables substrings
! !

!Species methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
instanceVariableString
	^String streamContents: [:strm | 
		self instVarNames
			do: [:ivar | strm nextPutAll: ivar]
			separatedBy: [strm space]]
! !

!Species methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
kindOfSubclass
	self _instancesAreFixed ifTrue: [^'subclass:'].
	self isBytes ifTrue: [^'variableByteSubclass:'].
	self _instancesHavePointers ifTrue: [^'variableSubclass:'].
	self error: 'invalid type of subclass'
! !

!Species methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
updateClassifications
	organization notNil ifTrue: [organization updateOn: self]
! !

!Species methodsFor: 'organization' stamp: 'KenD 28/Jun/2026 13:27:38'!
categories
	^self organization notNil
		ifTrue: [self organization categoriesOn: self]
		ifFalse: [#()]
! !

!Species methodsFor: 'organization' stamp: 'KenD 28/Jun/2026 13:27:38'!
categorizedSelectors
	^self organization notNil
		ifTrue: [self organization allSelectors]
		ifFalse: [#()]
! !

!Species methodsFor: 'organization' stamp: 'KenD 28/Jun/2026 13:27:38'!
hasUnclassifiedSelectors
	^self categorizedSelectors size < self methodDictionary size
! !

!Species methodsFor: 'organization' stamp: 'KenD 28/Jun/2026 13:27:38'!
organization
	organization isNil ifTrue: [self initializeOrganization].
	^organization
! !

!Species methodsFor: 'organization' stamp: 'KenD 28/Jun/2026 13:27:38'!
organization: aClassOrganizer
	organization := aClassOrganizer
! !

!Species methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
categoryFor: selector
	| category |
	self organization notNil ifTrue: [
		category := self organization categoryFor: selector.
		category notNil ifTrue: [^category]].
	^ClassOrganizer default
! !

!Species methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
classImplementing: aSymbol
	(self methodDictionary includesKey: aSymbol) ifTrue: [^self].
	^self allSuperclasses
		detect: [:class | class includesSelector: aSymbol]
		ifNone: []
! !

!Species methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
depth
	"
	Object depth
	SmallInteger depth 4
	"
	| depth ancestor |
	depth := 0.
	ancestor := self superclass.
	ancestor notNil ifTrue: [depth := ancestor depth + 1].
	^depth
! !

!Species methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
inheritsFrom: aClass
	| class |
	class := self.
	[class == nil] whileFalse: [
		class == aClass ifTrue: [^true].
		class := class superclass].
	^false
! !

!Species methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
instSize
	^format & 16r7F
! !

!Species methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
shouldBeHidden: aSymbol
	^false
! !

!Species methodsFor: 'copying' stamp: 'KenD 28/Jun/2026 13:27:38'!
deepCopy
	^self
! !

!Species methodsFor: 'copying' stamp: 'KenD 28/Jun/2026 13:27:38'!
shallowCopy
	^self
! !

!Species methodsFor: 'errors' stamp: 'KenD 28/Jun/2026 13:27:38'!
errorNotIndexable
	^self error: 'Instances of ' , self name , ' are not indexable'
! !

!Species methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:38'!
initializeOrganization
	self
		organization: (ClassOrganizer new classifyAll: self selectors under: nil)
! !

!Species methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
instanceBehavior: aBehavior
	instanceBehavior := aBehavior
! !

!Species methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
updateInstSize
	| size |
	size := superclass isNil ifTrue: [0] ifFalse: [superclass instSize].
	format := format - self instSize + size + self instVarNames size
! !

!Species methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
primitiveNewBytes: size
	^self errorVMSpecific
! !

!Species methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:38'!
printOn: aStream
	aStream nextPutAll: self name
! !

!Species methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:38'!
withAllSubclassesDo: aBlock
	aBlock evaluateWith: self.
	self allSubclassesDo: aBlock
! !

!Species methodsFor: 'enumerating' stamp: 'KenD 28/Jun/2026 13:27:38'!
withAllSuperclassesDo: aBlock
	aBlock evaluateWith: self.
	self allSuperclassesDo: aBlock
! !

!Species class methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:38'!
initializeFormatFlags
	Flags := self addNamespace.
	Flags
		at: #Variable put: 16r2000;
		at: #Pointers put: 16r4000
! !

!Species class methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:38'!
maxInstVarCount
	^16r7F
! !

!StarToken methodsFor: 'double dispatching' stamp: 'KenD 28/Jun/2026 13:27:38'!
matchFirstAfterStartOn: aMatchAlgorithm
	aMatchAlgorithm matchFirstStar
! !

!StarToken methodsFor: 'double dispatching' stamp: 'KenD 28/Jun/2026 13:27:38'!
matchFirstOn: aMatchAlgorithm
	aMatchAlgorithm matchFirstStar
! !

!StarToken methodsFor: 'double dispatching' stamp: 'KenD 28/Jun/2026 13:27:38'!
matchLastOn: aMatchAlgorithm
	"
	do nothing
	"
	
! !

!StarToken methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:38'!
printOn: aStream
	aStream nextPut: $*
! !

!StarToken class methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
current
	^current
! !

!StarToken class methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:38'!
initializeCurrent
	current := self new
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026 13:27:38'!
+ delta
	delta isInteger ifTrue: [^start + delta thru: end + delta].
	delta isPoint ifTrue: [^start + delta x thru: end + delta y].
	^start + delta start thru: end + delta end
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026 13:27:38'!
- delta
	^self + delta negated
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026 13:27:38'!
// anInteger
	^start // anInteger thru: end // anInteger
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026 13:27:38'!
center
	^start + end // 2
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026 13:27:38'!
down: anInteger
	^start thru: end + anInteger
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026 13:27:38'!
length
	^end - start + 1
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 30/Jan/2023 10:10:45'!
mask
	^(2 raisedTo: end) - (2 raisedTo: start - 1)
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026 13:27:38'!
max
	^start max: end
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026 13:27:38'!
min
	^start min: end
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 28/Jun/2026 13:27:38'!
negated
	^start negated thru: end negated
! !

!Stretch methodsFor: 'arithmetic' stamp: 'KenD 30/Jan/2023 10:10:45'!
shift
	^(start - 1) negated
! !

!Stretch methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026 13:27:38'!
= aStretch
	self class == aStretch class ifFalse: [^false].
	^start = aStretch start and: [end = aStretch end]
! !

!Stretch methodsFor: 'comparing' stamp: 'KenD 28/Jun/2026 13:27:38'!
hash
	^start hashWith: end
! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
end
	^end
! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
end: anInteger
	end := anInteger
! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
start
	^start
! !

!Stretch methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
start: anInteger
	start := anInteger
! !

!Stretch methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
includes: anInteger
	^anInteger between: start and: end
! !

!Stretch methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
intersects: aStretch
	self isEmpty ifTrue: [^false].
	(aStretch includes: start) ifTrue: [^true].
	^aStretch includes: end
! !

!Stretch methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
isEmpty
	^end < start
! !

!Stretch methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
notEmpty
	^start <= end
! !

!Stretch methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:38'!
printOn: aStream
	aStream
		nextPutAll: start asString;
		nextPutAll: ' thru: ';
		nextPutAll: end asString
! !

!Stretch class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
from: start thru: end
	^self new start: start; end: end
! !

!StringPattern methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:38'!
addStar
	stream atEnd ifTrue: [^self].
	tokens add: StarToken current.
	stream next.
	[stream peek ifNil: [^self] ifNotNil: [:c | c isAsterisk]]
		whileTrue: [stream next]
! !

!StringPattern methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:38'!
addToken
	| star pos end token |
	star := false.
	pos := stream position + 1.
	[stream atEnd or: [star := stream next isAsterisk]] whileFalse.
	star ifTrue: [stream skip: -1].
	end := stream position.
	pos <= end ifTrue: [
		token := MatchToken on: stream collection from: pos to: end.
		tokens add: token]
! !

!StringPattern methodsFor: 'scanning' stamp: 'KenD 28/Jun/2026 13:27:38'!
scan
	[stream atEnd] whileFalse: [self addToken; addStar]
! !

!StringPattern methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
input
	^stream contents
! !

!StringPattern methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
on: aString
	stream := aString readStream.
	tokens := OrderedCollection new.
	self scan
! !

!StringPattern methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
tokens
	^tokens copy
! !

!StringPattern methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
match: aString
	^self match: aString index: 1
! !

!StringPattern methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
match: aString ifAbsent: aBlock
	^self match: aString index: 1 ifAbsent: aBlock
! !

!StringPattern methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
match: aString index: anInteger
	^self match: aString index: anInteger ifAbsent: nil
! !

!StringPattern methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
match: aString index: anInteger ifAbsent: aBlock
	| algorithm |
	algorithm := MatchAlgorithm new
		pattern: self;
		string: aString;
		index: anInteger.
	algorithm run.
	algorithm hasMatched ifTrue: [^algorithm matchRange].
	^aBlock notNil ifTrue: [
		aBlock arity = 0
			ifTrue: [aBlock value]
			ifFalse: [aBlock evaluateWith: algorithm failure]]
! !

!StringPattern methodsFor: 'inquiries' stamp: 'KenD 28/Jun/2026 13:27:38'!
matches: aString
	| range |
	range := self match: aString.
	^range notNil and: [range x = 1 and: [range y = aString size]]
! !

!StringPattern methodsFor: 'printing' stamp: 'KenD 28/Jun/2026 13:27:38'!
printOn: aStream
	tokens do: [:t | t printOn: aStream]
! !

!StringPattern class methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
on: aString
	^self new on: aString
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
characterIndexOf: aString at: anInteger
	| index s |
	index := 0.
	s := 0.
	[s < anInteger] whileTrue: [| ch len |
		index := index + 1.
		ch := aString at: index.
		len := self sizeOfCharacter: ch.
		s := s + len].
	^index
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeStringFrom: aStream
	^self
		decodeStringFrom: aStream
		length: aStream size // self minBytesPerChar
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeStringFrom: aStream length: anInteger
	| string |
	string := String new: anInteger.
	^self decodeStringFrom: aStream on: string
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeStringFrom: aStream on: buffer
	| bytes code string index n |
	bytes := true.
	index := 0.
	code := nil.
	string := buffer.
	n := string size.
	[aStream atEnd or: [code = 0] or: [index >= n]] whileFalse: [
		code := self decodeFrom: aStream.
		(bytes andNot: [Ansi isAnsi: code]) ifTrue: [
			bytes := false.
			string := string asWideString].
		code = 0 ifFalse: [
			index := index + 1.
			string at: index putCode: code]].
	^index < string size ifTrue: [string copyTo: index] ifFalse: [string]
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
externalCopyOf: aString
	| bytes |
	aString isNil ifTrue: [^nil].
	bytes := self parameterFrom: aString.
	^bytes externalCopy
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
indexesOf: aString from: start to: end
	"
	UTF16 current indexesOf: (WideString with: $𝑎 with: $_ with: $𝑎 with: $→) from: 2 to: 3
	"
	| s e |
	s := 1.
	1 to: start - 1 do: [:i | | ch len |
		ch := aString at: i.
		len := self sizeOfCharacter: ch.
		s := s + len].
	e := s - 1.
	start to: end do: [:i | | ch len |
		ch := aString at: i.
		len := self sizeOfCharacter: ch.
		e := e + len].
	^s thru: e
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
isString: s1 greaterThan: s2
	^(self compareStringiW: s1 with: s2) > 0
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
isString: s1 greaterThanOrEqualTo: s2
	^(self compareStringiW: s1 with: s2) >= 0
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
isString: s1 lessThan: s2
	^(self compareStringiW: s1 with: s2) < 0
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
isString: s1 lessThanOrEqualTo: s2
	^(self compareStringiW: s1 with: s2) <= 0
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
lowercaseOf: aString
	^UTF16 current lowercaseOf: aString
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
sizeInBytesOf: aString
	| size |
	size := self sizeOfCharacter: Character null.
	1 to: aString size do: [:i | | ch s |
		ch := aString at: i.
		s := self sizeOfCharacter: ch.
		size := size + s].
	^size
! !

!Unicode methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
uppercaseOf: aString
	^UTF16 current uppercaseOf: aString
! !

!Unicode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
compareStringiW: aString1 with: aString2
	^UTF16 current compareStringiW: aString1 with: aString2
! !

!Unicode methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
minBytesPerChar
	^1
! !

!Unicode methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
decode: aByteArray
	^self decodeStringFrom: aByteArray readStream
! !

!Unicode methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeFrom: aStream
	self subclassResponsibility
! !

!Unicode methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
encode: aString
	^ByteArray
		streamContents: [:strm | aString do: [:ch | self encode: ch on: strm]]
! !

!Unicode methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
encode: aCharacter on: aStream
	self subclassResponsibility
! !

!Unicode class methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
decode: aByteArray
	^self current decode: aByteArray
! !

!Unicode class methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeBytes: aByteArray
	| decoder stream |
	stream := aByteArray readStream.
	decoder := self decoderFor: stream.
	^decoder decode: stream upToEnd
! !

!Unicode class methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeFromAddress: externalAddress length: anInteger
	^self current
		decodeStringFrom: externalAddress readStream
		length: anInteger
! !

!Unicode class methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
decoderFor: aStream
	(aStream peekForAll: UTF32 prefix) ifTrue: [^UTF32].
	(aStream peekForAll: UTF16 prefix) ifTrue: [^UTF16].
	^UTF8
! !

!UTF16 methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
characterIndexOf: aString at: anInteger
	(self isDBS: aString upTo: anInteger - 1) ifTrue: [^anInteger].
	^super characterIndexOf: aString at: anInteger * 2
! !

!UTF16 methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
characterIndexesOf: aString from: start to: end
	"
	UTF16 current characterIndexesOf: '𝑎𝑎𝑎x' from: 3 to: 5
	"
	| i e s max n |
	aString isWideString ifFalse: [^start thru: end].
	s := i := self characterIndexOf: aString at: start.
	n := aString size.
	max := end * 2.
	e := start * 2.
	[i < n and: [e <= max]] whileTrue: [| ch len |
		i := i + 1.
		ch := aString at: i.
		len := self sizeOfCharacter: ch.
		e := e + len].
	^s thru: i - 1
! !

!UTF16 methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
indexesOf: aString from: start to: end
	| e stretch delta |
	e := start - 1 max: end - 1.
	(self isDBS: aString upTo: e) ifTrue: [
		delta := end > 0
			ifTrue: [self sizeOfCharacter: (aString at: end)]
			ifFalse: [0].
		^start thru: end - 1 + (delta // 2)].
	stretch := super indexesOf: aString from: start to: end.
	^stretch + 1 // 2
! !

!UTF16 methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
isDBS: aString
	^self isDBS: aString upTo: aString size
! !

!UTF16 methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
isDBS: aString upTo: anInteger
	aString isWide ifFalse: [^true].
	2
		to: anInteger * 4
		by: 4
		do: [:i | (aString uShortAtOffset: i) = 0 ifFalse: [^false]].
	^true
! !

!UTF16 methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
lengthOf: aString
	^(self encode: aString) size // 2
! !

!UTF16 methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
parameterFrom: aString
	| strm |
	strm := (ByteArray new: aString size + 1 * 2) writeStream.
	aString isCharacter
		ifTrue: [self encode: aString on: strm]
		ifFalse: [aString do: [:char | self encode: char on: strm]].
	strm nextPut: 0; nextPut: 0.
	^strm contents
! !

!UTF16 methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
sizeInBytesOf: aString
	aString isWideString ifFalse: [^aString size + 1 * 2].
	^super sizeInBytesOf: aString
! !

!UTF16 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeFrom: aStream
	| b1 b2 hi b3 b4 lo |
	b1 := aStream nextByte.
	b2 := aStream nextByte.
	hi := b1 + (b2 bitShift: 8).
	b2 < 16rD8 ifTrue: [^hi].
	hi := hi - 16rD800.
	hi < 16r400 ifFalse: [^b2 * 256 + b1].
	hi := (hi bitShift: 10) + 16r10000.
	b3 := aStream nextByte.
	b4 := aStream nextByte.
	lo := (b4 bitShift: 8) - 16rDC00 + b3.
	^hi + lo
! !

!UTF16 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
encode: aCharacter on: aStream
	| code c20 hi lo |
	code := aCharacter codePoint.
	code < 128 ifTrue: [
		aStream nextPut: code; nextPut: 0.
		^self].
	code < 16rD800 ifTrue: [
		aStream
			nextPut: (code bitAnd: 16rFF);
			nextPut: (code bitShift: -8).
		^self].
	code < 16rE000 ifTrue: [self error: 'invalid code point'].
	code < 16r10000 ifTrue: [
		aStream
			nextPut: (code bitAnd: 16rFF);
			nextPut: (code bitShift: -8).
		^self].
	code < 16r110000 ifTrue: [
		c20 := code - 16r10000.
		hi := (c20 bitShift: -10) + 16rD800.
		lo := (c20 bitAnd: 16r3FF) + 16rDC00.
		aStream
			nextPut: (hi bitAnd: 16rFF);
			nextPut: (hi bitShift: -8);
			nextPut: (lo bitAnd: 16rFF);
			nextPut: (lo bitShift: -8).
		^self].
	self error: 'invalid code point'
! !

!UTF16 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
sizeOfCharacter: aCharacter
	^aCharacter codePoint < 16r10000 ifTrue: [2] ifFalse: [4]
! !

!UTF16 methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
minBytesPerChar
	^2
! !

!UTF16 class methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeFromAddress: externalAddress length: anInteger
	| stream |
	stream := externalAddress readStream readLimit: anInteger * 2.
	^self current decodeStringFrom: stream length: anInteger
! !

!UTF16 class methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
prefix
	^#[16rFE 16rFF]
! !

!UTF32 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
decode: aByteArray
	^WideString newFrom: aByteArray
! !

!UTF32 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
encode: aCharacter on: aStream
	aStream nextULongPut: aCharacter codePoint
! !

!UTF32 class methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
prefix
	^#[16rFE 16rFF 0 0]
! !

!UTF8 methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
accepts: aByteArray
	| stream |
	stream := aByteArray readStream.
	[stream atEnd] whileFalse: [| s |
		s := self sizeOfEncoding: stream next.
		s = 0 ifTrue: [^false].
		s - 1 timesRepeat: [
			stream atEnd ifTrue: [^false].
			(stream next bitAnd: 0xC0) = 0x80 ifFalse: [^false]]].
	^true
! !

!UTF8 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
decode: aByteArray
	aByteArray isExternalMemory
		ifTrue: [^self class decodeMemory: aByteArray length: aByteArray length].
	1
		to: aByteArray size
		do: [:i | (aByteArray at: i) asInteger > 127
			ifTrue: [^super decode: aByteArray]].
	^aByteArray asString
! !

!UTF8 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeFrom: aStream
	| b1 flags count bytes b2 b3 b4 |
	b1 := aStream nextByte.
	b1 < 128 ifTrue: [^b1].
	flags := b1 bitAnd: 16rF8.
	count := self trailing: flags.
	count isNil ifTrue: [^b1].
	bytes := aStream peek: count.
	bytes size < count ifTrue: [^b1].
	1
		to: count
		do: [:i | ((bytes byteAt: i) bitAnd: 16rC0) = 16r80 ifFalse: [^b1]].
	aStream skip: count.
	count = 1 ifTrue: [
		b2 := bytes byteAt: 1.
		b1 := b1 bitAnd: 16r1F.
		^(b1 bitShift: 6) + (b2 bitAnd: 16r3F)].
	count = 2 ifTrue: [
		b2 := (bytes byteAt: 1) bitAnd: 16r3F.
		b3 := (bytes byteAt: 2) bitAnd: 16r3F.
		b1 := b1 bitAnd: 16rF.
		^(b1 bitShift: 12) + (b2 bitShift: 6) + b3].
	b2 := (bytes byteAt: 1) bitAnd: 16r3F.
	b3 := (bytes byteAt: 2) bitAnd: 16r3F.
	b4 := (bytes byteAt: 3) bitAnd: 16r3F.
	b1 := b1 bitAnd: 7.
	^(b1 bitShift: 18) + (b2 bitShift: 12) + (b3 bitShift: 6) + b4
! !

!UTF8 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
encode: aString
	aString class = String ifTrue: [
		1
			to: aString size
			do: [:i | (aString codeAt: i) < 128 ifFalse: [^super encode: aString]].
		^aString asByteArray].
	^super encode: aString
! !

!UTF8 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
encode: aCharacter on: aStream
	| code b1 b2 b3 b4 |
	code := aCharacter codePoint.
	code < 128 ifTrue: [
		aStream nextBytePut: code.
		^self].
	code < 16r800 ifTrue: [
		b1 := code bitShift: -6.
		b1 := b1 bitOr: 16rC0.
		b2 := code bitAnd: 16r3F.
		b2 := b2 bitOr: 16r80.
		aStream nextBytePut: b1; nextBytePut: b2.
		^self].
	code < 16r10000 ifTrue: [
		b1 := code bitShift: -12.
		b1 := b1 bitOr: 16rE0.
		b2 := code bitShift: -6.
		b2 := b2 bitAnd: 16r3F.
		b2 := b2 bitOr: 16r80.
		b3 := code bitAnd: 16r3F.
		b3 := b3 bitOr: 16r80.
		aStream
			nextBytePut: b1;
			nextBytePut: b2;
			nextBytePut: b3.
		^self].
	b1 := code bitShift: -18.
	b1 := b1 bitOr: 16rF0.
	b2 := code bitShift: -12.
	b2 := b2 bitAnd: 16r3F.
	b2 := b2 bitOr: 16r80.
	b3 := code bitShift: -6.
	b3 := b3 bitAnd: 16r3F.
	b3 := b3 bitOr: 16r80.
	b4 := code bitAnd: 16r3F.
	b4 := b4 bitOr: 16r80.
	aStream
		nextBytePut: b1;
		nextBytePut: b2;
		nextBytePut: b3;
		nextBytePut: b4
! !

!UTF8 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
encodeCharacter: aCharacter
	| code b1 b2 b3 b4 |
	code := aCharacter codePoint.
	code < 128 ifTrue: [^ByteArray with: code].
	code < 16r800 ifTrue: [
		b1 := code bitShift: -6.
		b1 := b1 bitOr: 16rC0.
		b2 := code bitAnd: 16r3F.
		b2 := b2 bitOr: 16r80.
		^ByteArray with: b1 with: b2].
	code < 16r10000 ifTrue: [
		b1 := code bitShift: -12.
		b1 := b1 bitOr: 16rE0.
		b2 := code bitShift: -6.
		b2 := b2 bitAnd: 16r3F.
		b2 := b2 bitOr: 16r80.
		b3 := code bitAnd: 16r3F.
		b3 := b3 bitOr: 16r80.
		^ByteArray with: b1 with: b2 with: b3].
	b1 := code bitShift: -18.
	b1 := b1 bitOr: 16rF0.
	b2 := code bitShift: -12.
	b2 := b2 bitAnd: 16r3F.
	b2 := b2 bitOr: 16r80.
	b3 := code bitShift: -6.
	b3 := b3 bitAnd: 16r3F.
	b3 := b3 bitOr: 16r80.
	b4 := code bitAnd: 16r3F.
	b4 := b4 bitOr: 16r80.
	^ByteArray with: b1 with: b2 with: b3 with: b4
! !

!UTF8 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
sizeOfCharacter: aCharacter
	| code |
	code := aCharacter codePoint.
	code < 128 ifTrue: [^1].
	code < 16r800 ifTrue: [^2].
	code < 16r10000 ifTrue: [^3].
	^4
! !

!UTF8 methodsFor: 'encoding / decoding' stamp: 'KenD 28/Jun/2026 13:27:38'!
sizeOfEncoding: code
	code < 0x80 ifTrue: [^1].
	code < 0xC0 ifTrue: [^0].
	code < 0xE0 ifTrue: [^2].
	code < 0xF0 ifTrue: [^3].
	code < 0xF8 ifTrue: [^4].
	^0
! !

!UTF8 methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
parameterFrom: aString
	| strm |
	strm := (ByteArray new: aString size + 1) writeStream.
	aString isCharacter
		ifTrue: [self encode: aString on: strm]
		ifFalse: [aString do: [:char | self encode: char on: strm]].
	strm nextPut: 0.
	^strm contents
! !

!UTF8 methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
trailing: byte
	(byte bitAnd: 2r11100000) = 2r11000000 ifTrue: [^1].
	(byte bitAnd: 2r11110000) = 2r11100000 ifTrue: [^2].
	(byte bitAnd: 2r11111000) = 2r11110000 ifTrue: [^3].
	^nil
! !

!UTF8 class methodsFor: 'testing' stamp: 'KenD 28/Jun/2026 13:27:38'!
accepts: aByteArray
	^self current accepts: aByteArray
! !

!UTF8 class methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
decodeMemory: anExternalMemory length: anInteger
	^Smalltalk os utf8ToWide: anExternalMemory length: anInteger
! !

!UTF8 class methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
encodeMemory: anExternalMemory length: anInteger
	"
	UTF8 encodeMemory: '→' externalCopy length: 2
	"
	Smalltalk os wideToUtf8: anExternalMemory length: anInteger
! !

!UTF8 class methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
prefix
	^#[16rEF 16rBB 16rBF]
! !

!ModuleLoader methodsFor: 'loading' stamp: 'KenD 28/Jun/2026 13:27:37'!
loadModuleNamed: aString
	| classes moduleName moduleSpec moduleClass |
	spec := self readModuleSpecNamed: aString.
	classes := self classesSortedBySuperclass: spec classes.
	moduleName := ('.' split: spec name) last asSymbol.
	moduleSpec := spec classes detect: [:cls | cls name = (moduleName , #Module)] ifNone: nil.
	moduleSpec ifNil: [ moduleSpec := spec classes detect: [:cls | cls name = (#Module , moduleName)] ifNone: nil].
	moduleSpec
		ifNil: [
			moduleClass := Module.]
		ifNotNil: [ 
			moduleClass := self createNewClassFrom: moduleSpec in: nil.
			classes remove: moduleSpec ].
	module := self createNewModule: moduleClass.
	module name isEmpty ifTrue: [ module name: moduleName asString ].
	classes do: [:c | self createNewClassFrom: c in: module ].
	spec extendedClasses do: [:c | self createExtensionMethodsOf: c ].
	module justLoaded.
	Kernel loadedModules at: module name asSymbol put: module.
	^ module
! !

!ModuleLoader methodsFor: 'loading' stamp: 'KenD 28/Jun/2026 13:27:37'!
readModuleSpecNamed: aString
	| reader |
	reader := ModuleSpecReader new.
	reader path: '../../modules/', aString.
	^reader read
! !

!ModuleLoader methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:37'!
classesSortedBySuperclass: anArray
	| result seen s dfs |
	result := OrderedCollection new.
	seen := IdentitySet new.
	dfs := [ :class | 
	       s := class superclass.
	       ((anArray includes: s) andNot: [ seen includes: s ]) ifTrue: [ 
		       dfs value: s ].	
	       result add: class.
	       seen add: class ].
	anArray do: [ :class | (seen includes: class) ifFalse: [ dfs value: class ] ].
	self ASSERT: result asSet = anArray asSet.
	^ result
! !

!ModuleLoader methodsFor: 'creating' stamp: 'KenD 28/Jun/2026 13:27:37'!
createExtensionMethodsOf: aClassSpec
	| class metaclass |
	class := module namespace at: aClassSpec name asSymbol.
	metaclass := class behavior classBinding.
	aClassSpec methods do: [ :m | | cm |
		 cm := self createNewMethod: m in: class.
		module ifNotNil: [ module addExtension: cm ] ].
	aClassSpec metaclass methods do: [ :m | | cm | 
		cm := self createNewMethod: m in: metaclass.
		module ifNotNil: [ module addExtension: cm ] ].
	^ module
! !

!ModuleLoader methodsFor: 'creating' stamp: 'KenD 28/Jun/2026 13:27:37'!
createNewClassFrom: aClassSpec in: module
	| superclass metaclass class |
	superclass := (module ifNil: [ Kernel ]) namespace at: aClassSpec supername asSymbol.
	class := Class newSubclassOf: superclass.
	metaclass := class class.
	class name: aClassSpec name; instVarNames: aClassSpec instVarNames; classVarNames: aClassSpec classVarNames.
	aClassSpec methods do: [ :m | self createNewMethod: m in: class ].
	aClassSpec metaclass methods do: [ :m | self createNewMethod: m in: metaclass ].
	module ifNotNil: [
		module addClass: class.
		class module: module].
	^ class
! !

!ModuleLoader methodsFor: 'creating' stamp: 'KenD 28/Jun/2026 13:27:37'!
createNewMethod: aMethodSpec in: aSpecies
	| method selector |
	method := SCompiler new compile: aMethodSpec sourceCode.
	selector := method selector.
	method classBinding: aSpecies.
	aSpecies methodDictionary at: selector put: method.
	aSpecies organization classify: selector under: method category.
	^method
! !

!ModuleLoader methodsFor: 'creating' stamp: 'KenD 28/Jun/2026 13:27:37'!
createNewModule: aClass
	| module |
	module := aClass new.
	module bindKernelExports; importRequiredModules.
	aClass name !!= #Module ifTrue: [ aClass module: module. module addClass: aClass].
	^module
! !

!ModuleSpecReader methodsFor: 'read' stamp: 'KenD 28/Jun/2026 13:27:38'!
read
	self readMetadata; readClasses; readExtendedClasses.
	^module
! !

!ModuleSpecReader methodsFor: 'read' stamp: 'KenD 28/Jun/2026 13:27:38'!
readClass: aString
	| filename reader definition pointers variable class metasclass stream contents |
	filename := path / aString ,  '.st'.
	contents := Kernel readFile: filename.
	contents size = 0 ifTrue: [
		filename := path / aString , '.class.st'.
		contents := Kernel readFile: filename.
		contents size = 0 ifTrue: [
			self error: 'Cannot find file for class ' , aString]].
	stream := InternalReadStream on: contents.
	reader := TonelReader on: stream.
	[reader read] ensure: [stream close].
	definition := reader definition.
	variable := pointers := true.
	definition at: #type ifPresent: [:type |
		variable := true.
		type = #bytes ifTrue: [pointers := false]].
	class := ClassSpec new
		module: module;
		name: (definition at: #name) asString;
		supername: (definition at: #superclass ifAbsent: nil) asString;
		ivars: (definition at: #instVars ifAbsent: #());
		cvarNames: (definition at: #classVars ifAbsent: #());
		sharedPools: (definition at: #pools ifAbsent: #());
		isVariable: variable;
		isPointers: pointers.
	metasclass := MetaclassSpec new
		module: module;
		instanceClass: class;
		ivars: (definition at: #classInstVars ifAbsent: #()).
	class metaclass: metasclass.
	module addClass: class.
	reader methods do: [:m | self readMethod: m]
! !

!ModuleSpecReader methodsFor: 'read' stamp: 'KenD 28/Jun/2026 13:27:38'!
readClasses
	(metadata at: #classes) do: [:name | self readClass: name]
! !

!ModuleSpecReader methodsFor: 'read' stamp: 'KenD 28/Jun/2026 13:27:38'!
readExtendedClass: aString

	| filename contents stream reader definition class metaclass |
	filename := path / aString ,  '.st'.
	contents := Kernel readFile: filename.
	contents size = 0 ifTrue: [
			self error: 'Cannot find file for extended class ' , aString].
	stream := InternalReadStream on: contents.
	reader := TonelReader on: stream.
	[reader read] ensure: [stream close].
	definition := reader definition.
	class := ClassSpec new
		module: module;
		name: (definition at: #name) asString.
	metaclass := MetaclassSpec new module: module; instanceClass: class.
	class metaclass: metaclass.
	module addClassExtension: class.
	reader methods do: [:m | self readMethod: m]
! !

!ModuleSpecReader methodsFor: 'read' stamp: 'KenD 28/Jun/2026 13:27:38'!
readExtendedClasses
	(metadata at: #extendedClasses ifAbsent: [#()])
		do: [:name | self readExtendedClass: name]
! !

!ModuleSpecReader methodsFor: 'read' stamp: 'KenD 28/Jun/2026 13:27:38'!
readMetadata
	| stream name classes |
	stream := (Kernel  readFile: path , '/package.st') readStream.
	stream throughAll: 'Package '.
	metadata := (STONReader on: stream) parseMap.
	name := (metadata at: #name) replace: $- with: Character space.
	module name: name asString.
	classes := metadata at: #classes.
	classes := classes copyWith: name asString, 'Module'.
	metadata at: #classes put: classes
! !

!ModuleSpecReader methodsFor: 'read' stamp: 'KenD 28/Jun/2026 13:27:38'!
readMethod: aDictionary
	| classname selector category class signature body source method |
	classname := aDictionary at: #class.
	selector := aDictionary at: #selector.
	category := aDictionary at: #category.
	class := module resolveClass: classname.
	class isNil ifTrue: [
		self
			error: 'Cannot find class for method ' , classname , ' >> #'
				, selector asString].
	signature := aDictionary at: #signature.
	body := aDictionary at: #body.
	source := signature dosToUnix unixToMac , String cr
		, body dosToUnix unixToMac.
	method := MethodSpec new
		module: module;
		classBinding: class;
		selector: selector;
		category: category;
		source: source.
	class addMethod: method
! !

!ModuleSpecReader methodsFor: 'initialization' stamp: 'KenD 28/Jun/2026 13:27:38'!
initialize
	super initialize.
	module := ModuleSpec new
! !

!ModuleSpecReader methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
module
	^module
! !

!ModuleSpecReader methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
module: aModuleSpec
	module := aModuleSpec
! !

!ModuleSpecReader methodsFor: 'accessing' stamp: 'KenD 28/Jun/2026 13:27:38'!
path: aFilename
	path := aFilename
! !

!MessageInlinerTest methodsFor: 'helpers' stamp: 'KenD 28/Jun/2026 13:27:41'!
ast: source
	^SCompiler new parse: source
! !

!MessageInlinerTest methodsFor: 'helpers' stamp: 'KenD 28/Jun/2026 13:27:41'!
cascadeMessagesIn: source
	| ast cascadeMessages |
	ast := self ast: source.
	cascadeMessages := OrderedCollection new.
	ast nodesDo: [:n |
		(n isMessageNode and: [n isCascadeMessage])
			ifTrue: [cascadeMessages add: n]].
	^cascadeMessages
! !

!MessageInlinerTest methodsFor: 'tests - cascade' stamp: 'KenD 28/Jun/2026 13:27:41'!
testCascadeAndKeywordIsNotInlined
	"Regression: a keyword cascade message such as `at:put:` must not be inlined."
	| messages |
	messages := self cascadeMessagesIn: 'foo
		^Dictionary new at: #a put: 1; at: #b put: 2; yourself'.
	messages do: [:m | self deny: m isInlined]
! !

!MessageInlinerTest methodsFor: 'tests - cascade' stamp: 'KenD 28/Jun/2026 13:27:41'!
testCascadeIfTrueIsNotInlined
	"Regression: ifTrue: as the first message of a cascade must not be inlined,
	 because the cascade machinery needs the receiver (a Boolean) to receive
	 the subsequent messages. This is the pattern that the original
	 InternalReadStream>>peekFor: relied on:
		^self peek = token ifTrue: [position := position + 1]; yourself"
	| messages |
	messages := self cascadeMessagesIn: 'foo
		^true ifTrue: [42]; yourself'.
	self assert: messages size = 2.
	messages do: [:m | self deny: m isInlined]
! !

!MessageInlinerTest methodsFor: 'tests - cascade' stamp: 'KenD 28/Jun/2026 13:27:41'!
testCascadeWhileTrueIsNotInlined
	"Regression: whileTrue: in a cascade must not be inlined either."
	| messages |
	messages := self cascadeMessagesIn: 'foo
		^[true] whileTrue: [^1]; yourself'.
	messages do: [:m | self deny: m isInlined]
! !

!MessageInlinerTest methodsFor: 'tests - non-cascade' stamp: 'KenD 28/Jun/2026 13:27:41'!
testNonCascadeIfTrueIsInlined
	"Sanity check: outside a cascade, ifTrue: is still inlined as expected."
	| ast inlined |
	ast := self ast: 'foo
		^true ifTrue: [42]'.
	inlined := false.
	ast nodesDo: [:n |
		(n isMessageNode and: [n isInlined])
			ifTrue: [inlined := true]].
	self assert: inlined
! !

!SmalltalkScannerTest methodsFor: 'setup' stamp: 'KenD 28/Jun/2026 13:27:41'!
setUp
	super setUp.
	scanner := SCompiler new smalltalkScanner
! !

!SmalltalkScannerTest methodsFor: 'numbers' stamp: 'KenD 28/Jun/2026 13:27:41'!
test0xNotation
	| node |
	node := SCompiler new smalltalkParser parseExpression: '0x10'.
	self assert: node statements first value = 16.
	node := SCompiler new smalltalkParser parseExpression: '0X10'.
	self assert: node statements first value = 16
! !

!SmalltalkScannerTest methodsFor: 'numbers' stamp: 'KenD 28/Jun/2026 13:27:41'!
testFloat
	| node |
	scanner on: '0.1'.
	node := scanner next.
	self
		assert: node isNumberNode;
		assert: node value = 0.1;
		assert: node source = '0.1'.
	scanner on: '0.1e-35'.
	node := scanner next.
	self
		assert: node isNumberNode;
		assert: node value = 0.1e-35;
		assert: node source = '0.1e-35'
! !

!SmalltalkScannerTest methodsFor: 'numbers' stamp: 'KenD 28/Jun/2026 13:27:41'!
testInteger
	| node |
	scanner on: '0 12 -35'.
	node := scanner next.
	self
		assert: node isNumberNode;
		assert: node value = 0;
		assert: node source = '0'.
	node := scanner next.
	self
		assert: node isNumberNode;
		assert: node value = 12;
		assert: node source = '12'.
	node := scanner next.
	self
		deny: node isNumberNode;
		assert: (node is: #'-');
		assert: node source = '-'.
	node := scanner next.
	self
		assert: node isNumberNode;
		assert: node value = 35;
		assert: node source = '35'
! !

!SmalltalkScannerTest methodsFor: 'numbers' stamp: 'KenD 28/Jun/2026 13:27:41'!
testIntegerRadix
	| node |
	scanner on: '16rFA2'.
	node := scanner next.
	self
		assert: node isNumberNode;
		assert: node value = 16rFA2;
		assert: node source = '16rFA2'
! !

!SmalltalkScannerTest methodsFor: 'arrays' stamp: 'KenD 28/Jun/2026 13:27:41'!
testArrayStart
	| node |
	scanner on: '#()'.
	node := scanner next.
	self
		assert: (node is: #'#(');
		assert: node source = '#('.
	scanner on: '#['.
	node := scanner next.
	self
		assert: (node is: #'#[');
		assert: node source = '#['.
	scanner on: '#''hello'''.
	node := scanner next.
	self
		assert: node value = #hello;
		assert: node source = '#''hello'''
! !

!SmalltalkScannerTest methodsFor: 'strings' stamp: 'KenD 28/Jun/2026 13:27:41'!
testBinary
	| node |
	scanner on: '-
		--
		---
		==>
		~!!|\/%&*+=><'.
	node := scanner next.
	self
		assert: node isBinary;
		assert: node value = #'-';
		assert: node source = '-'.
	node := scanner next.
	self
		assert: node isBinary;
		assert: node value = #'--';
		assert: node source = '--'.
	node := scanner next.
	self
		assert: node isBinary;
		assert: node value = #'---';
		assert: node source = '---'.
	node := scanner next.
	self
		assert: node isBinary;
		assert: node value = #'==>';
		assert: node source = '==>'.
	node := scanner next.
	self
		assert: node isBinary;
		assert: node value = #'~!!|\/%&*+=><';
		assert: node source = '~!!|\/%&*+=><'
! !

!SmalltalkScannerTest methodsFor: 'strings' stamp: 'KenD 28/Jun/2026 13:27:41'!
testCharacter
	| node |
	scanner on: '$a$b'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = $a;
		assert: node source = '$a'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = $b;
		assert: node source = '$b'
! !

!SmalltalkScannerTest methodsFor: 'strings' stamp: 'KenD 28/Jun/2026 13:27:41'!
testEmpty
	scanner on: ''.
	self assert: scanner next isEnd
! !

!SmalltalkScannerTest methodsFor: 'strings' stamp: 'KenD 28/Jun/2026 13:27:41'!
testString
	| node quote |
	scanner on: '' storeString.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = '';
		assert: node source = (String with: $' with: $').
	scanner on: 'Hello World!!' storeString.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = 'Hello World!!';
		assert: node source = 'Hello World!!' storeString.
	quote := String with: $'.
	scanner on: quote storeString.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = quote;
		assert: node source = quote storeString
! !

!SmalltalkScannerTest methodsFor: 'symbols' stamp: 'KenD 28/Jun/2026 13:27:41'!
testBinarySymbol
	| node |
	scanner on: '#='.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node hasSymbol;
		assert: node value = #'='
! !

!SmalltalkScannerTest methodsFor: 'symbols' stamp: 'KenD 28/Jun/2026 13:27:41'!
testDashStartingSymbol
	| node |
	scanner on: '#++'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = #'++';
		assert: node source = '#++'.
	scanner on: '#//'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = #'//';
		assert: node source = '#//'.
	scanner on: '#--'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = #'--';
		assert: node source = '#--'.
	scanner on: '#+-'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = #'+-';
		assert: node source = '#+-'
! !

!SmalltalkScannerTest methodsFor: 'symbols' stamp: 'KenD 28/Jun/2026 13:27:41'!
testNumericSymbol
	scanner on: '#35'.
	self assert: scanner next value = '35' asSymbol
! !

!SmalltalkScannerTest methodsFor: 'symbols' stamp: 'KenD 28/Jun/2026 13:27:41'!
testSymbol
	| node |
	scanner on: '#-'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = #'-';
		assert: node source = '#-'.
	scanner on: '#a:'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = #a:;
		assert: node source = '#a:'.
	scanner on: '#-!!'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = #'-!!';
		assert: node source = '#-!!'.
	scanner on: '#a:b:'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = #a:b:;
		assert: node source = '#a:b:'.
	scanner on: '#a:b'.
	node := scanner next.
	self
		assert: node isLiteral;
		assert: node value = #a:;
		assert: node source = '#a:'.
	node := scanner next.
	self assert: node value = 'b'; assert: node source = 'b'
! !

!SmalltalkScannerTest methodsFor: 'colons' stamp: 'KenD 28/Jun/2026 13:27:41'!
testColon
	| node |
	scanner on: ':a'.
	node := scanner next.
	self
		assert: (node is: $:);
		assert: node source = ':'.
	node := scanner next.
	self
		assert: node value = 'a';
		assert: node source = 'a'.
	scanner on: ':='.
	node := scanner next.
	self
		assert: node isAssignment;
		assert: node source = ':='
! !

!SmalltalkScannerTest methodsFor: 'colons' stamp: 'KenD 28/Jun/2026 13:27:41'!
testColon2
	| node |
	scanner on: '::'.
	node := scanner next.
	self
		assert: node class = SStringToken;
		assert: node source = '::'
! !

!SmalltalkScannerTest methodsFor: 'comments' stamp: 'KenD 28/Jun/2026 13:27:41'!
testComment
	| node |
	scanner on: '"comment"a'.
	node := scanner next.
	self
		assert: node isComment;
		assert: node value = 'comment';
		assert: node source = '"comment"'.
	scanner on: '"comment"'.
	node := scanner next.
	self
		assert: node isComment;
		assert: node source = '"comment"';
		assert: node position = 1.
	scanner on: 'a"comment"'.
	node := scanner next.
	self
		assert: node isNameToken;
		assert: node value = 'a';
		assert: node source = 'a'.
	node := scanner next.
	self
		assert: node isComment;
		assert: node position = ('a' size + 1)
! !

!SmalltalkScannerTest methodsFor: 'identifiers' stamp: 'KenD 28/Jun/2026 13:27:41'!
testIdentifier
	| node |
	scanner on: 'a'.
	node := scanner next.
	self
		assert: node isNameToken;
		assert: node value = 'a';
		assert: node source = 'a'.
	scanner on: ' a1'.
	node := scanner next.
	self
		assert: node isNameToken;
		assert: node value = 'a1';
		assert: node source = 'a1'.
	scanner on: '_a'.
	node := scanner next.
	self
		assert: node isNameToken;
		assert: node value = '_a';
		assert: node source = '_a'.
	scanner on: 'a_1b'.
	node := scanner next.
	self
		assert: node isNameToken;
		assert: node value = 'a_1b';
		assert: node source = 'a_1b'
! !

!SmalltalkScannerTest methodsFor: 'identifiers' stamp: 'KenD 28/Jun/2026 13:27:41'!
testKeyword
	| node node2 |
	scanner on: 'a:'.
	node := scanner next.
	self
		assert: node isKeyword;
		assert: node value = 'a:';
		assert: node source = 'a:'.
	scanner on: 'ab:cd:'.
	node := scanner next.
	node2 := scanner next.
	self
		assert: node isKeyword;
		assert: node value = 'ab:';
		assert: node source = 'ab:';
		assert: node2 isKeyword;
		assert: node2 value = 'cd:';
		assert: node2 source = 'cd:'
! !

!SmalltalkScannerTest methodsFor: 'unicode' stamp: 'KenD 28/Jun/2026 13:27:41'!
testUnicodeScanning
	"#knownIssue: depends on Character class>>value: path that resolves UnicodeLibrary,
	 which is not yet defined in the egg Kernel. Re-enable once UnicodeLibrary is ported."
	| next three tensor |
	#knownIssue.
	self assert: false.
	scanner on: '3 + 4' asWideString.
	self assert: scanner next value = 3.
	next := scanner next.
	self
		assert: next value == #'+';
		assert: scanner next value = 4.
	scanner on: '3' asWideString , 8855 asCharacter asString , '4' asWideString.
	three := scanner next.
	self assert: three value = 3.
	tensor := scanner next.
	self assert: tensor value = 8855 asCharacter asString asSymbol
! !

!LMRProtoObject methodsFor: 'lookup' stamp: 'KenD 28/Jun/2026 13:27:38'!
_cachedLookup: aSymbol
	^self _cachedLookup: aSymbol in: self behavior
! !

!LMRProtoObject methodsFor: 'lookup' stamp: 'KenD 28/Jun/2026 13:27:38'!
_cachedLookup: aSymbol in: behavior
	^GlobalDispatchCache current lookupAndCache: aSymbol in: behavior
! !

!LMRProtoObject methodsFor: 'lookup' stamp: 'KenD 28/Jun/2026 13:27:38'!
_invoke: aNativeCode
	"
	senders of _invoke: MUST have at least 1 temporary. The argument of
	_invoke: is removed twice: once here and once again after returning from
	_invoke. If no temps are present, the second pop smashes the compiled
	method of the frame, which happens to be in the top of the stack. This
	would only be noticed by random crashes when executing debuggable
	methods (because they send a message after _invoke: and before returning)
	"
	^self _transferControlDiscardingLastArgTo: aNativeCode
! !

!LMRProtoObject methodsFor: 'lookup' stamp: 'KenD 28/Jun/2026 13:27:38'!
_lookup: aSymbol
	^self _lookup: aSymbol in: self behavior
! !

!LMRProtoObject methodsFor: 'lookup' stamp: 'KenD 28/Jun/2026 13:27:38'!
_lookup: aSymbol in: behavior
	| methods cm next |
	methods := behavior _basicAt: 2.
	cm := self _lookup: aSymbol inDictionary: methods.
	cm == nil ifFalse: [^cm].
	next := behavior _basicAt: 3.
	^next == nil ifFalse: [self _lookup: aSymbol in: next]
! !

!LMRProtoObject methodsFor: 'lookup' stamp: 'KenD 28/Jun/2026 13:27:38'!
_lookup: aSymbol inDictionary: methodDictionary
	| table |
	table := methodDictionary _basicAt: 2.
	2
		to: table _size
		by: 2
		do: [:j | (table _basicAt: j) == aSymbol ifTrue: [^table _basicAt: j + 1]].
	^nil
! !

!LMRProtoObject methodsFor: 'lookup' stamp: 'KenD 28/Jun/2026 13:27:38'!
lookupAndInvoke: aSymbol
	| cm |
	cm := self _cachedLookup: aSymbol.
	cm == nil ifTrue: [^self doesNotUnderstandSelector: aSymbol].
	cm prepareForExecution.
	self _transferControlDiscardingLastArgTo: cm validNativeCodeAddress _asNative
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_flagsMask: mask
	self _basicFlags: (self _basicFlags bitAnd: mask)
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_flagsSet: mask
	self _basicFlags: (self _basicFlags bitOr: mask)
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_hasBeenSeen
	^(self _basicFlags bitAnd: HasBeenSeen) == HasBeenSeen
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_hasNamedSlots
	^(self _basicFlags bitAnd: IsNamed) = IsNamed
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_headerSizeInBytes
	^self _isSmall ifTrue: [8] ifFalse: [16]
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_isArrayed
	^false == self _isFixed
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_isBytes
	^(self _basicFlags bitAnd: IsBytes) = IsBytes
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_isFixed
	^(self _basicFlags bitAnd: IsArrayed) == 0
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_isLarge
	^(self _basicFlags bitAnd: IsSmall) == 0
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_isProxy
	^self _hasBeenSeen
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_isRemembered
	^(self _basicFlags bitAnd: IsRemembered) = IsRemembered
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_isSecondGeneration
	^(self _basicFlags bitAnd: IsSecondGeneration) = IsSecondGeneration
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_isSmall
	^(self _basicFlags bitAnd: IsSmall) = IsSmall
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_isSpecial
	^(self _basicFlags bitAnd: IsSpecial) = IsSpecial
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_largeSize: size
	self _basicULongAt: _ExtendedSize put: size _asNative
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_makeExtendedSize: size
	self
		_beLarge;
		_smallSize: 4;
		_largeSize: size;
		_basicULongAt: _Reserved put: 0 _asNative
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_nextBasePointer
	^self _asPointer + self _sizeInBytes _asPointer
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_objectFromBasePointer
	| offset |
	offset := (self _asObject _byteAt: 4) > 127 ifTrue: [8] ifFalse: [16].
	^(self + offset _asPointer) _asObject
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_pointersSize
	^self _isBytes ifTrue: [0] ifFalse: [self _size]
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_sizeInBytes
	| total |
	total := self _size.
	^self _isBytes
		ifTrue: [total + WordSize - 1 bitAnd: 0 - WordSize]
		ifFalse: [total * WordSize]
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_strongPointersSize
	^(self _isBytes or: [self _isSpecial]) ifTrue: [0] ifFalse: [0 + self _size]
! !

!LMRProtoObject methodsFor: 'header access' stamp: 'KenD 28/Jun/2026 13:27:38'!
initializeExtended: aBoolean contentSize: size
	self _basicULongAt: -1 put: 0 _asNative.
	aBoolean
		ifTrue: [
			self
				_smallSize: 4;
				_basicULongAt: _ExtendedSize put: size _asNative;
				_basicULongAt: _Reserved put: 0 _asNative]
		ifFalse: [self _smallSize: size; _beSmall]
! !

!LMRProtoObject methodsFor: 'underprimitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
_highHalf
	^self _oop bitShift: WordSize * 8 // -2
! !

!LMRProtoObject methodsFor: 'underprimitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
_low32
	^WordSize > 4 ifTrue: [self bitAnd: 0xFFFFFFFF] ifFalse: [self]
! !

!LMRProtoObject methodsFor: 'underprimitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
_lowHalf
	^self _oop bitAnd: 16rFFFF
! !

!LMRProtoObject methodsFor: 'underprimitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
_oop
	^self _asPointer * 2
! !

!LMRProtoObject methodsFor: 'underprimitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
smallOop
	^self _asPointer
! !

!LMRProtoObject methodsFor: 'raw access' stamp: 'KenD 28/Jun/2026 13:27:38'!
_uLongAtValidOffset: offset put: anInteger
	anInteger size > 4 ifTrue: [self error: 'does not fit in 32 bits'].
	self _primitiveULongAtOffset: offset put: anInteger.
	^anInteger
! !

!LMRProtoObject methodsFor: 'unwinding' stamp: 'KenD 28/Jun/2026 13:27:38'!
_returnTo: aBeeFrame
	[#forceEnvironment].
	aBeeFrame _beCurrent.
	^self
! !

!LMRProtoObject methodsFor: 'system' stamp: 'KenD 28/Jun/2026 13:27:38'!
allReferences
	^Memory current collectAndCompactOldSpace; referencesTo: self
! !

!LMRProtoObject methodsFor: 'system' stamp: 'KenD 28/Jun/2026 13:27:38'!
perform: aSymbol withArguments: anArray
	| size |
	size := anArray basicSize.
	aSymbol arity = size ifFalse: [^self error: 'incorrect arity'].
	anArray _expandInStackSized: size.
	^self lookupAndInvoke: aSymbol
! !

!LMRProtoObject methodsFor: 'services' stamp: 'KenD 28/Jun/2026 13:27:38'!
become: anotherObject
	Memory current make: self become: anotherObject
! !

!LMRProtoObject methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
doesNotUnderstandSelector: selector
	| arguments message |
	arguments := StackFrameCursor top moveNext
		argumentsWithArity: selector arity.
	message := Message receiver: self selector: selector arguments: arguments.
	^self doesNotUnderstand: message
! !

!LMRProtoObject methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
holdRefererIfNeeded: referent
	| memory |
	#savePreviousSelf.
	self _isSmallInteger ifTrue: [^self].
	referent _isRemembered ifTrue: [^self].
	memory := Memory current.
	(memory isYoungSafe: referent)
		ifFalse: [(memory isYoungSafe: self) ifTrue: [memory remember: referent]]
! !

!LMRProtoObject methodsFor: 'private' stamp: 'KenD 28/Jun/2026 13:27:38'!
shouldBeInRememberedSet
	| m |
	m := Memory current.
	(m isYoung: self) ifTrue: [^false].
	(m isYoung: self behavior) ifTrue: [^true].
	1 to: self _pointersSize do: [:index | | ivar |
		ivar := self _basicAt: index.
		ivar _isSmallInteger ifFalse: [(m isYoung: ivar) ifTrue: [^true]]].
	^false
! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
allocate: byteSize size: size
	| headerSize totalSize buffer object extended |
	extended := size > 255.
	headerSize := extended ifTrue: [16] ifFalse: [8].
	totalSize := headerSize + byteSize.
	buffer := self memory allocate: totalSize.
	object := (buffer + headerSize _asPointer) _asObject.
	object
		_basicULongAt: _Behavior put: self instanceBehavior;
		initializeExtended: extended contentSize: size.
	^object
! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicNew
	^self _instancesAreArrayed
		ifTrue: [self primitiveNew: 0]
		ifFalse: [self primitiveNew]! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
basicNew: anInteger
	^self primitiveNew: anInteger
! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
memory
	^Memory current
! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
new
	^self _instancesAreArrayed
		ifTrue: [self primitiveNew: 0]
		ifFalse: [self primitiveNew]
! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
new: anInteger
	^self primitiveNew: anInteger
! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
primitiveNew
	^self memory newPointers: instanceBehavior size: self instSize
! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
primitiveNew: size
	size _isSmallInteger ifFalse: [self error: 'invalid size'].
	self _instancesAreArrayed ifFalse: [self errorNotIndexable].
	^self _instancesHavePointers
		ifTrue: [self primitiveNewPointers: size + self instSize]
		ifFalse: [self primitiveNewBytes: size]
! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
primitiveNewBytes: size
	^self memory newArrayedBytes: instanceBehavior size: size
! !

!LMRSpecies methodsFor: 'Primitives' stamp: 'KenD 28/Jun/2026 13:27:38'!
primitiveNewPointers: size
	^self memory
		newArrayedPointers: instanceBehavior
		size: size
		named: self instSize > 0
! !

!LMRSpecies methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
nil: size slotsOf: object
	object _nilSlots: size
! !

!LMRSpecies methodsFor: 'instance creation' stamp: 'KenD 28/Jun/2026 13:27:38'!
zero: size bytesOf: object
	object _zeroSlots: (size bitShift: 0 - WordSizeShift)
! !
SFFIDescriptor initialize!
