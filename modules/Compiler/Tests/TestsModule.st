"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #TestsModule,
	#superclass : #Module,
	#category : #'Compiler.Tests'
}

{ #category : #spec }
TestsModule >> imports [
	^{
		#Kernel -> #(Array Error Exception OrderedCollection UndefinedObject WideString WideSymbol).
		#Compiler -> #(SCompiler SCompilationError SMethodNode SSelectorNode SMessageNode SStringToken InlinedArgEnvironment MethodScope).
		#SUnit -> #(TestCase TestResult TestSuite)
	}
]

{ #category : #main }
TestsModule >> main: anArray [
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
]
