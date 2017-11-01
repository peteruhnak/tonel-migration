loading
loadCommit: aCommitInfo to: aStore
	aCommitInfo backend
		withRepoDo: [ :repo | 
			| tree |
			repo workingDirectory.
			tree := (LGitCommit of: repo fromHexString: aCommitInfo id) tree.
			fileModes := Dictionary new.
			self copyTree: tree to: aStore ]