DIRLIST="
ssh
vim
"

FILELIST="
vimrc
bashrc
gitignore
gitconfig
hgrc
"

DOTFILE_DIR=`pwd`

if [ ! -e $DOTFILE_DIR/old_files ]; then

echo "Moving old files to $DOTFILE_DIR"
    mkdir $DOTFILE_DIR/old_files
    for DIR in ${DIRLIST};
    do
        mv ~/.${DIR} $DOTFILE_DIR/old_files/
    done
    for FILE in ${FILELIST};
    do
        mv ~/.${FILE} $DOTFILE_DIR/old_files/
    done

echo "Linking Directories and Files"
    for FILE in ${FILELIST};
    do
        ln -s $DOTFILE_DIR/${FILE} ~/.${FILE}
    done
    for DIR in ${DIRLIST};
    do
        ln -s $DOTFILE_DIR/${DIR} ~/.${DIR}
	# this removes the self-ln from above
        rm ~$DOTFILE_DIR/${DIR}/${DIR}
    done
    sudo apt-get install exuberant-ctags
else
    echo "$DOTFILE_DIR/oldfiles exists, please clean up before running"
fi

