tests - commit transform
testAuthoredDate
	self
		assert: (self commitInfoFor: commits first) authoredDate
		equals: (DateAndTime fromUnixTime: 1508584710)	"'2017-10-21T11:18:30+00:00'"