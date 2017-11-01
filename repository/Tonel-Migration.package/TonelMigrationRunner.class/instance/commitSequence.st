accessing
commitSequence
	^ (sourceRepository newCommitWalk
		fromHead;
		commits) reversed