tests - commit transform
testAuthorName
	self
		assert: (self commitInfoFor: commits first) authorName
		equals: 'Peter Uhnak'