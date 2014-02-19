# Downloads dotfiles repository to current directory, then links vim dot-files
# into current user's home directory.
#
# Requires git.
#
# Easy run:
#
#   curl https://raw.github.com/wasbazi/dotfiles/master/get.vimfiles.sh | sh

# Put your github username on the next line
REPO_OWNER="wasbazi"
# REPO_HOST will generally be "github.com", but may be changed to something else
# if you're using a different git hosting service or if you have configured
# an alias in ~/.ssh/config, e.g. because you're using multiple identities.
REPO_HOST="github.com"
# The next line should contain the name of the repository.
REPO_NAME="dotfiles"
REPO_DIR=~/$REPO_NAME
GIT_REPO_URL="git@$REPO_HOST:$REPO_OWNER/$REPO_NAME.git"

echo -e "\033[32mDownloading repository."
echo -e "\033[0m"

git clone $GIT_REPO_URL $REPO_DIR

echo
echo -e "\033[32mUpdating submodules."
echo -e "\033[0m"

cd $REPO_DIR
git submodule update --init

echo
echo -e "\033[32mCreating dotfile links in home dir."
echo -e "\033[0m"

VIMHOME=`pwd`"/vim"

ln -s $VIMHOME      ~/.vim
ln -s ~/.vim/vimrc  ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
ln -s $REPO_DIR/bash_profile ~/.bash_profile
ln -s $REPO_DIR/tmux.conf ~/.tmux.conf
ln -s $REPO_DIR/jshintrc ~/.jshintrc

echo
echo -e "\033[32mCreating ~/.vim_tmp: where vim is configured to store temporary files."
echo -e "\033[0m"

mkdir ~/.vim_tmp

echo
echo -e "\033[32mVim dotfiles installed!"
echo -e "\033[0m"
