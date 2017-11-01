*Tonel-Migration
asTonelCommitInfo
	| author committer |
	self repository backend
		withRepoDo: [ :repo | 
			| com |
			com := LGitCommit of: repo fromHexString: self id.
			author := TonelMigrationAuthor name: com author name email: com author email.
			committer := TonelMigrationAuthor name: com committer name email: com committer email ].
	^ TonelMigrationCommitInfo info: self author: author committer: committer