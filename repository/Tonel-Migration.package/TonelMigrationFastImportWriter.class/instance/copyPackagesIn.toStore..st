writing - memory
copyPackagesIn: aVersion toStore: memoryStore
	| props codeDirectory |
	aVersion packageNames ifEmpty: [ ^ self ].
	codeDirectory := memoryStore / aVersion repository subdirectory.
	aVersion packageNames
		collect: [ :name | IcePackage named: name repository: aVersion repository ]
		thenDo: [ :each | TonelWriter fileOut: (aVersion versionFor: each) on: codeDirectory ].
	props := IceRepositoryProperties
		fromDictionary: {(#format -> #tonel)} asDictionary
		commitish: aVersion.
	props storeIn: codeDirectory