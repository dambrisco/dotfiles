# Downloads dotfiles repository to current directory, then links vim dot-files
# into current user's home directory.
#
# Requires git.
#
# Easy run:
#
#   curl https://raw.github.com/coderifous/dotfiles/master/get.vimfiles.sh | sh

# If you have a fork, change this variable.  The other ones should be fine.
REPO_OWNER="coderifous"


REPO_NAME="dotfiles"
GIT_REPO_URL="git://github.com/$REPO_OWNER/$REPO_NAME.git"

echo -e "\033[32mDownloading repository."
echo -e "\033[0m"

git clone $GIT_REPO_URL

echo
echo -e "\033[32mUpdating submodules."
echo -e "\033[0m"

cd $REPO_NAME
git submodule update --init

echo
echo -e "\033[32mCreating dotfile links in home dir."
echo -e "\033[0m"

VIMHOME=`pwd`"/vim"

ln -s $VIMHOME      ~/.vim
ln -s ~/.vim/vimrc  ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

echo
echo -e "\033[32mCreating ~/.vim_tmp: where vim is configured to store temporary files."
echo -e "\033[0m"

mkdir ~/.vim_tmp

echo
echo -e "\033[32mVim dotfiles installed!"
echo -e "\033[0m"
