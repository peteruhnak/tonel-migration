tests
testCommitMark
	self assert: (writer commitMarkFor: commits first asTonelCommitInfo) equals: 1.
	self assert: (writer commitMarkFor: commits second asTonelCommitInfo) equals: 2.
	self assert: (writer commitMarkFor: commits first asTonelCommitInfo) equals: 1.
	self
		assert: (writer commitMarkFor: commits second asTonelCommitInfo parents first)
		equals: 1