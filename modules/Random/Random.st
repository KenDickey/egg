"
    Copyright (c) 2026, Javier Pimás.
    See (MIT) license in root directory.

    Based on Random from Pharo (MIT license).
    PCG implementation: (c) 2014 M.E. O'Neill / pcg-random.org (Apache License 2.0).

    Implements a PCG XSH-RR random number generator with 64-bit internal state.
    The generator state is held in a 1-element Array (`state`) which is mutated
    in place by `primitiveRandomNumber:`. The `seed` ivar tracks the current
    state value (updated before each step in `privateNextValue`), so that
    `seed` reflects the generator's evolving position rather than just
    the initial seed. Sending `seed:` resets both the `seed` ivar and
    the internal state (via `setStateFromSeed`), allowing save/restore
    of the generator's position.
"

Class {
	#name : #Random,
	#superclass : #Object,
	#instVars : [
		'state',
		'seed'
	],
	#category : #Random
}

{ #category : #'instance creation' }
Random class >> new [
	^super new useClockBasedSeed
]

{ #category : #'instance creation' }
Random class >> seed: anInteger [
	^super new seed: anInteger
]

{ #category : #private }
Random class >> primitiveRandomNumber: aState [
	"Answer a random integer in the interval [0, 16r7FFFFFFF].
	 Implements the PCG XSH-RR algorithm on the 64-bit state."
	| returnValue count xorshifted |
	returnValue := aState first.
	count := returnValue bitShiftRight: 59.
	aState
		at: 1
		put: (returnValue * 6364136223846793005
			+ 1442695040888963407
			bitAnd: 16rFFFFFFFFFFFFFFFF).
	returnValue := (returnValue bitShiftRight: 18) bitXor: returnValue.
	xorshifted := (returnValue bitShiftRight: 27) bitAnd: 16rFFFFFFFF.
	^((xorshifted bitShiftRight: count)
		bitOr: (xorshifted bitShift: (count negated bitAnd: 31)))
		bitAnd: 16r7FFFFFFF
]

{ #category : #accessing }
Random >> maxValue [
	^16r7FFFFFFF
]

{ #category : #accessing }
Random >> next [
	"Answer a random Float in the interval [0 to 1)."
	^self privateNextValue asFloat / (self maxValue + 1)
]

{ #category : #accessing }
Random >> next: anInteger [
	^self next: anInteger into: (Array new: anInteger)
]

{ #category : #accessing }
Random >> next: anInteger into: anArray [
	1 to: anInteger do: [:index | anArray at: index put: self next].
	^anArray
]

{ #category : #accessing }
Random >> nextBetween: lowerBound and: higherBound [
	"Answer a random float number from the range [lowerBound, higherBound)"
	^lowerBound + (self next * (higherBound - lowerBound))
]

{ #category : #accessing }
Random >> nextInteger: anInteger [
	"Answer a random integer in the interval [1, anInteger]."
	anInteger strictlyPositive ifFalse: [
		self error: 'Range must be positive'].
	^(self privateNextValue / (self maxValue + 1) * anInteger) truncated + 1
]

{ #category : #accessing }
Random >> nextIntegerBetween: lowerBound and: higherBound [
	"Answer a random integer number from the inclusive range [lowerBound, higherBound]"
	^lowerBound + (self nextInteger: higherBound - lowerBound + 1) - 1
]

{ #category : #accessing }
Random >> state [
	^state
]

{ #category : #initialization }
Random >> initialize [
	super initialize.
	state := Array new: 1
]

{ #category : #initialization }
Random >> seed: aNumber [
	seed := aNumber asInteger.
	self setStateFromSeed
]

{ #category : #initialization }
Random >> setStateFromSeed [
	state at: 1 put: seed + 1442695040888963407.
	self class primitiveRandomNumber: state
]

{ #category : #initialization }
Random >> useClockBasedSeed [
	"Set seed based on the host millisecond clock."
	[
		seed := (Kernel host currentMilliseconds bitAnd: 16rFFFFFFFFFFFFFFFF)
			bitXor: self hash.
		seed = 0] whileTrue.
	self setStateFromSeed
]

{ #category : #private }
Random >> privateNextValue [
	seed := state at: 1.
	^self class primitiveRandomNumber: state
]

{ #category : #private }
Random >> seed [
	^seed
]
