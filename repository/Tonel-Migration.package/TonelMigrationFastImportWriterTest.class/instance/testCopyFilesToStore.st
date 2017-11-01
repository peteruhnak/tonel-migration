tests - writing - memory
testCopyFilesToStore
	| commit |
	commit := commits first.
	writer copyFilesIn: commit toStore: store.
	self assert: (store / 'README.md') exists