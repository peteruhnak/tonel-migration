instance creation
commitInfoFor: aCommitInfo
	| author committer|
	repository backend
		withRepoDo: [ :repo | 
			| com |
			com := LGitCommit of: repo fromHexString: aCommitInfo id.
			author := TonelMigrationAuthor name: com author name email: com author email.
			committer := TonelMigrationAuthor name: com committer name email: com committer email ].
	^ TonelMigrationCommitInfo info: aCommitInfo author: author committer: committer