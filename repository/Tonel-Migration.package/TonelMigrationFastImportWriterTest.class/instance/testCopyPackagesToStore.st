tests - writing - memory
testCopyPackagesToStore
	| commit |
	commit := commits
		detect: [ :each | each comment includesSubstring: 'Added tests package.' ].
	writer copyPackagesIn: commit toStore: store.
	self assert: (store / 'repository' / 'Demo-Tests' / 'DemoObjectTest.class.st') exists.
	self
		assert: (store / 'repository' / 'Demo-Tests' / 'DemoObjectTest.class.st') contents isNotEmpty.
	self assert: (store / 'repository' / '.properties') exists