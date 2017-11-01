running
setUp
	super setUp.
	stream := String new writeStream.
	writer := TonelMigrationFastImportWriter new on: stream