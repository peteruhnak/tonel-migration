running
setUp
	super setUp.
	self ensureDemoRepositoryLoaded.
	store := self newMemoryStore.
	commits := (repository newCommitWalk
		fromHead;
		commits) reversed