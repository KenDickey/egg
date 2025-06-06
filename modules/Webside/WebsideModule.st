"
	Copyright (c) 2025, Javier Pimás.
	See (MIT) license in root directory.
"

Class {
	#name : #WebsideModule,
	#superclass : #Module,
	#category : #Webside
}

{ #category : #spec }
WebsideModule >> imports [
	^{
		#Development -> #(CodeSearch MethodSearch MethodSearchScope).
		#FFI -> #(ExternalLibrary).
		#'HTTP.CPPHTTPServer' -> #(HTTPServer).
		#Json -> #(JsonObject JsonWriter).
		#Kernel -> #(ByteArray Error IdentitySet OrderedDictionary ProtoObject ReadStream Species)
	}
]

{ #category : #initializing }
WebsideModule >> main: arguments [
	| server webside |
	Kernel log: 'configuring server, initializing!', String cr.

	ExternalLibrary module initializeForCurrentPlatform.
	Kernel log: 'server configured, starting!', String cr.
	server := HTTPServer new.
	webside := WebsideApplication on: server.

	server start
]

