loading
copyTree: aGitTree to: aStore
	aGitTree entries
		do: [ :entry | self copyTreeEntry: entry to: aStore directory: '' asFileReference ]