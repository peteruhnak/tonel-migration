running
testLoadSingleFileCommit
	migration loadCommit: commits first to: store.
	self assert: (store / 'README.md') exists