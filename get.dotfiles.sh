# Downloads dotfiles repository to current directory, then links dot-files
# into current user's home directory.
#
# Requires git.
#
# Easy run:
#
#   curl https://raw.github.com/wasbazi/dotfiles/master/get.dotfiles.sh | sh

REPO_OWNER="wasbazi"
REPO_HOST="github.com"
REPO_NAME="dotfiles"
REPO_DIR=~/$REPO_NAME
GIT_REPO_URL="git@$REPO_HOST:$REPO_OWNER/$REPO_NAME.git"

if [ ! -d ~/dotfiles ]; then
  echo "\033[32mDownloading repository."
  echo "\033[0m"

  git clone $GIT_REPO_URL $REPO_DIR
fi

echo "\033[32mDotfiles installed!"
echo "\033[0m"

SCRIPT_DIR="$REPO_DIR/scripts/setup"
if [ ! -z "$1" ]; then
  case "$1" in
    essential)
      $SCRIPT_DIR/essential-programs.sh
      ;;
    links)
      $SCRIPT_DIR/links.sh
      ;;
    zsh)
      $SCRIPT_DIR/oh-my-zsh.sh
      ;;
    vim)
      $SCRIPT_DIR/vim.sh
      ;;
    *)
      echo $"Usage: $0 {essential|links|zsh|vim}"
      exit 1
  esac
  exit 0
fi


$SCRIPT_DIR/essential-programs.sh
$SCRIPT_DIR/links.sh
$SCRIPT_DIR/oh-my-zsh.sh
$SCRIPT_DIR/vim.sh
