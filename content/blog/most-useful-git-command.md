+++
title = 'Git/Bash command you will need'
date = 2018-09-26T17:37:23-07:00
draft = false
tags = ["programming", "git", "github"]
category = ["programming", "git", "github"]
+++

---
# 1.Useful git commands
---  


## Account settings

	git config --global user.name "Max Spatz"
	git config --global user.email "max@example.com"

This is useful especially when you first start using git/Github, you might be asked to set your account details for you to start commit to your projects. use `--global` to configure for all projects. Otherwise you can run `git config` without `--global` inside a project directory to configure for a specific project. 

## Check your settings detail
	git config --list
list all your settings. 

## Initialize a git repository for existing project
	cd example-project/
	git init
`git init` create a `.git` directory and make your project a "Git repository".

## Clone a remote repository
	git clone https://github.com/username/repository.git
This will create a directory with the same name of the repository, however you can clone the content of a remote repository in a directory you specified:  

	git clone https://github.com/username/repository.git .

clone the repository content in current directory.

## Update and merge your current branch with a remote
	cd repository/
	git pull origin master
Where `origin` is the remote repository, and master the remote branch.
If you don't want to __merge__ your changes, use `git fetch`

## get help on a git command
	git help fetch

## View remote
	git remote -v
Must be run within a git repository.

## Add remote
	git remote add remote-name https://github.com/user/repo.git
And then you can start push to the remote.

## Change remote origin
	git remote set-url origin http//github.com/repo.git

## See non-staged (non-added) changes to existing files
	git diff

## See difference between a local branch and a remote branch
	git fetch origin master  # make sure you get the updated origin/master branch
	git diff origin/master --[local-path]

You can omit `--local-path` if you are in the current directory.

## see difference between two commits
	git diff COMMIT1_ID COMMIT2_ID

## See diff before push
	git diff --cached origin/master
It's never too safe to check before you committing a change. 

## Add change and commit, perhaps with a message
	git add changed_file.txt
	git add folder-with-changed-files/
	git add -A  # add all changes
	git commit -m "Commiting changes" # provide a message through -m

## Move and create branch
	git checkout master  # use checkout to switch branch
	git checkout -b new-branch-name  # create new branch

## Merge branch commits
git checkout master
git merge branch-name

Merge branch-name to master.

## And there is a thing called
[_git_ grep](https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git-grep.html)
## Acknowledgement
Inspired by this [post](https://orga.cat/posts/most-useful-git-commands)



---
# 2.Useful linux commands
---
  


## wget download with infinite re-try runs in backend
	wget -c --retry-connrefused --tries=0 -O path-to-output file-url &

## do not delete the compressed files after unzip
	gunzip -clk

## search a regex pattern(-e) in files under a directory
	grep -rnw dirName -e 'regex'

## show total size of a directory
	du -sbh dirName

## find file by name
	find . -name "foo*”

## compare files line by line, report when identical, output difference
	diff -s file1 fil2

# show directory tree
	brew install tree
	tree /path/to/display

# Change tabs to spaces
	expand  # see help pages for more detailed usage

# usage of <(), pass output to other command
	paste positive.rev.txt <(yes "pos" | head -2198) > pos.tagged

`yes` will keep on print the string "pos" and we want 2198 lines, because the positive.rev.txt has the same line number. And paste will combine this two column-wise. 
