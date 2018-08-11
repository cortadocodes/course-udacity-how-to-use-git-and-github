#!/usr/bin/env bash

# This script performs a rebase and fast-forward merge on a repository and prints the git log and tracked files at each
# point for demonstration reasons. The repository in question is the first argument of the script, while the branch that
# is rebased is the second.

REPO_NAME=$1
BRANCH=$2

INITIAL_STATE="INITIAL STATE OF REPOSITORY"
REBASE="PERFORM REBASE"
MERGE="PERFORM (FAST-FORWARD) MERGE"

separator() {
    arg_length=${#1}
    eval $(echo printf "=%0.s" {1..$arg_length})
    echo
}

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

# See git logs and files on master and feature branch before rebase
separator "$INITIAL_STATE"
echo $INITIAL_STATE
separator "$INITIAL_STATE"

git checkout master
echo "The master branch log before rebasing:"
show_log_and_files

git checkout $BRANCH
echo "The $BRANCH branch log before rebasing:"
show_log_and_files
press_any_key

separator "$REBASE"
echo $REBASE
separator "$REBASE"

git rebase master
press_any_key

# See git logs and files on master and feature branch after rebase
echo "The $BRANCH branch log after rebasing:"
show_log_and_files

git checkout master
echo "The master branch log after rebasing, but before merging:"
show_log_and_files
press_any_key

separator "$MERGE"
echo $MERGE
separator "$MERGE"

git merge $BRANCH
press_any_key

# Preview git logs and files on master after rebase and merge
echo "The master branch log after rebasing and merging:"
show_log_and_files
