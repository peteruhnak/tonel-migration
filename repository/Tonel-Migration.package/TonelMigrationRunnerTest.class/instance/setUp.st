running
setUp
	super setUp.
	stream := String new writeStream.
	targetFile := self newMemoryStore / 'import.txt'.
	runner := TonelMigrationRunner new.
	runner sourceRepository: repository.
	runner targetFile: targetFile