tests - commit transform
testAuthorEmail
	self
		assert: (self commitInfoFor: commits first) authorEmail
		equals: 'i.uhnak@gmail.com'