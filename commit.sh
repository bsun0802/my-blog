#!/bin/sh
# deploy.sh publish the changes to Github pages
# this script commit.sh will commit ALL changes in source code to origin/master branch.

git add -A
git commit -m $1
git push origin master

