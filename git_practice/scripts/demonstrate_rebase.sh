#!/usr/bin/env bash

REPO_NAME=$1

cd $REPO_NAME

# See git logs and files on master and feature-branch before rebase
git checkout master
echo "The master branch log before rebasing:"
git log --oneline
echo "And its files:"
ls -lh
echo -e "\n"

git checkout feature-branch
echo "The feature-branch log before rebasing:"
git log --oneline
echo "And its files:"
ls -lh
echo -e "\n"

echo -e "PERFORM REBASE\n"
git rebase master

# See git logs and files on master and feature-branch after rebase
echo "The feature-branch log after rebasing:"
git log --oneline
echo "And its files:"
ls -lh
echo -e "\n"

git checkout master

echo "The master branch log after rebasing, but before merging:"
git log --oneline
echo "And its files:"
ls -lh
echo -e "\n"

echo -e "PERFORM (FAST-FORWARD) MERGE"
git merge feature-branch

# Preview git logs and files on master after rebase and merge
echo "The master branch log after rebasing and merging:"
git log --oneline
echo "And its files:"
ls -lh
echo -e "\n"
