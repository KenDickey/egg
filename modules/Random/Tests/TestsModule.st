"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #TestsModule,
	#superclass : #Module,
	#category : #'Random.Tests'
}

{ #category : #spec }
TestsModule >> imports [
	^{
		#Kernel -> #(Float).
		#Random -> #(Random).
		#SUnit -> #(TestCase TestResult)
	}
]

{ #category : #main }
TestsModule >> main: anArray [
	| suite result |
	Kernel log: 'Running Random tests...
'.
	suite := RandomTest buildTestSuite.
	Kernel log: 'suite built with ', suite tests size printString, ' tests
'.
	result := suite run.
	Kernel log: 'Done.
'.
	Kernel log: result printString.
	Kernel log: '
'
]
