tests
testMigrateAll
	| contents targetFile |
	targetFile := self newMemoryStore / 'import.txt'.
	runner targetFile: targetFile.
	runner migrate.
	self assert: targetFile exists.
	contents := targetFile contents.
	self assert: (contents lines includes: 'mark :1').
	self assert: (contents lines includes: 'mark :17')