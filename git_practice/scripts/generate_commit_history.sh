#!/usr/bin/env bash

# This script generates a simple sample git repository with a few commits. Its intended use is to provide an
# easy-to-understand repo that can be used for practicing and understanding git operations such as rebases, squashes,
# hard pushes, pulls and resets. The sample repo is created in the directory $REPO_NAME wherever the script is called.

REPO_NAME="sample_git_repository"
FILE_1="file_1.txt"
FILE_2="file_2.txt"
FILE_3="file_3.txt"
FILE_4="file_4.txt"
FEATURE_FILE_1="feature_file_1.txt"
FEATURE_FILE_2="feature_file_2.txt"

create_repo() {
    mkdir $1
    cd $1
    git init
    echo -e "\nCreated new git repository in $1 \n"
}

overwrite_repo() {
    rm -rf $1;
    create_repo $1
    echo -e "Overwritten $1 \n";
}

# If the repository exists
if [ ! -d $REPO_NAME ]; then
    create_repo $REPO_NAME
else
    while true; do
        read -p "Sample repository already exists: would you like to overwrite it? " choice

        case $choice in
            [Yy]* )
                overwrite_repo $REPO_NAME
                break
                ;;

            [Nn]* )
                exit;;

            * )
                echo "Please answer yes or no:";;

        esac
    done
fi

# Create the initial files and commit them
cat > $FILE_1 <<- EOM
Initial line A in file 1
Initial line B
EOM

cat > $FILE_2 <<- EOM
Initial line A in file 2
Initial line B
EOM

git add $FILE_1 $FILE_2
git commit -m "Commit 1 - Add initial files"

# Make some changes to the files
echo "New line C from second commit" >> $FILE_1
git add $FILE_1
git commit -m "Commit 2 - Add a new line to file_1"

echo "New line C from second commit" >> $FILE_2
git add $FILE_2
git commit -m "Commit 3 - Add a new line to file_2"

# Add a new file to the repo
cat > $FILE_3 <<- EOM
Line A - this
Line B - is
Line C - third
Line D - sample
Line E - file
EOM
git add $FILE_3
git commit -m "Commit 4 - Add a third file"

git rm $FILE_1
git commit -m "Commit 5 - Remove file_1"

# Checkout a feature branch and add a few commits
git checkout -b feature-branch

cat > $FEATURE_FILE_1 <<- EOM
Alpha
Beta
Gamma
Delta
EOM
git add $FEATURE_FILE_1
git commit -m "Commit 6 (feature branch) - Add feature_file_1"

cat > $FEATURE_FILE_2 <<- EOM
Epsilon
Zeta
Eta
Theta
Iota
EOM
git add $FEATURE_FILE_2
git commit -m "Commit 7 (feature branch) - Add feature_file_2"

# Checkout master, add a new file and commit so the two branches are out of sync
git checkout master

cat > $FILE_4 <<- EOM
This file makes master become out of sync with feature-branch
EOM
git add $FILE_4
git commit -m "Commit 6 (master branch) - Add file_4"
