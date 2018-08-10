# Lesson 1 reflections

## How did viewing a diff between two versions help you spot the bug?
* It meant that we didn't have to scroll through the new and old files and manually compare every line of code; this is very time-consuming and not scaleable or practical for large files
* Using diff just highlights the lines of code where there are differences, meaning we can instantly see where the old file changed/is different from the new file
* We can also easily see whether the change is an additive or deductive change
* All of this makes it easy to see where we have made both intended and unintended changes

## How could having easy access to the entire history of a file make you a more efficient programmer in the long term?
* You will easily be able to see previous ways you've coded things and places where, in retrospect, you can see you've made a mistake
* This means you can easily go back to find and fix a bug or, conversely, restore a previous better approach to a problem

## What do you think are the pros and cons of manually choosing when to create a commit, like you do in Git, vs having versions automatically saved, like Google Docs does?
Pros of manually committing:
* Commits can be in line with logical changes, making them easier to understand and debug

Cons:
* Easy to forget to commit at the right points, meaning logical commits can become polluted with other unrelated changes, or work can be lost more easily

## Why do you think some version control systems, like Git, allow saving multiple files in one commit, while others, like Google Docs, treat each file separately?
I think some version control systems are geared towards dealing with one file at a time (e.g. Google Docs) whereas others are designed for users who need to make concurrent changes across multiple files (e.g. git). Both have different use cases and are useful in different circumstances.

## How can you use the commands git log and git diff to view the history of files?
* git log - shows the commit history of the repository, including a message describing the commit and the amount of insertions and deletions if `--stat` is included
* git diff - shows the difference between two versions of a file from two different commits, including whether a difference is an insertion or a deletion.

## How might using version control make you more confident to make changes that could break something?
As every single change can be found and reverted if necessary, there's no need to worry about breaking code because you can simply undo your changes to fix what you've broken. You can also work on branches to further separate any risky changes from your master branch code.
