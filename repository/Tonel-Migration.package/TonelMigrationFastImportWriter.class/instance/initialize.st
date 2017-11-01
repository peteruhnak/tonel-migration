initialization
initialize
	super initialize.
	fileModes := Dictionary new.
	fastWriter := GitFastImportFileWriter new