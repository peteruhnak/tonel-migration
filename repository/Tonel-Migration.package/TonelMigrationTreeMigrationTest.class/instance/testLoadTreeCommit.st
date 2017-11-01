running
testLoadTreeCommit
	| commit |
	commit := commits detect: [ :each | each comment includesSubstring: 'special files' ].
	migration loadCommit: commit to: store.
	self assert: (store / 'README.md') exists.
	self assert: (store / 'special-files' / 'regular.txt') exists.
	self deny: (store / 'repository' / '.filetree') exists.
	self deny: (store / 'repository' / 'Demo-Project.package') exists