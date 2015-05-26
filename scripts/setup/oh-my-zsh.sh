echo "\033[32mInstall oh-my-zsh"
echo "\033[0m"

if [ ! -d ~/.oh-my-zsh ]; then
  curl -L http://install.ohmyz.sh | sh
else
  echo "\033[32mSkipping, already exists"
  echo "\033[0m"
fi
