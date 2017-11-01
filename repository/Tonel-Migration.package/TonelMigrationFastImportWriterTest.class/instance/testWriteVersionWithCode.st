tests - writing - import file
testWriteVersionWithCode
	| commit contents |
	commit := commits
		detect: [ :each | each comment includesSubstring: 'Added tests package.' ].
	writer writeVersion: commit.
	contents := stream contents.
	self assert: (contents includesSubstring: 'mark :1').
	self assert: (contents includesSubstring: 'Added tests package.').
	self assert: (contents includesSubstring: 'M 100644 inline README.md').
	self assert: (contents includesSubstring: 'D repository/Demo-Tests').
	self assert: (contents includesSubstring: 'M 100644 inline repository/.properties').
	self
		assert:
			(contents
				includesSubstring: 'M 100644 inline repository/Demo-Tests/DemoObjectTest.class.st')