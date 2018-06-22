loading
loadCommit: aCommitInfo to: aStore
	| repo tree |
	repo := aCommitInfo repositoryHandle.
	repo workingDirectory.
	tree := (LGitCommit of: repo fromHexString: aCommitInfo id) tree.
	fileModes := Dictionary new.
	self copyTree: tree to: aStore