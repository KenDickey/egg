Class {
	#name : #InlineMessageLinker,
	#superclass : #MessageLinker,
	#instVars : [
		'assembler',
		'map'
	],
	#category : #Nativization
}

{ #category : #private }
InlineMessageLinker class >> initializeInlineMessageLinkerFlags [
	self addNamespaceAs: #InlineMessageLinkerFlags.
	InlineMessageLinkerFlags
		at: #_Flags put: -5;
		at: #_SmallSize put: -6;
		at: #_Hash put: -8;
		at: #_Reserved put: -2;
		at: #_ExtendedSize put: -3.

]

{ #category : #private }
InlineMessageLinker class >> supported [
	| selectors |
	selectors := self organization selectorsFor: #'private - assemble'.
	^selectors collect: [:selector | | cm key |
		cm := self >> selector.
		key := cm literals detect: [:each | each isSymbol and:[each first == $_ ]].
		key -> selector]. 

	"
	InlineMessageLinker supported
	"

]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleAsFloatInto [
	#_asFloatInto:.
	assembler
		loadX0withRasDouble;
		storeLargeX0inA.
	self readFloatStatus
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleAsNative [
	| noninteger |
	#_asNative.
	noninteger := assembler labeledIntegerBitTestOfR.
	assembler
		convertRtoNativeInteger;
		@ noninteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleAsObject [
	#_asObject.
	assembler clearSafeRintegerBit
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleAsPointer [
	| nonInteger |
	#_asPointer.
	nonInteger := assembler labeledIntegerBitTestOfR.
	assembler
		convertRtoNativeInteger;
		@ nonInteger;
		setSafeRintegerBit
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleAsSmallInteger [
	#_asSmallInteger.
	assembler convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicAt [
	| oop |
	#_basicAt:.
	oop := assembler labeledIntegerNativizationOfA.
	assembler
		loadRwithRatA;
		@ oop
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicAtPut [
	| nonInteger |
	#_basicAt:put:.
	nonInteger := assembler labeledIntegerNativizationOfA.
	assembler
		storeTinRatA;
		@ nonInteger;
		loadRwithT
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicCopyFromToWith [
	#_basicCopyFrom:to:with:.
	assembler
		pushE;
		convertAtoNativeInteger;
		convertTtoNativeInteger;
		loadEwithAddressOfRatA;
		loadSwithAddressOfSatA;
		subAfromT;
		addTwithImmediate: 1;
		moveTslots;
		popE
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicFlags [
	#_basicFlags.
	self emitByteAtOffset: _Flags
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicFlagsPut [
	#_basicFlags:.
	self emitByteAtOffsetPut: _Flags
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicHash [
	#_basicHash.
	assembler
		loadZeroExtendShortRwithRoffset: _Hash;
		convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicHashPut [
	| nonInteger |
	#_basicHash:.
	nonInteger := assembler labeledIntegerNativizationOfA.
	assembler
		storeShortAinRoffset: _Hash;
		@ nonInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicSize [
	#_smallSize.
	self emitByteAtOffset: _SmallSize
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicSizePut [
	#_smallSize:.
	self emitByteAtOffsetPut: _SmallSize
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicULongAt [
	| nonInteger |
	#_basicULongAt:.
	nonInteger := assembler labeledIntegerNativizationOfA.
	assembler
		loadZeroExtendLongRwithRatA;
		@ nonInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBasicULongAtPut [
	| nonInteger |
	#_basicULongAt:put:.
	nonInteger := assembler labeledIntegerNativizationOfA.
	assembler
		storeLongTinRatA;
		@ nonInteger;
		loadRwithT
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBeCurrent [
	#_beCurrent.
	assembler
		loadRwithRindex: 1;
		clearSafeRintegerBit;
		loadFPwithR
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBeEnvironment [
	#_beEnvironment.
	assembler loadEwithR
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBeFramePointer [
	#_beFramePointer.
	assembler storeRinFPindex: 1
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBitShiftLeft [
	| success |
	#_bitShiftLeft:.
	success := assembler newLabel.
	assembler
		loadTwithA;
		loadAwithR;
		clearSafeRintegerBit;
		convertTtoNativeInteger;
		shiftLeftRwithT;
		setSafeRintegerBit;
		pushR;
		shiftRightRwithT;
		setSafeRintegerBit;
		compareRwithA;
		popR;
		shortJumpIfEqualTo: success;
		loadRwithNil;
		@ success
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBitShiftRight [
	#_bitShiftRight:.
	assembler
		move: assembler regA to: assembler regT;
		convertToNativeInteger: assembler regT;
		shiftRightArithmetic: assembler regR by: assembler regT b;
		setIntegerBit: assembler regR
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleBusyWait [
	| loop |
	#_busyWait.
	loop := assembler newLabel.
	assembler
		loadTwithImmediate: 0;
		@ loop;
		exchangeRindirectWithT;
		compareTwithImmediate: 0;
		shortJumpIfEqualTo: loop
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleByteAt [
	| nonInteger |
	#_byteAt:.
	nonInteger := assembler labeledIntegerNativizationOfA.
	assembler
		loadZeroExtendByteRwithRatA;
		convertRtoSmallInteger;
		@ nonInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleByteAtPut [
	| nonInteger1 nonInteger2 |
	#_byteAt:put:.
	nonInteger1 := assembler labeledIntegerNativizationOfA.
	nonInteger2 := assembler labeledIntegerNativizationOfT.
	assembler
		storeByteTinRatA;
		@ nonInteger1;
		@ nonInteger2;
		loadRwithT;
		convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleCDeclCallWithArguments [
	#_cdeclCallWithArguments:.
	assembler
		loadZeroExtendByteTwithAindex: _SmallSize + 1;
		shiftTright: assembler wordSizeShift;
		pushS;
		saveCallerFrame;
		subTslotsToSP;
		assemble: 'and' with: assembler regSP with: -16;
		loopTtimes: [ assembler
				load: assembler regS
				fromMem: assembler memRefAatT;
				store: assembler regS
				intoMem: assembler memRefSPatT ].
	assembler addressSize = 8
		ifTrue: [ self loadArgumentsIntoRegisters ].
	assembler
		callR;
		restoreCallerFrame;
		popS
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleCallWithArguments [
	#_stdcallWithArguments:.
	assembler
		loadZeroExtendByteTwithAindex: _SmallSize + 1;
		shiftTright: assembler wordSizeShift;
		loopTtimes: [ assembler pushAatToffset: 0 - assembler addressSize ].
	assembler addressSize = 8
		ifTrue: [ self loadArgumentsIntoRegisters ].
	assembler callR
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleEnvironment [
	#_environment.
	assembler loadRwithE
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleExpandInStackSized [
	#_expandInStackSized:.
	assembler
		convertAtoNativeInteger;
		loadTwithA;
		loopTtimes: [ assembler
				pushIndirectR;
				addRwithImmediate: assembler wordSize ]
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleExtendedSize [
	#_largeSize.
	assembler
		loadZeroExtendLongRwithRindex: _ExtendedSize;
		convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFloatEquals [
	"
	first compare magnitudes to set error bit if NaN
	"
	#_floatEquals:.
	assembler
		pushR;
		loadLargeX0withRindirect;
		compareLessThanDoubleX0withAindirect;
		popR;
		loadLargeX0withRindirect;
		compareEqualDoubleX0withAindirect;
		moveX0toR;
		addRwithImmediate: 1;
		convertRtoSmallInteger.
	self readFloatStatus
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFloatFractionPartInto [
	#_floatFractionPartInto:.
	assembler
		loadLargeX0withRindirect;
		roundDoubleX0intoX1;
		subDoubleX1fromX0;
		storeLargeX0inA.
	self readFloatStatus
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFloatLessThan [
	#_floatLessThan:.
	assembler
		loadLargeX0withRindirect;
		compareLessThanDoubleX0withAindirect;
		moveX0toR;
		addRwithImmediate: 1;
		convertRtoSmallInteger.
	self readFloatStatus
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFloatMinusInto [
	#_floatMinus:into:.
	assembler
		loadLargeX0withRindirect;
		loadLargeX1withAindirect;
		subDoubleX1fromX0;
		storeLargeX0inT.
	self readFloatStatus
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFloatMultiplyInto [
	#_floatMultiply:into:.
	assembler
		loadLargeX0withRindirect;
		loadLargeX1withAindirect;
		multiplyDoubleX0byX1;
		storeLargeX0inT.
	self readFloatStatus
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFloatPlusInto [
	#_floatPlus:into:.
	assembler
		loadLargeX0withRindirect;
		loadLargeX1withAindirect;
		addDoubleX1toX0;
		storeLargeX0inT.
	self readFloatStatus
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFloatQuotientInto [
	#_floatQuotient:into:.
	assembler
		loadLargeX0withRindirect;
		loadLargeX1withAindirect;
		divideDoubleX0byX1;
		storeLargeX0inT.
	self readFloatStatus
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFloatSqrtInto [
	#_floatSqrtInto:.
	assembler
		loadLargeX0withRindirect;
		sqrtDoubleX0;
		storeLargeX0inA.
	self readFloatStatus
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFloatTruncated [
	#_floatTruncated.
	assembler loadRconvertingDoublePointedByR.
	self readFloatStatus.
	assembler convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleFramePointer [
	#_framePointer.
	assembler loadRwithFPindex: 1
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleGetTIBValue [
	| nonInteger |
	#_getThreadInformationBlockValue.
	nonInteger := assembler labeledIntegerNativizationOfR.
	assembler
		loadRwithTIBatR;
		@ nonInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleGetThreadValue [
	| nonInteger uninitialized |
		#_getThreadValue.
	nonInteger := assembler labeledIntegerNativizationOfR.
	uninitialized := assembler newLabel.
	assembler
		loadRwithThreadVariableAtR;
		compareRwithImmediate: 0;
		shortJumpIfEqualTo: uninitialized.
	assembler
		jumpOver: [ assembler
				@ uninitialized;
				@ nonInteger;
				loadRwithNil ]
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleHigh16 [
	#_high16.
	assembler wordSize > 4
		ifTrue: [ assembler clearRhigh32 ].
	assembler
		shiftRright: 15;
		setSafeRintegerBit
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleHigh32 [
	#_high32.
	assembler
		shiftLogicalRright: 31;
		setSafeRintegerBit
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleHoldRefererIfNeeded [
	#_holdRefererIfNeeded:.
	assembler
		pushA;
		loadAwithGlobal: #WriteBarrier;
		callIndirectA;
		popA
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleIntegerMultiplyByInto [
	#_integerMultiplyBy:into:.
	assembler
		convertRtoNativeInteger;
		convertAtoNativeInteger;
		multiplyRbyAwideningToA;
		storeRinTindex: 1;
		storeAinTindex: 2;
		loadRwithT
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleInvoke [
	#_invoke:.
	assembler
		loadMwithA;
		callIndirectM
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleLeadingZeroBitCount [
	#_leadingZeroBitCount.
	assembler
		convertRtoNativeInteger;
		leadingRzeroCount;
		convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleLoadFloatStatusFrom [
	#_status:.
	assembler loadMXCSRfromA
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleLow16 [
	#_low16.
	assembler
		andRwithImmediate: 16rFFFF;
		convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleLow32 [
	#_low32.
	assembler wordSize > 4
		ifTrue: [ assembler
				andRwithImmediate: 16rFFFFFFFF;
				convertRtoSmallInteger ]
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleNativeHalt [
	#_halt.
	assembler breakpoint
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleNilSlots [
	#_nilSlots:.
	assembler
		pushE;
		loadEwithR;
		loadRwithNil;
		loadTwithA;
		convertTtoNativeInteger;
		writeTslots;
		popE
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleObjectAtOffset [
	| nonInteger1 |
	#_objectAtOffset:.
	nonInteger1 := assembler labeledIntegerNativizationOfA.
	assembler
		loadRwithRatOffsetA;
		@ nonInteger1
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleObjectAtOffsetPut [
	| oop |
	#_objectAtOffset:put:.
	oop := assembler labeledIntegerNativizationOfA.
	assembler
		storeTinRatOffsetA;
		@ oop;
		loadRwithT;
		convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleOop [
	#_oop.
	^ assembler convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleQuotientTowardZero [
	#_quotientTowardZero:.
	assembler
		convertRtoNativeInteger;
		convertAtoNativeInteger;
		loadTwithA;
		extendRtoAandDividebyT;
		convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleRelease [
	#_release.
	assembler
		lock;
		decRindirect
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleRemainderTowardZero [
	| adapt convert |
	#_remainderTowardZero:.
	adapt := assembler newLabel.
	convert := assembler newLabel.
	assembler
		convertRtoNativeInteger;
		convertAtoNativeInteger;
		loadTwithA;
		xorAwithR;
		jumpIfSignTo: adapt;
		extendRtoAandDividebyT;
		loadRwithA;
		jumpTo: convert;
		@ adapt;
		extendRtoAandDividebyT;
		loadRwithA;
		testRwithR;
		jumpIfZeroTo: convert;
		addTtoR;
		@ convert;
		convertRtoSmallInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleRestore [
	#_restore.
	assembler loadEwithR
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleRestoreAndTransferControlWithContext [
	#_restoreAndTransferControlWithContext:.
	assembler
		clearSafeRintegerBit;
		loadFPwithR;
		loadSPwithFP;
		loadRwithA;
		clearSafeRintegerBit;
		loadFPwithR;
		popR;
		loadEwithR;
		restoreCallerSelf;
		restoreCallerM;
		loadRwithS;
		return: 0
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleRestoreWithContext [
	#_restoreWithContext:.
	assembler
		clearSafeRintegerBit;
		loadFPwithR;
		loadSPwithFP;
		loadRwithA;
		clearSafeRintegerBit;
		loadFPwithR
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleSaveCurrentEnvironment [
	#_saveCurrentEnvironment.
	assembler
		clearSafeRintegerBit;
		pushE;
		popT;
		storeTinRindex: 1;
		setSafeRintegerBit
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleSetTIBValue [
	#_setThreadInformationBlockValue:.
	assembler
		convertRtoNativeInteger;
		storeTIBatRwithA
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleSetThreadValue [
	| nonInteger |
	#_setThreadValue:.
	nonInteger := assembler labeledIntegerNativizationOfR.
	assembler
		storeAinThreadVariableAtIndexR;
		convertRtoSmallInteger.
	assembler @ nonInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleSmallIntegerByteAt [
	| nonInteger |
	#_smallIntegerByteAt:.
	nonInteger := assembler labeledIntegerNativizationOfA.
	assembler
		convertRtoNativeInteger;
		pushR;
		loadZeroExtendByteRwithSPatA;
		convertRtoSmallInteger;
		popA;
		@ nonInteger
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleStoreDoubleResult [
	#_storeDoubleResult.
	assembler storeDoubleResultInRindirect
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleStoreFloatStatusInto [
	#_readStatusOn:.
	assembler storeMXCSRintoA
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleTestSmallInteger [
	| integer |
	#_isSmallInteger.
	integer := assembler newLabel.
	assembler
		testRintegerBit;
		loadRwithTrue;
		shortJumpIfNotZeroTo: integer;
		loadRwithFalse;
		@ integer
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleThisContext [
	#_thisContext.
	assembler loadRwithFP setRintegerBit
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleTimesTwoPower [
	#_timesTwoPower:.
	assembler clearFPUFlags scaleFloatOnRWithA clearFPUFlags
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleTransferControlDiscardingLastArgTo [
	#_transferControlDiscardingLastArgTo:.
	assembler
		restoreCallerFrame;
		popSPindirect;
		loadMwithA;
		jumpToMindex: 1
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleTransferControlTo [
	#_transferControlTo:.
	assembler restoreCallerFrame; loadMwithA; jumpToMindex: 1
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleULargeAtOffset [
	| overflow1 overflow2 end |
	#_uLargeAtOffset:.
	overflow1 := assembler newLabel.
	overflow2 := assembler newLabel.
	end := assembler newLabel.
	assembler
		convertAtoNativeInteger;
		loadRwithRatOffsetA;
		shiftRleft: 1;
		shortJumpIfCarryTo: overflow1;
		shortJumpIfSignTo: overflow2;
		setRintegerBit;
		shortJumpTo: end.
	assembler
		@ overflow1;
		@ overflow2;
		loadRwithNil;
		@ end
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleULargeAtOffsetInto [
	#_uLargeAtOffset:into:.
	assembler
		convertAtoNativeInteger;
		loadAwithRoffsetAtA;
		storeAinTindex: 1;
		loadRwithT
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleULargeAtOffsetPut [
	| end notSmall |
	#_uLargeAtOffset:put:.
	notSmall := assembler
		convertAtoNativeInteger;
		labeledIntegerBitTestOfT.
	end := assembler newLabel.
	assembler
		convertTtoNativeInteger;
		shortJumpTo: end;
		@ notSmall;
		loadTwithTindex: 1;
		@ end;
		storeTinRatOffsetA
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleULongAtOffset [
	| overflow1 overflow2 end |
	#_uLongAtOffset:.
	overflow1 := assembler newLabel.
	overflow2 := assembler newLabel.
	end := assembler newLabel.
	assembler
		convertAtoNativeInteger;
		loadLongRwithRatOffsetA;
		shiftRleft: 1;
		shortJumpIfCarryTo: overflow1;
		shortJumpIfSignTo: overflow2;
		setRintegerBit;
		shortJumpTo: end.
	assembler
		@ overflow1;
		@ overflow2;
		loadRwithNil;
		@ end
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleULongAtOffsetInto [
	#_uLongAtOffset:into:.
	assembler
		convertAtoNativeInteger;
		loadLongRwithRatOffsetA;
		storeRinTindex: 1;
		loadRwithT
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleULongAtOffsetPut [
	| end oop |
	#_uLongAtOffset:put:.
	oop := assembler
		convertAtoNativeInteger;
		labeledIntegerBitTestOfT.
	end := assembler newLabel.
	assembler
		convertTtoNativeInteger;
		shortJumpTo: end;
		@ oop;
		loadTwithTindex: 1;
		@ end;
		storeLongTinRatOffsetA
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleUShortAtOffsetPut [
	| end notSmall |
	#_uShortAtOffset:put:.
	notSmall := assembler
		convertAtoNativeInteger;
		labeledIntegerBitTestOfT.
	end := assembler newLabel.
	assembler
		convertTtoNativeInteger;
		shortJumpTo: end.
	assembler
		@ notSmall;
		loadTwithTindex: 1;
		@ end;
		storeShortTinRatOffsetA
]

{ #category : #'private - assemble' }
InlineMessageLinker >> assembleZeroSlots [
	#_zeroSlots:.
	assembler
		pushE;
		loadEwithR;
		loadRwithImmediate: 0;
		loadTwithA;
		convertTtoNativeInteger;
		writeTslots;
		popE
]

{ #category : #'private - helpers' }
InlineMessageLinker >> emitByteAtOffset: offset [
	assembler
		loadZeroExtendByteRwithRindex: offset + 1;
		convertRtoSmallInteger 
]

{ #category : #'private - helpers' }
InlineMessageLinker >> emitByteAtOffsetPut: offset [
	| nonInteger |
	nonInteger := assembler labeledIntegerNativizationOfA.
	assembler
		storeByteAinRindex: offset + 1;
		@ nonInteger 
]

{ #category : #nativizing }
InlineMessageLinker >> emitSend: aSymbol using: anAssembler [
	| arity selector | 
	assembler := anAssembler.
	arity := aSymbol arity. 
	arity > 2 ifTrue: [assembler pop: assembler regS].
	arity > 1 ifTrue: [assembler pop: assembler regT].
	arity > 0 ifTrue: [assembler pop: assembler regA].
	self ASSERT: arity <= 3 .
	selector := map at: aSymbol.
	self perform: selector
]

{ #category : #nativizing }
InlineMessageLinker >> emitSendDebuggable: aSymbol using: anAssembler [
	self emitSend: aSymbol using: anAssembler 
]

{ #category : #initialization }
InlineMessageLinker >> initialize [
	map := Dictionary new.
	self class supported do:[:each|map add: each].
	self filter: map keys asIdentitySet

	"
	InlineMessageLinker new
	"

]

{ #category : #'private - helpers' }
InlineMessageLinker >> loadArgumentsIntoRegisters [
	| stack1 stack2 stack3 stack4 |
	stack1 :=assembler memRef: rsp indexImm: 1.
	stack2 :=assembler memRef: rsp indexImm: 2.
	stack3 :=assembler memRef: rsp indexImm: 3.
	stack4 :=assembler memRef: rsp indexImm: 4.
	assembler
		load: rcx fromMem: stack1;
		load: rdx fromMem: stack2;
		load: r8 fromMem: stack3;
		load: r9 fromMem: stack4;
		assemble: 'movq' with: xmm0 with: rcx;
		assemble: 'movq' with: xmm1 with: rdx;
		assemble: 'movq' with: xmm2 with: r8;
		assemble: 'movq' with: xmm3 with: r9
]

{ #category : #'private - helpers' }
InlineMessageLinker >> readFPUStatus [
	assembler
		loadAwithKnown: #FloatStatus;
		readFPUStatusOnA
]

{ #category : #'private - helpers' }
InlineMessageLinker >> readFloatStatus [
	assembler
		loadAwithKnown: #FloatStatus;
		storeMXCSRintoA
]
