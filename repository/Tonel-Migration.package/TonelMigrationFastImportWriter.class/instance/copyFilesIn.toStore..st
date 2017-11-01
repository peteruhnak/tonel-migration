writing - memory
copyFilesIn: aVersion toStore: memoryStore
	| fileMigration |
	fileMigration := TonelMigrationTreeMigration on: aVersion repository.
	fileMigration loadCommit: aVersion to: memoryStore.
	fileModes := fileMigration fileModes