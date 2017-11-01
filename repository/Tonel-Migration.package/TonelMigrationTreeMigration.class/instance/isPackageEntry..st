testing
isPackageEntry: aPath
	^ aPath parent = ('/' asFileReference / repository subdirectory)
		and: [ IceLibgitFiletreeWriter isValidPackageName: aPath basename ]