# Lesson 3 reflections
## When would you want to use a remote repository rather than keeping all your work local?
Using a remote repository is useful both for collaborating and backup. The remote repository can be used as the central location for
a project, meaning that many people can work on different or the same parts of it a the same time, pushing their changes to it. Everybody
working on it can then get those changes by pulling from the remote. In terms of backup, using a remote means your code is in at least one
more place than just locally. The remote can then facilitate other clones of the repository, or more remotes can be created for greater 
distribution; this all makes the storage of the code much more robust and less likely to be lost due to mistake, system failure or
malicious attacks.

## Why might you want to always pull changes manually rather than having Git automatically stay up-to-date with your remote repository?
If somebody is makign active changes to a file you're changing, there may be many conflicts from pulling; it may be better to deal with these once when you choose to pull, rather than every time an automatic pull takes place. Also, you may want to branch at a certain point, so you wouldn't want to pull until you'd branched or the branch could be in the wrong place (although there are ways to get around this).

## Describe the differences between forks, clones, and branches. When would you use one instead of another?
* Clone - the copying of a git repository (all tracked files and the .git directory) from a remote location to a "local" location. Once cloned, a repository can then be added to or modified, and if you have permission, changes can be pushed to the remote that was cloned from. I would clone a repository that I want to work on with somebody collaboratively, or if it was my own code and I wanted to work on a different machine.
* Fork - a `git clone` on GitHub's servers that copies somebody else's repository into your account so that you can make any changes you like to it without affecting the original. Your version will show up as having been forked from the original, ensuring credit is given to the creator of the original. I would fork a repository if I wanted to build on somebody else's work for my own purposes, without affecting their work or having to ask for their approval to make changes.
* Branch - a separate line of development within a single repository. A branch is simply a label for a certain commit, and when a new commit is made "on that branch", this label is moved to this most recent commit. A branch, in effect, includes the current commit and all parent commits recursively from that commit, meaning that its commit history will share all commits from before the branch was created as well as new commits "on that branch". I would use a branch to develop a new feature or try out something risky without impacting the main code/release version of the code.
