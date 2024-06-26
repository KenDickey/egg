Class {
	#name : #EggRingImage,
	#superclass : #EggRingModule,
	#instVars : [
		'bootstrapDicts',
		'arraySpec',
		'closureSpec',
		'smiSpec',
		'symbolSpec',
		'wordSize',
		'minSMI',
		'maxSMI'
	],
	#category : #'Powerlang-Core-Execution-Bootstrap-Ring'
}

{ #category : #'own services' }
EggRingImage >> bootstrap [
	runtime
		sendLocal: #bootstrap to: module;
		removeBootstrapDictionaryOverrides
]

{ #category : #'own services' }
EggRingImage >> bootstrapDictionaries [
	^bootstrapDicts
]

{ #category : #'own services' }
EggRingImage >> builder [
	^	Ring2MetacircularConverter new image: self.
]

{ #category : #accessing }
EggRingImage >> createBootstrapNamespace [
	| namespace |
	namespace := self newBootstrapDictionaryOf: self => #Namespace.
	module namespace: namespace.
	namespace
		at: #WordSize put: wordSize;
		at: #LastHash put: 1.
	classes do: [ :c | namespace at: c name asSymbol put: c ]
]

{ #category : #accessing }
EggRingImage >> createClassNamespaces: spec [
	| names cvars array |
	names := spec classVariables.
	names isEmpty
		ifTrue: [ ^ self newArraySized: 0 ].
	cvars := self newBootstrapDictionaryOf: self => #Namespace.
	names do: [ :rgVar | cvars at: rgVar name put: nilObj ].
	array := self newArraySized: 1.
	array at: 1 put: cvars.
	^ array
]

{ #category : #building }
EggRingImage >> genesis [
	"
	Create the world (should take less than 6 days). This is named 'genesis' to remind us those who had
	done this (and much more) before us. Namely SELF people. I (JV) would like to use this opportunity and point you to
	
	https://github.com/russellallen/self/blob/2bcf2c4cab23f52bf68ac4f617020e748699a548/vm/src/any/memory/universe.cpp#L79
	"

	nilObj := self basicNewSlots: #UndefinedObject.
	trueObj := self basicNewSlots: #True.
	falseObj := self basicNewSlots: #False.
	module := self basicNewSlots: #KernelModule.
	super genesis.
	self createBootstrapNamespace.
	runtime := EggRingRuntime new.
	runtime image: self
]

{ #category : #accessing }
EggRingImage >> initialize [
	super initialize.
	bootstrapDicts := OrderedCollection new.
	kernel := self
]

{ #category : #building }
EggRingImage >> kernel [
	^module
]

{ #category : #initialization }
EggRingImage >> newArraySized: anInteger [
^self basicNewSlotsOf: arraySpec sized: anInteger.

]

{ #category : #initialization }
EggRingImage >> newAssociation: anAssociation [
	| assoc key value |
	assoc := self newSlots: 'Association'.
	key := self transferLiteralDeep: anAssociation key.
	value := self transferLiteralDeep: anAssociation value.
	^ assoc
		key: key;
		value: value; yourself
]

{ #category : #accessing }
EggRingImage >> newBootstrapDictionaryOf: anRGBehavior [
	"
	Allocate a bootstrap dictionary object. Its contents is managed by the
	mother image, but in the baby smalltalk can do	at: and at:put:, via primitives.
	It is used to replace PoolDictionaries and Namespaces until the baby has been
	initialized and is ready to become a fully working image. At that point, the
	BootstrapDictionaries are converted to the corresponding types and discarded.
	"

	| result |
	result := ProtoeggBootstrapDictionary new
		initializeAs: self => #BootstrapDictionary.
	bootstrapDicts add: result.
	^ result
		realSpec: anRGBehavior;
		image: self
]

{ #category : #accessing }
EggRingImage >> newClosure: anInteger [
	^ ProtoeggClosure new: closureSpec size: anInteger withAll: nilObj
]

{ #category : #accessing }
EggRingImage >> newFloatFrom: aFloat [
	^ self newBytes: 'Float' contents: aFloat pointerDouble
]

{ #category : #initialization }
EggRingImage >> newInteger: anInteger [
	anInteger > maxSMI
		ifTrue: [ ^ self newLargePositiveInteger: anInteger ].
	anInteger < minSMI
		ifTrue: [ ^ self newLargeNegativeInteger: anInteger ].
	^ ProtoeggSmallInteger new: smiSpec valued: anInteger
]

{ #category : #initialization }
EggRingImage >> newLargeNegativeInteger: anInteger [
	| size bytes byte |
	size := (anInteger bytesCount alignedTo: 2) max: wordSize.
	bytes := ByteArray new: size withAll: 16rFF.
	1 to: anInteger bytesCount do: [ :i | 
		byte := anInteger byteAt: i.
		byte > 0
			ifTrue: [ byte := 256 - byte ].
		bytes at: i put: byte ].
	^ self newBytes: #LargeNegativeInteger contents: bytes
]

{ #category : #initialization }
EggRingImage >> newLargePositiveInteger: anInteger [
	| size bytes |
	size := (anInteger bytesCount alignedTo: 2) max: wordSize.
	bytes := anInteger asByteArrayOfSize: size.
	^ self newBytes: #LargePositiveInteger contents: bytes reversed
]

{ #category : #initialization }
EggRingImage >> newString: aString [
	| bytes |
	bytes := aString copyWith: Character null.
	^self newBytes: 'String' contents: bytes
]

{ #category : #initialization }
EggRingImage >> newStringArray: strings [
	| array bytes |
	array := self newSlots: 'Array' sized: strings size.
	strings
		withIndexDo: [ :s :i |
			bytes := self newString: s.
			array at: i put: bytes ].
	^ array
]

{ #category : #accessing }
EggRingImage >> newSymbol: aSymbol [
	| new |
	identityMap at: aSymbol ifPresent: [ :s | ^ s ].
	new := ProtoeggSymbol new: symbolSpec symbol: aSymbol.
	symbols add: new.
	^ identityMap at: aSymbol put: new
]

{ #category : #accessing }
EggRingImage >> specs: anRGEnvironment [
	super specs: anRGEnvironment.
	closureSpec := self => #Closure.
	arraySpec := self => #Array.
	smiSpec := self => #SmallInteger.
	symbolSpec := self => #Symbol
]

{ #category : #accessing }
EggRingImage >> transferBlock: anSCompiledBlock [
	| transferred method format |
	identityMap at: anSCompiledBlock
		ifPresent: [ :b | ^ b ].
	transferred := self newSlots: #CompiledBlock.
	identityMap at: anSCompiledBlock put: transferred.
	method := identityMap at: anSCompiledBlock method.
	format := self newInteger: anSCompiledBlock format.
	transferred
		method: method;
		format: format;
		optimizedCode: nilObj.
	^ transferred
]

{ #category : #accessing }
EggRingImage >> transferCharacter: aCharacter [
	| class bytechars value transferred int |
	identityMap at: aCharacter ifPresent: [ :c | ^ c ].
	class := self classNamed: #Character.
	bytechars := class namespaces slots first at: #ByteCharacters.
	value := aCharacter asInteger.
	transferred := bytechars slots
		at: value + 1
		ifAbsent: [ int := self newInteger: value.
			(self newSlots: 'Character') value: int ].
	identityMap at: aCharacter put: transferred.
	^ transferred
]

{ #category : #initialization }
EggRingImage >> transferMethod: anSCompiledMethod in: species [

	| size classname transferred astcodes selector format literal tliteral source |
	(identityMap includesKey: anSCompiledMethod) ifTrue: [ 
		self ASSERT: false ].
	size := anSCompiledMethod size.
	classname := anSCompiledMethod isCallback
		             ifTrue: [ 'CallbackMethod' ]
		             ifFalse: [ 'CompiledMethod' ].
	transferred := self newSlots: classname sized: size.
	identityMap at: anSCompiledMethod put: transferred.
	astcodes := self transferLiteralDeep: anSCompiledMethod astcodes.
	selector := self newSymbol: anSCompiledMethod selector.
	format := self newInteger: anSCompiledMethod format.
	source := self newString: anSCompiledMethod source.
	transferred
		astcodes: astcodes;
		class: species;
		selector: selector;
		format: format;
		source: source.
	1 to: size do: [ :i | 
		literal := anSCompiledMethod at: i.
		tliteral := self transferLiteralDeep: literal.
		transferred at: i put: tliteral ].
	^ transferred
]

{ #category : #accessing }
EggRingImage >> wordSize [
	^ wordSize
]

{ #category : #accessing }
EggRingImage >> wordSize: anInteger [
	wordSize := anInteger.
	maxSMI := (1 bitShift: wordSize * 8 - 2) - 1.
	minSMI := maxSMI negated - 1

]
