loading
copyTree: aGitTree to: aDirectory
	aGitTree entries do: [ :entry | self copyTreeEntry: entry to: aDirectory ]