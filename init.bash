DIRLIST="
ssh
vim
"

FILELIST="
vimrc
bashrc
gitignore
gitconfig
"

if [ ! -e ~/dotfiles/old_files ]; then
    #move old files
    mkdir ~/dotfiles/old_files
    for DIR in ${DIRLIST};
    do
        mv ~/.${DIR} ~/dotfiles/old_files/
    done
    for FILE in ${FILELIST};
    do
        mv ~/.${FILE} ~/dotfiles/old_files/
    done

    #link dir and files
    for FILE in ${FILELIST};
    do
        ln -s ~/dotfiles/${FILE} ~/.${FILE}
    done
    for DIR in ${DIRLIST};
    do
        ln -s ~/dotfiles/${DIR} ~/.${DIR}
        rm ~/dotfiles/${DIR}/${DIR}
    done

fi

sudo aptitude install exuberant-ctags
