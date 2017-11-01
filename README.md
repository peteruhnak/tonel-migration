# tonel-migration
[![Build Status](https://travis-ci.org/peteruhnak/tonel-migration.svg?branch=master)](https://travis-ci.org/peteruhnak/tonel-migration) [![Coverage Status](https://coveralls.io/repos/github/peteruhnak/tonel-migration/badge.svg?branch=master)](https://coveralls.io/github/peteruhnak/tonel-migration?branch=master)

Pharo utility to migrate FileTree repositories to Tonel

## Prerequisites

* git installed in the system and available in `PATH`
* **Pharo 6+ (at least 60518)**

## Installation

```smalltalk
Metacello new
	baseline: 'TonelMigration';
	repository: 'github://peteruhnak/tonel-migration/repository';
	load.
```

## Usage

```smalltalk
"in Pharo"
targetLocation := FileLocator home asFileReference / 'prog' / 'tonel-migration' / 'migration-target'.

"if the location doesn't exist"
targetLocation ensureCreateDirectory.
repo := IceLibgitLocalRepository newRepositoryAt: targetLocation  subdirectory: ''.
repo init.

TonelMigrationRunner new
	sourceRepository: (IceRepository registry detect: [ :each | each name = 'tonel-migration-demo' ]);
	targetFile: targetLocation / 'import.txt';
	migrate
```

```bash
# in terminal
cd ~/.../migration-target
# import.txt is the file that you've created earlier
git fast-import < import.txt
# fast-import doesn't change the working directory, so we need to update it
git reset --hard master
```

You should see the changes, and `git log` should show you the entire history.

## Git Tips

Forgetting all changes in the history and going back to previous state. Useful if the migration is botched and you want to rollback all changes.

```bash
$ git reset --hard SHA
```
