"
Copyright (c) 2024 Quorum Software.
	See (MIT) license in root directory.
"
Class {
	#name : 'MetaclassSpec',
	#superclass : 'SpeciesSpec',
	#instVars : [
		'class'
	],
	#category : 'Powerlang-Core-CodeSpecs',
	#package : 'Powerlang-Core',
	#tag : 'CodeSpecs'
}

{ #category : 'inquiries' }
MetaclassSpec >> allInstVarNames [
	"unlike in ProtoObject class, the superclass of the spec of ProtoObject class is nil"
	allIvars ifNotNil: [ ^ allIvars ].
	^ allIvars := module classInstVarNames
	              ,
		              (self withAllSuperclasses reversed gather: [ :c | 
			               c instVarNames ]) asArray
]

{ #category : 'enumerating' }
MetaclassSpec >> allSuperclassesDo: aBlock [
	| s c |
	class supername isNil ifTrue: [
		c := module resolveClass: 'Class'.
		c ifNil: [c := Class].
		c allSuperclassesDo: aBlock].
	s := self superclass.
	s isNil ifTrue: [^self].
	aBlock value: s.
	s allSuperclassesDo: aBlock
]

{ #category : 'testing' }
MetaclassSpec >> asWebsideJson [

	^ super asWebsideJson
		  at: #class put: 'Metaclass';
		  yourself
]

{ #category : 'inquiries' }
MetaclassSpec >> classVarNames [
	^class classVarNames
]

{ #category : 'inquiries' }
MetaclassSpec >> classVars [

	^ class classVars
]

{ #category : 'testing' }
MetaclassSpec >> instSize [

	^ instSize ifNil: [ 
		  instSize := self allInstVarNames size ]
]

{ #category : 'accessing' }
MetaclassSpec >> instanceClass [
	^class
]

{ #category : 'accessing' }
MetaclassSpec >> instanceClass: aClassSpec [
	class := aClassSpec
]

{ #category : 'inquiries' }
MetaclassSpec >> isBytes [

	^ self isPointers not
]

{ #category : 'testing' }
MetaclassSpec >> isMetaclass [
	^true
]

{ #category : 'inquiries' }
MetaclassSpec >> isPointers [
	^true
]

{ #category : 'inquiries' }
MetaclassSpec >> isVariable [

	^ false
]

{ #category : 'inquiries' }
MetaclassSpec >> metaMethods [
	^#()
]

{ #category : 'inquiries' }
MetaclassSpec >> name [
	^class name , ' class'
]

{ #category : 'inquiries' }
MetaclassSpec >> sharedPools [
	^class sharedPools
]

{ #category : 'inquiries' }
MetaclassSpec >> superclass [
	^class superclass ifNotNil: [:c | c metaclass]
]

{ #category : 'inquiries' }
MetaclassSpec >> supername [
	^self superclass name
]
