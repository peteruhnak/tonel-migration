accessing
parents
	^ parents ifNil: [ parents := self info ancestors collect: #asTonelCommitInfo ]