tests - writing - import file
testWriteInitialVersion
	| contents |
	writer writeVersion: commits first.
	contents := stream contents.
	self assert: (contents includesSubstring: 'mark :1').
	self assert: (contents includesSubstring: 'initial commit').
	self assert: (contents includesSubstring: 'M 100644 inline README.md')