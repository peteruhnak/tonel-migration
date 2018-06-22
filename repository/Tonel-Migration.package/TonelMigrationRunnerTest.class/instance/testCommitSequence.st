tests
testCommitSequence
	| sequence previous |
	sequence := runner commitSequence.
	self assert: sequence first ancestors asArray equals: {}.
	"invariant: all parents of a commit must precede it"
	previous := OrderedCollection new.
	[ sequence isNotEmpty ]
		whileTrue: [ | top |
			top := sequence removeFirst.
			top ancestors do: [ :each | self assert: (previous includes: each) ].
			previous add: top ]