running
testIsPackageEntry
	self assert: (migration isPackageEntry: store / 'repository' / 'Demo-Project.package').
	self deny: (migration isPackageEntry: store / 'not-repository' / 'Demo-Project.package')