tests
testPreambleSingleParent
	| contents dtNow |
	writer writeCommitPreambleFor: commits first asTonelCommitInfo.
	stream reset.
	writer writeCommitPreambleFor: commits second asTonelCommitInfo.
	contents := stream contents.
	"hack to extract the DateAndTime now inside, which is not straightforward to test"
	dtNow := (contents lines fourth splitOn: '> ') last.
	self
		assertString: contents
		equals:
			('commit refs/heads/master
mark :2
author Peter Uhnak <i.uhnak@gmail.com> 1508584762 +0000
committer Peter Uhnak <i.uhnak@gmail.com> {1}
data 27
temp file for filetree dir

from :1
' format: {dtNow})