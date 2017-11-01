instance creation
ensureDemoRepositoryLoaded
	repository := IceRepository registry
		detect: [ :each | each name = 'tonel-migration-demo' ]
		ifNone: [ repository := IceRepositoryCreator new
				url: 'https://github.com/peteruhnak/tonel-migration-demo';
				subdirectory: 'repository';
				branchName: 'master';
				createRepository.
			repository register ]