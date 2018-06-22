tests
testPreambleTwoParents
	| commit contents dtNow |
	commit := commits detect: [ :each | each ancestors size = 2 ].
	writer writeCommitPreambleFor: commit ancestors first asTonelCommitInfo.
	writer writeCommitPreambleFor: commit ancestors second asTonelCommitInfo.
	stream reset.
	writer writeCommitPreambleFor: commit asTonelCommitInfo.
	contents := stream contents.
	"hack to extract the DateAndTime now inside, which is not straightforward to test"
	dtNow := (contents lines fourth splitOn: '> ') last.
	self
		assertString: contents
		equals:
			('commit refs/heads/master
mark :4
author Peter Uhnak <i.uhnak@gmail.com> 1508585297 +0000
committer Peter Uhnak <i.uhnak@gmail.com> {1}
data 51
Merge with 1d1e3c4511e052ecb5fb102ba11c0c1f41423445
from :1
merge :3
' format: {dtNow})