echo "\033[32mCreating dotfile links in home dir."
echo "\033[0m"

VIMHOME=`pwd`"/vim"

ln -s $VIMHOME ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

ln -sf $REPO_DIR/zsh/zshrc ~/.zshrc
ln -s $REPO_DIR/tmux.conf ~/.tmux.conf

ln -s $REPO_DIR/lint/jshintrc ~/.jshintrc
ln -s $REPO_DIR/lint/eslintrc ~/.eslintrc
