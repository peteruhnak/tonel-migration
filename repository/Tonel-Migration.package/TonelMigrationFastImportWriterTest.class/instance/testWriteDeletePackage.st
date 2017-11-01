tests - writing - import file
testWriteDeletePackage
	| commit contents |
	commit := commits
		detect: [ :each | each comment includesSubstring: 'Added tests package.' ].
	writer writeDeletePackagesFor: commit.
	contents := stream contents.
	self
		assertString: contents
		equals:
			'D repository/Demo-Project
D repository/Demo-Tests'