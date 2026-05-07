"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.
"

Class {
	#name : #MessageInlinerTest,
	#superclass : #TestCase,
	#category : #'Compiler.Tests'
}

{ #category : #helpers }
MessageInlinerTest >> ast: source [
	^SCompiler new parse: source
]

{ #category : #helpers }
MessageInlinerTest >> cascadeMessagesIn: source [
	| ast cascadeMessages |
	ast := self ast: source.
	cascadeMessages := OrderedCollection new.
	ast nodesDo: [:n |
		(n isMessageNode and: [n isCascadeMessage])
			ifTrue: [cascadeMessages add: n]].
	^cascadeMessages
]

{ #category : #'tests - cascade' }
MessageInlinerTest >> testCascadeAndKeywordIsNotInlined [
	"Regression: a keyword cascade message such as `at:put:` must not be inlined."
	| messages |
	messages := self cascadeMessagesIn: 'foo
		^Dictionary new at: #a put: 1; at: #b put: 2; yourself'.
	messages do: [:m | self deny: m isInlined]
]

{ #category : #'tests - cascade' }
MessageInlinerTest >> testCascadeIfTrueIsNotInlined [
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
]

{ #category : #'tests - cascade' }
MessageInlinerTest >> testCascadeWhileTrueIsNotInlined [
	"Regression: whileTrue: in a cascade must not be inlined either."
	| messages |
	messages := self cascadeMessagesIn: 'foo
		^[true] whileTrue: [^1]; yourself'.
	messages do: [:m | self deny: m isInlined]
]

{ #category : #'tests - non-cascade' }
MessageInlinerTest >> testNonCascadeIfTrueIsInlined [
	"Sanity check: outside a cascade, ifTrue: is still inlined as expected."
	| ast inlined |
	ast := self ast: 'foo
		^true ifTrue: [42]'.
	inlined := false.
	ast nodesDo: [:n |
		(n isMessageNode and: [n isInlined])
			ifTrue: [inlined := true]].
	self assert: inlined
]
