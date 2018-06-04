accessing
migrate
	targetFile
		ensureDelete;
		writeStreamDo: [ :stream | 
			writer on: (ZnNewLineWriterStream on: stream) forLf.
			self commitSequence do: [ :each | writer writeVersion: each ] ]