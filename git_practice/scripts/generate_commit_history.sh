#!/usr/bin/env bash

# This script generates a simple sample git repository with a few commits. Its intended use is to provide an
# easy-to-understand repo that can be used for practicing and understanding git operations such as rebases, squashes,
# hard pushes, pulls and resets. The sample repo is created in the directory $REPO_NAME wherever the script is called.

REPO_NAME="sample_git_repository"
FILE_1="file_1.txt"
FILE_2="file_2.txt"
FILE_3="file_3.txt"
DATA_FILE_1="data_file_1.csv"
DATA_FILE_2="data_file_2.csv"

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

# This is only executed if a new repo is created, or if the user chooses to overwrite an existing repository

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

# Remove file_2 from the repo
git rm $FILE_1
git commit -m "Commit 5 - Remove file_1"

# Add some untracked data files
mkdir data
cd data
echo "1,2,3,4,5" > $DATA_FILE_1
echo "espresso, flat white, cortado, long black, macchiato" > $DATA_FILE_2
