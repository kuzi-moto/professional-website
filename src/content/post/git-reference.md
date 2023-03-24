---
title: "Git Reference"
date: 2020-05-23T01:17:57Z
publishDate: 2020-05-29
lastmod: 2022-10-02
draft: false
---

# Git Reference

Git is an incredibly useful tool, but does come with a moderate learning curve. I don't use it frequently enough to learn it well so I often find myself searching for the same few commands. This page serves mostly as a personal reference, but will hopefully be of use to others as well.

It will be updated as I find new things to add.

## Commands

### Undo Changes to a Specific File

```bash
$ git checkout -- path/to/file.txt
```

When using `git checkout` it will try to match to an existing branch, or a file path. Changing branches will update the index, and working directory to the specified branch which is the most common use.

Specifying a file path will get the file from the index. This will be from the last time you have run a `git add` or `git commit` on that file, whichever was most recent. If the repository was just cloned, it will be the version you initially downloaded.

### Adding a New Remote

```bash
$ git remote add upstream https://github.com/example/example.git
```

A "remote" is a copy of a repository, usually accessible from the internet or local network location. After cloning a repository, an "origin" remote is added, with the original URL that was pulled from. In some cases it may be useful to add an additional remote. For instance when you are working on a fork of a project. Adding the original project as a remote allows you to merge in changes from the main project to your fork.

### View Remotes

```bash
$ git remote -v
```
