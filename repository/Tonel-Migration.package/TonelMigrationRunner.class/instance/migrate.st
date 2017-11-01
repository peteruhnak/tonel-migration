accessing
migrate
	targetFile
		ensureDelete;
		writeStreamDo: [ :stream | 
			stream lineEndConvention: #lf.
			writer on: stream.
			self commitSequence do: [ :each | writer writeVersion: each ] ]