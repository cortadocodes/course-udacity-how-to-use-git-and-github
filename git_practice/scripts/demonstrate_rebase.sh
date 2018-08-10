#!/usr/bin/env bash

REPO_NAME=$1
SEPARATOR_0="==========================="
SEPARATOR_1="=============="
SEPARATOR_2="=============================="

press_any_key() {
    read -rsp $'Press any key to continue...\n' -n1 key
}

cd $REPO_NAME

# See git logs and files on master and feature-branch before rebase
echo $SEPARATOR_0
echo "INITIAL STATE OF REPOSITORY"
echo -e "$SEPARATOR_0\n"

git checkout master
echo "The master branch log before rebasing:"
git log --oneline
echo -e "\nAnd its files:"
ls -lh

git checkout feature-branch
echo "The feature-branch log before rebasing:"
git log --oneline
echo -e "\nAnd its files:"
ls -lh
press_any_key
echo -e "\n"


echo $SEPARATOR_1
echo "PERFORM REBASE"
echo -e "$SEPARATOR_1\n"

git rebase master
press_any_key
echo -e "\n"

# See git logs and files on master and feature-branch after rebase
echo "The feature-branch log after rebasing:"
git log --oneline
echo -e "\nAnd its files:"
ls -lh
echo -e "\n"

git checkout master

echo "The master branch log after rebasing, but before merging:"
git log --oneline
echo -e "\nAnd its files:"
ls -lh
press_any_key
echo -e "\n"

echo $SEPARATOR_2
echo "PERFORM (FAST-FORWARD) MERGE"
echo -e "$SEPARATOR_2\n"

git merge feature-branch
press_any_key
echo -e "\n"

# Preview git logs and files on master after rebase and merge
echo "The master branch log after rebasing and merging:"
git log --oneline
echo -e "\nAnd its files:"
ls -lh
echo -e "\n"
