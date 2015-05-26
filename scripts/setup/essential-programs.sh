echo "\033[32mInstall brew"
echo "\033[0m"

if [ command -v brew >/dev/null 2>&1 ]; then
  ruby "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  echo "\033[32mChecking if brew has issues"
  echo "\033[0m"
  brew doctor
else
  echo "\033[32mSkipping install, checking up-to-date"
  echo "\033[0m"
  brew update
fi

echo "\033[32mInstall tmux"
echo "\033[0m"

if [ command -v tmux >/dev/null 2>&1 ]; then
  brew install tmux
else
  echo "\033[32mSkipping, already installed"
  echo "\033[0m"
fi

