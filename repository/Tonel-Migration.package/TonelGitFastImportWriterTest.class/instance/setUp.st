running
setUp
	super setUp.
	stream := String new writeStream.
	writer := GitFastImportFileWriter new on: stream