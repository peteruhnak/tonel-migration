instance creation
info: aCommitInfo author: anAuthor committer: aCommitter
	^ self new
		info: aCommitInfo;
		author: anAuthor;
		committer: aCommitter;
		yourself