*Tonel-Migration
asTonelCommitInfo
	| commit |
	commit := LGitCommit of: self repositoryHandle fromHexString: self id.

	^ TonelMigrationCommitInfo
		info: self
		author: (TonelMigrationAuthor name: commit author name email: commit author email)
		committer: (TonelMigrationAuthor name: commit committer name email: commit committer email)