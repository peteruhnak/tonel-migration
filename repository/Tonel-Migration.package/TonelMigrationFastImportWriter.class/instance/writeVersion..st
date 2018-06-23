writing
writeVersion: aVersion
	| memoryStore commitInfo |
	commitInfo := self commitInfoFor: aVersion.
	fastWriter writeCommitPreambleFor: commitInfo.
	fastWriter writeMergesFor: commitInfo.
	memoryStore := self newMemoryStore.
	fileModes := Dictionary new.
	self writeDeletePackagesFor: aVersion.
	self copyPackagesIn: aVersion toStore: memoryStore.
	self copyFilesIn: aVersion toStore: memoryStore.
	fastWriter fileModes: fileModes.
	fastWriter writeDirectoryTreeInlineFor: memoryStore