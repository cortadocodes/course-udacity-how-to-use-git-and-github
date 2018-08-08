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