writing
writeDeletePackagesFor: aCommitInfo
	aCommitInfo packageNames
		do: [ :each | 
			fastWriter
				writeDeleteReference: FileSystem unicodeMemory root / aCommitInfo repository subdirectory / each ]