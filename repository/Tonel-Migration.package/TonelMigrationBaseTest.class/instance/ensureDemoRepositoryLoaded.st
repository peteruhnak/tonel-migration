instance creation
ensureDemoRepositoryLoaded
	repository := IceRepository registry
		detect: [ :each | each name = 'tonel-migration-demo' ]