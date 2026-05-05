"
    Copyright (c) 2024, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #ProcessStack,
	#superclass : #Object,
	#instVars : [
		'process',
		'sp',
		'bp',
		'env'
	],
	#category : #Kernel
}

{ #category : #'instance creation' }
ProcessStack class >> on: aProcess [
	^self errorVMSpecific
]

{ #category : #services }
ProcessStack >> lastArgumentOf: frame [
	"
		Given the base index of a frame, then comes retaddr, then last argument passed in the invokation
	"
	^self at: frame + 2
]

{ #category : #services }
ProcessStack >> contextSwitchTo: next [
	self subclassResponsibility
]

{ #category : #services }
ProcessStack >> fillFrom: aContext [
	#CRITICAL.
	sp := aContext copyAllTo: self.
	env := aContext lastEnvironment
]

{ #category : #accessing }
ProcessStack >> env [
	^env
]

{ #category : #accessing }
ProcessStack >> env: anObject [
	env := anObject
]

{ #category : #accessing }
ProcessStack >> process [
	^process
]

{ #category : #accessing }
ProcessStack >> process: aProcess [
	process := aProcess
]


{ #category : #services }
ProcessStack >> snapshot [
	self subclassResponsibility
]