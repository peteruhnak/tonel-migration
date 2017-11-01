loading
copyTreeEntry: anEntry to: aDirectory
	| file |
	file := aDirectory / anEntry filename.
	anEntry object isBlob
		ifTrue: [ fileModes at: file fullName put: anEntry fileMode value.
			file writeStreamDo: [ :stream | stream << anEntry object contents ] ].
	(anEntry object isTree and: [ (self isPackageEntry: file) not ])
		ifTrue: [ file ensureCreateDirectory.
			anEntry entries do: [ :each | self copyTreeEntry: each to: file ] ]