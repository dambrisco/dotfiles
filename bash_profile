# ~/.bash_profile: executed by bash for login shells.

if [ -e ~/.bashrc ] ; then
  . ~/.bashrc
fi

if [ -e ~/dotfiles/bashrc ] ; then
  . ~/dotfiles/bashrc
fi

# Put all local machine customizations in ~/.bash_local
if [ -e ~/.bash_local ] ; then
  . ~/.bash_local
fi

