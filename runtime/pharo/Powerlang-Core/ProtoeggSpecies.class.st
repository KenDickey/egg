Class {
	#name : #ProtoeggSpecies,
	#superclass : #ProtoeggSlotObject,
	#instVars : [
		'instanceSpec',
		'slotNames'
	],
	#category : #'Powerlang-Core-Execution-Bootstrap-Ring'
}

{ #category : #'instance creation' }
ProtoeggSpecies class >> classFor: anRGBehavior [
	^self
]

{ #category : #accessing }
ProtoeggSpecies >> allInstVarNames [
	^self subclassResponsibility
]

{ #category : #accessing }
ProtoeggSpecies >> allSlotNames [
	^ slotNames ifNil: [ self computeAllSlotNames ]
]

{ #category : #accessing }
ProtoeggSpecies >> instanceSpec [
	^instanceSpec
]

{ #category : #accessing }
ProtoeggSpecies >> instanceSpec: anRGBehavior [
	instanceSpec := anRGBehavior
]

{ #category : #accessing }
ProtoeggSpecies >> storeCvar: aSymbol with: anObject [
	| species namespaces |
	species := self. 
	[ namespaces := species namespaces.
	namespaces slotsDo: [ :namespace |
	(namespace includesKey: aSymbol)
		ifTrue: [ ^ namespace at: aSymbol put: anObject ]].
	species := species superclass.
	species isNil 
	] whileFalse.
	^ nil


]

{ #category : #accessing }
ProtoeggSpecies >> storeNamed: aSymbol with: anObjectMap [
	(self storeCvar: aSymbol with: anObjectMap) ifNotNil: [ :value | ^ value ].
	^ self module namespace
		at: aSymbol
		put: anObjectMap
]

{ #category : #accessing }
ProtoeggSpecies >> superclass [
	^ self slotNamed: #superclass
]

{ #category : #accessing }
ProtoeggSpecies >> superclass: aSpeciesMap [
	^ self slotNamed: #superclass put: aSpeciesMap
]
