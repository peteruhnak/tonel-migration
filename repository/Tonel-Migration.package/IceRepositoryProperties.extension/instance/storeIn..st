*Tonel-Migration
storeIn: aDirectory
	(aDirectory / self class propertiesFileName)
		ensureDelete;
		writeStreamDo: [ :stream | 
			(STONWriter on: stream)
				prettyPrint: true;
				newLine: OSPlatform current lineEnding;
				nextPut: self properties ]