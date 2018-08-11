# Git practice
In this sub-repo, I generate some simple sample git history so that I can safely and transparently play around with 
rebasing, squashing, hard and soft resets and pushes/pulls. The aim of this is to become more familiar with these 
operations and be confident using them safely on code that matters.

## Setup
To create a sample git repository, run
```bash
bash scripts/generate_commit_history.sh
```
from `git-practice/git_practice`. This will create a git repository called `sample_git_repository` in 
`git-practice/git_practice` with all the normal functionality of a git repo.

## Demonstrations

### Rebase
For demonstration of a rebase, run
```bash
bash scripts/demonstrate_rebase.sh sample_git_repository feature-branch
```
which will rebase the `feature-branch` branch on to `master`, displaying the `git log` and tracked files on both 
`master` and `feature-branch` at each step.
