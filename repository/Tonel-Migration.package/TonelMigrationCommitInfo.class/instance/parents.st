accessing
parents
	^ parents ifNil: [ parents := self info parents collect: #asTonelCommitInfo ]