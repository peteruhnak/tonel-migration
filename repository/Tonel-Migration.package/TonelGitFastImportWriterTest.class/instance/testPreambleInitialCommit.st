tests
testPreambleInitialCommit
	| contents dtNow |
	writer writeCommitPreambleFor: commits first asTonelCommitInfo.
	contents := stream contents.
	"hack to extract the DateAndTime now inside, which is not straightforward to test"
	dtNow := (contents lines fourth splitOn: '> ') last.
	self
		assertString: contents
		equals:
			('commit refs/heads/master
mark :1
author Peter Uhnak <i.uhnak@gmail.com> 1508584710 +0000
committer Peter Uhnak <i.uhnak@gmail.com> {1}
data 15
initial commit
' format: {dtNow})