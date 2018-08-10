#!/usr/bin/env bash

REPO_NAME=$1
SEPARATOR_0="==========================="
SEPARATOR_1="=============="
SEPARATOR_2="=============================="

show_log_and_files() {
    git log --oneline
    echo -e "\nAnd its files:"
    ls -lh
    echo -e "\n"
}

press_any_key() {
    read -rsp $'Press any key to continue...\n\n' -n1 key
}

cd $REPO_NAME

# See git logs and files on master and feature-branch before rebase
echo $SEPARATOR_0
echo "INITIAL STATE OF REPOSITORY"
echo -e "$SEPARATOR_0\n"

git checkout master
echo "The master branch log before rebasing:"
show_log_and_files

git checkout feature-branch
echo "The feature-branch log before rebasing:"
show_log_and_files
press_any_key

echo $SEPARATOR_1
echo "PERFORM REBASE"
echo -e "$SEPARATOR_1\n"

git rebase master
press_any_key

# See git logs and files on master and feature-branch after rebase
echo "The feature-branch log after rebasing:"
show_log_and_files

git checkout master

echo "The master branch log after rebasing, but before merging:"
show_log_and_files

press_any_key

echo $SEPARATOR_2
echo "PERFORM (FAST-FORWARD) MERGE"
echo -e "$SEPARATOR_2\n"

git merge feature-branch
press_any_key

# Preview git logs and files on master after rebase and merge
echo "The master branch log after rebasing and merging:"
show_log_and_files
