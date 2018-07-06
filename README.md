# tonel-migration
[![Build Status](https://travis-ci.org/peteruhnak/tonel-migration.svg?branch=master)](https://travis-ci.org/peteruhnak/tonel-migration) [![Coverage Status](https://coveralls.io/repos/github/peteruhnak/tonel-migration/badge.svg?branch=master)](https://coveralls.io/github/peteruhnak/tonel-migration?branch=master)


# NOT MAINTAINED

This project is no longer maintained. The projects works well for the most part, but there is a plethora of edge cases where it fails or mangles the output. Each really annoying to debug or fix, especially when it comes to encoding and line endings. Changes in Pharo 7 streams were the last straw. I no longer have the time, energy, or interest in pursing this project. If you want to pick it up, I'd be happy to transfer the ownership to you.

Note that this does _not_ affect [git-migration](https://github.com/peteruhnak/git-migration).

---

# ALTERNATIVES

If you are on Pharo 6.1, you can use the following script to migrate the sources for a single commit.

https://github.com/pharo-vcs/tonel/blob/b6ae50816a00b3d73664ffb4c9c49b1ce9720312/MigrateFromFileTree.md

For Pharo 7.0, Iceberg includes a plugin to do the same.

---




## Old README



Pharo utility to migrate FileTree repositories to Tonel.

This utility performs a deep history rewrite -- it walks through the entire history graph and recommits every commit with tonel; non-source files are not affected, nor are ancestry relationships changed. That way one can blame and diff changes against the pass.
If you want to modify only your `HEAD`, use Iceberg's tonel plugin.


## Prerequisites

* git installed in the system and available in `PATH`
* **Pharo 6+ (at least 60518)**

## Installation

**Pharo 6**

```smalltalk
Metacello new
	baseline: 'TonelMigration';
	repository: 'github://peteruhnak/tonel-migration:pharo6/repository';
	load.
```

**Pharo 7**

```smalltalk
Metacello new
	baseline: 'TonelMigration';
	repository: 'github://peteruhnak/tonel-migration/repository';
	load.
```


## Usage (Pharo 6)

```smalltalk
"in Pharo"
sourceRepository := IceRepository registry detect: [ :each | each name = 'my-project' ].

targetLocation := sourceRepository location parent / sourceRepository location basename, 'tonel'.

"if the location doesn't exist"
targetLocation ensureCreateDirectory.
repo := IceLibgitLocalRepository newRepositoryAt: targetLocation subdirectory: sourceRepository subdirectory.
repo init.

TonelMigrationRunner new
	sourceRepository: sourceRepository;
	targetFile: targetLocation / 'import.txt';
	migrate
```

```bash
# in terminal
cd ~/prog/tonel-migration/migration-target
# import.txt is the file that you've created earlier
git fast-import < import.txt
# fast-import doesn't change the working directory, so we need to update it
git reset --hard master
git gc
```

You should see the changes, and `git log` should show you the entire history.

## Git Tips

Forgetting all changes in the history and going back to previous state. Useful if the migration is botched and you want to rollback all changes.

```bash
$ git reset --hard SHA
```
