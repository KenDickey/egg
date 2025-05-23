Class {
	#name : 'EggMetacircularRuntimeTest',
	#superclass : 'TestCase',
	#instVars : [
		'runtime'
	],
	#category : 'Powerlang-Tests-Bootstrap',
	#package : 'Powerlang-Tests',
	#tag : 'Bootstrap'
}

{ #category : 'accessing' }
EggMetacircularRuntimeTest class >> defaultTimeLimit [
	^ 100 seconds
]

{ #category : 'accessing' }
EggMetacircularRuntimeTest class >> resources [
	^ Array with: EggMetacircularRuntimeTestResource
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> ==> anObject [
	| class |
	class := anObject class.
	anObject isInteger
		ifTrue: [ ^ runtime newInteger: anObject ].
	anObject == nil
		ifTrue: [ ^ runtime nil ].
	anObject == false
		ifTrue: [ ^ runtime false ].
	anObject == true
		ifTrue: [ ^ runtime true ].
	(class == Symbol or: [ class inheritsFrom: Symbol ])
		ifTrue: [ ^ runtime symbolFromLocal: anObject ].
	anObject isString
		ifTrue: [ ^ runtime newString: anObject ].
	class = ByteArray
		ifTrue: [ ^ runtime newBytesFrom: anObject ].
	self ASSERT: false
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> assertNoLeftoverFrames [
	self assert: runtime interpreter hasFinished
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> compile: aString in: classname during: aBlock [

	| class behavior md selector method |
	class := self globalNamed: classname.
	behavior := runtime speciesInstanceBehavior: class.
	md := runtime behaviorMethodDictionary: behavior.
	method := SCompiler new compile: aString.
	self assert: method notNil.
	method := self convertMethod: method.
	selector := method slotAt: 5.
	runtime sendLocal: #at:put: to: md with: { 
			selector.
			method }.
	aBlock value.
	runtime sendLocal: #removeKey: to: md with: { selector }
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> convert: anObject with: map [
	map at: anObject ifPresent: [:mapped | ^mapped ].
	anObject ifNil: [ ^runtime nil ].
	anObject isInteger
		ifTrue: [ ^ runtime newInteger: anObject ].
	anObject isSymbol
		ifTrue: [ ^ runtime addSymbol: anObject ].
	anObject isString
		ifTrue: [ ^ runtime newString: anObject ].
	anObject class = ByteArray
		ifTrue: [ ^ runtime newByteArray: anObject ].
	anObject class = SCompiledBlock ifTrue: [ ^self convertBlock: anObject with: map ].
	self ASSERT: false
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> convertBlock: anSCompiledBlock with: map [
	| class result instsize slot |
	class := self globalNamed: #CompiledBlock.
	result := runtime newSlots: class size: 0.
	map at: anSCompiledBlock put: result.
	instsize := anSCompiledBlock class instSize.
	1 to: instsize do: [ :i | 
		slot := anSCompiledBlock instVarAt: i.
		result slotAt: i put: (self convert: slot with: map) ].
	^ result
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> convertMethod: anSCompiledMethod [
	| class result map instsize slot |
	class := self globalNamed: #CompiledMethod.
	result := runtime newSlots: class size: anSCompiledMethod size.
	map := IdentityDictionary new.
	map at: anSCompiledMethod put: result.
	instsize := anSCompiledMethod class instSize.
	1 to: instsize do: [ :i | 
		slot := anSCompiledMethod instVarAt: i.
		result slotAt: i put: (self convert: slot with: map) ].
	1 to: anSCompiledMethod size
		do: [ :i | 
			slot := anSCompiledMethod at: i.
			result slotAt: i + instsize put: (self convert: slot with: map) ].
	^ result
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> globalNamed: aSymbol [
	| symbol namespace assoc |
	symbol := runtime symbolFromLocal: aSymbol.
	namespace := runtime moduleNamespace: runtime kernel.
	assoc := runtime lookupAssociationFor: symbol in: namespace.
	^runtime loadAssociationValue: assoc
]

{ #category : 'running' }
EggMetacircularRuntimeTest >> setUp [
	runtime := EggMetacircularRuntimeTestResource current runtime
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test100yourself [
	| result |
	result := runtime sendLocal: #yourself to: runtime nil.
	self assert: result equals: runtime nil
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test110compute1plus1 [
	| one result |
	one := self ==> 1.
	result := runtime sendLocal: #+ to: one with: {one}.
	self assert: result equals: self ==> 2; assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test111compute1minus1 [
	| one result |
	one := self ==> 1.
	result := runtime sendLocal: #- to: one with: {one}.
	self assert: result equals: self ==> 0
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test112compute3times4 [
	| result |
	result := runtime sendLocal: #* to: self ==> 3 with: {self ==> 4}.
	self assert: result equals: self ==> 12
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test113compute20quotient5 [
	|  result |

	result := runtime sendLocal: #// to: self ==>20 with: {self ==>5}.
	self assert: result equals: self ==>4
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test130sendIfTrueToFalse [
	| result |
	self
		compile: 'foo ^false ifTrue: [#failed]'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: runtime nil ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test131sendIfFalseToTrue [
	| result |
	self
		compile: 'foo ^true ifFalse: [#failed]'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: runtime nil ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test132sendIfTrueToTrue [
	| result |
	self
		compile: 'foo ^true ifTrue: [5]'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 5 ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test139sendIfNotNilWithArg [
	| result |
	self
		compile: 'foo12 ^5 ifNotNil: [:a | a isString ifFalse: [a]]'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo12 to: runtime true.
			self assert: result equals: self ==> 5 ].
	self assertNoLeftoverFrames

]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test139sendIfNotNilWithArgNonEvaluable [
	| result |
	self
		compile: 'foo12 ^5 ifNotNil: [:a | a isString ifFalse: a]'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo12 to: runtime true.
			self assert: result equals: self ==> 5 ].
	self assertNoLeftoverFrames

]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test139strangeCase [
	| result |
	self
		compile: 'foo12
			^1 ifNotNil: [:token | true ifTrue: [token] ifFalse: token]'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo12 to: runtime true.
			self assert: result equals: self ==> 1 ].
	self assertNoLeftoverFrames

]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test140evaluateClosure [
	| result |
	self
		compile: 'foo ^[5] value'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 5 ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test141evaluateClosureFrames [
	| result |
	self
		compile: 'foo [5] value'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: runtime true ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test150sendWhileTrue [
	| result |
	self
		compile:
			'foo
			 | a |
			a := true.
			[a] whileTrue: [a := false].
			^a'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: runtime false ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test151sendToDo [
	| result |
	self
		compile:
			'foo
			 | a |
			a := 0.
			3 to: 4 do: [:i | a := a + i].
			^a'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 7 ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test152compute20dividedBy5 [
	| result |
	result := runtime sendLocal: #/ to: self ==> 20 with: {(self ==> 5)}.
	self 
		assert: result equals: self ==> 4;
		assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test153sendTimesRepeat [
	| result |
	self
		compile:
			'foo
			 | a |
			a := 0.
			1 timesRepeat: [a := a + 1].
			^a'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 1 ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test154sendTimesRepeatInsideBlock [
	| result |
	self
		compile:
			'foo
			 | a b c d e |
			a := 0.
			[1 timesRepeat: [a := a + 1]] value.
			^a'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 1 ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test161evaluateClosureWithArgs [
	| result |
	self
		compile: 'foo ^[:a :b | a + b] value: 3 value: 4'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 7 ]
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test162evaluateClosureWithArgsAndTemps [
	| result |
	self
		compile: 'foo ^[:a :b | | t | t := a + b. t] value: 3 value: 4'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 7 ]
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test163evaluateClosureWithArgsAndMethodTemps [
	| result |
	self
		compile: 'foo | t | ^[:a :b | t := a + b. t] value: 3 value: 4'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 7 ]
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test164evaluateClosureWithArgsAndMultipleTemps [
	| result |
	self
		compile:
			'foo 
				| s |
				s := 3.
				^[:a | | t | 
					t := a.
					t := t + s.
					t] value: 4'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 7 ]
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test165evaluateClosureNonLocalReturn [
	| result |
	self
		compile:
			'foo 
				| s |
				[s := 3. ^s] value.
				s := 4.
				^s'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 3 ]
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test166evaluateNestedClosure [
	| result |
	self
		compile: 'foo ^[ [ 7 ] value ] value'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 7 ]
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test167evaluateNestedClosureWithArgs [
	| result |
	self
		compile: 'foo ^[:a | [:b | a + b ] value: 4 ] value: 3'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 7 ]
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test168evaluateNestedClosureWithTemps [
	| result |
	self
		compile:
			'foo 
			| a |
			a := 2.
			^[ | b |
				b := 3.
				[ | c |
				c := 4.
				a + b + c ] value] value'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 9 ]
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test169evaluateInlinedClosureInClosureWithMethodTemps [
	| result |
	self
		compile:
			'foo 
			| a result |
			a := 3.
			[ true ifTrue: [ result := a + 4 ] ] value.
			^result'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result equals: self ==> 7 ]
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test180evaluateToDo [
	| result |
	self
		compile:
			'foo | result | result := 0. 1 to: 5 do: [:i | result := result + i]. ^result'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self
				assert: result isImmediate;
				assert: result value equals: 1 + 2 + 3 + 4 + 5 ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test190evaluateStringConcatenation [
	| result |
	self
		compile: 'foo ^''ABC'', ''DE'''
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self assert: result asLocalString equals: 'ABCDE' ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test200createDictionary [
	| class d |
	class := self globalNamed: #Dictionary.
	d := runtime sendLocal: #new to: class with: {}.
	self
		assert: d localClassName equals: 'Dictionary';
		assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test210addAssociationToDictionary [
	| class symbol assoc d |
	class := self globalNamed: #Dictionary.
	symbol := runtime addSymbol: #foo.
	assoc := runtime sendLocal: #-> to: symbol with: { runtime nil }.
	d := runtime sendLocal: #new to: class with: {}.
	runtime sendLocal: #add: to: d with: {assoc}.
	self
		assert: d localClassName equals: 'Dictionary';
		assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test300smallIntegerPrintString [
	| result |
	self
		compile: 'foo | result | result := 16r1000 printString. ^result'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self
				assert: result isBytes;
				assert: result value asLocalString equals: 16r1000 printString ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test301smallIntegerPrintString [
	| result |
	self
		compile: 'foo | result | result := 4611686018427387903 printString. ^result'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self
				assert: result isBytes;
				assert: result value asLocalString equals: 4611686018427387903 printString ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test302smallIntegerPrintString [
	| result |
	self
		compile: 'foo | result | result := -4. ^result printString'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self
				assert: result isBytes;
				assert: result value asLocalString
					equals: -4 printString ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test310smiFallbackToLNI [
	| result |
	self
		compile:
			'foo | result | result := (16r100000000 * -16r100000000) printString. ^result'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			self
				assert: result isBytes;
				assert: result value asLocalString
					equals: (16r100000000 * -16r100000000) printString ].
	self assertNoLeftoverFrames
]

{ #category : 'tests' }
EggMetacircularRuntimeTest >> test310smiFallbackToLPI [
	| result expected |
	self
		compile:
			'foo | result | result := 1. 18 timesRepeat: [result := result * 10]. ^result printString'
		in: #ProtoObject
		during: [ result := runtime sendLocal: #foo to: runtime true.
			expected := 1.
			18 timesRepeat: [ expected := expected * 10 ].
			self
				assert: result isBytes;
				assert: result value asLocalString equals: expected printString ].
	self assertNoLeftoverFrames
]
