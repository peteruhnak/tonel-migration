tests
testCommitSequence
	| sequence previous |
	sequence := runner commitSequence.
	self assert: sequence first parents asArray equals: {}.
	"invariant: all parents of a commit must precede it"
	previous := OrderedCollection new.
	[ sequence isNotEmpty ]
		whileTrue: [ | top |
			top := sequence removeFirst.
			top parents do: [ :each | self assert: (previous includes: each) ].
			previous add: top ]