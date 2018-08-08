# Lesson 2 reflections
## What happens when you initialize a repository? Why do you need to do it?
A .git directory is created enabling git version control to be used.

## How is the staging area different from the working directory and the repository? What value do you think it offers?
The staging area contains snapshots of files that will be added to the next commit, whereas the working directory just contains the most recent version of the files whether they are to be committed or not. The repository contains all versions of the committed files at the times they were committed. I think the staging area offers a way to easily see which file changes will be added to the next commit and what that kind of change is (e.g. new file or deletion)

## How can you use the staging area to make sure you have one commit per logical change?
If more than one logical change across different files in the working directory, just the files that are affected by one logical change can be added to the staging area in order to be committed together as one logical change. Other changes in other files can then be added and committed at the right point later on.

## What are some situations when branches would be helpful in keeping your history organized? How would branches help?
Branches are useful when yo uwant to try out adding a new feature to your code without changing or breaking the current working version (e.g. the master branch, or a release branch). They also mean that many people can work on different branches changing the same files without impacting each other all of the time (just at merge)

## How do the diagrams help you visualize the branch structure?
Diagrams of branches visualise how commits are connected to each other, which commits belong to a branch, and which commits are unreachable. Note that each commit only "knows" about is parent commit, so when HEAD is at a certain commit and `git log` is called, only commits from HEAD and previous on that branch are shown. Unreachable commits can only be found if their commit ID is known (unless a new branch is checked out to make them reachable).

## What is the result of merging two branches together? Why do we represent it in the diagram the way we do?
Merging two branches together combines the history of the two branches. The merge commit has as many parents as the number of branches merged, and the commit history of the branch merged in to contains the commits from the branches interleaved with each other according to their timestamps. The `git merge` command always merges the branches given as arguments into the branch that is currently checked out, so if you are currently on `master` and wish to merge `my-branch` into `master`, then the `git merge master my-branch`, `git merge my-branch` and `git merge my-branch master` all have the same effect.

## What are the pros and cons of Git’s automatic merging vs. always doing merges manually?
Git's semi-automatic merging makes life easier in circumstances where there are no same-line conflicts, while still allowing the user to deal with any more complex conflicts. Manually merging simple commits would be tedious and error-prone, so it's best to let git deal with these while saving the user's mental resources for the complicated conflicts.