loading
copyTreeEntry: anEntry to: aStore directory: aParentPath
	| path |
	path := aParentPath / anEntry filename.
	anEntry object isBlob
		ifTrue: [ fileModes at: path fullName put: anEntry fileMode value.
			aStore / path fullName writeStreamDo: [ :stream | stream << anEntry object contents ] ].
	(anEntry object isTree and: [ (self isPackageEntry: path) not ])
		ifTrue: [ (aStore / path fullName) ensureCreateDirectory.
			anEntry entries do: [ :each | self copyTreeEntry: each to: aStore directory: path ] ]