writing
writeDeletePackagesFor: aCommitInfo
	aCommitInfo packageNames
		do: [ :each | 
			fastWriter
				writeDeleteReference: '/' asFileReference / aCommitInfo repository subdirectory / each ]