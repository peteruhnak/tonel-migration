testing
isPackageEntry: aFile
	^ aFile parent basename = repository subdirectory
		and: [ aFile parent parent isRoot
				and: [ IceLibgitFiletreeWriter isValidPackageName: aFile basename ] ]