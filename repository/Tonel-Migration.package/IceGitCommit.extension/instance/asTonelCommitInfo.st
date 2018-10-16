*Tonel-Migration
asTonelCommitInfo
	| commit |
	commit := LGitCommit of: self repositoryHandle fromHexString: self id.

	^ TonelMigrationCommitInfo
		info: self
		author: (TonelMigrationAuthor
			name: commit author name asByteArray utf8Decoded
			email: commit author email asByteArray utf8Decoded)
		committer: (TonelMigrationAuthor
			name: commit committer name asByteArray utf8Decoded
			email: commit committer email asByteArray utf8Decoded)