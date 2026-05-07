"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #TestsModule,
	#superclass : #Module,
	#category : #'TOML.Tests'
}

{ #category : #spec }
TestsModule >> imports [
	^{
		#Kernel -> #(Error OrderedDictionary).
		#TOML -> #(TOMLParser).
		#SUnit -> #(TestCase TestResult)
	}
]

{ #category : #main }
TestsModule >> main: anArray [
	| suite result |
	Kernel log: 'Running TOML tests...
'.
	suite := TOMLParserTest buildTestSuite.
	Kernel log: 'suite built with ', suite tests size printString, ' tests
'.
	result := suite run.
	Kernel log: 'Done.
'.
	Kernel log: result printString.
	Kernel log: '
'
]
