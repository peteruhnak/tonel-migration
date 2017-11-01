tests - commit transform
testCommitterEmail
	self
		assert: (self commitInfoFor:  commits first) committerEmail
		equals: 'i.uhnak@gmail.com'