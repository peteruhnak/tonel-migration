comparing
= aTonelMigrationCommitInfo
	self species = aTonelMigrationCommitInfo species
		ifFalse: [ ^ false ].
	^ self info = aTonelMigrationCommitInfo info