#!/usr/bin/env bash

REPO_NAME="sample_git_repository"
FILE_1="file_1.txt"
FILE_2="file_2.txt"

create_repo() {
    mkdir $REPO_NAME
    cd $REPO_NAME
    git init
    echo -e "\nCreated new git repository in $REPO_NAME \n"
}

if [ ! -d $REPO_NAME ]; then
    create_repo
else
    while true; do
        read -p "Sample repository already exists: would you like to overwrite it? " choice

        case $choice in
            [Yy]* )
                rm -rf $REPO_NAME;
                create_repo
                echo -e "Overwritten $REPO_NAME \n";
                break
                ;;

            [Nn]* ) exit;;
            * ) echo "Please answer yes or no:";;

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
git commit -m "Add initial files"
