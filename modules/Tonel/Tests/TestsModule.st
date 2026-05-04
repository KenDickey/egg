"
	Copyright (c) 2026, Javier Pimás.
	See (MIT) license in root directory.
"

Class {
	#name : #TestsModule,
	#superclass : #Module,
	#category : #'Tonel.Tests'
}

{ #category : #spec }
TestsModule >> imports [
	^{
		#Kernel -> #(OrderedDictionary Error).
		#Tonel -> #(TonelWriter TonelReader).
		#SUnit -> #(TestCase TestSuite TestResult TestFailure)
	}
]

{ #category : #main }
TestsModule >> main: anArray [
	| result |
	Kernel log: 'Running ', self name, ' tests...'; log: String cr.
	result := (TestSuite forModule: self) run.
	Kernel
		log: 'Done: ', result passedCount printString, ' passed, ',
			(result failureCount + result errorCount) printString, ' failed.';
		log: String cr
]
