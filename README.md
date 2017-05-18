## Quick start

    curl https://raw.github.com/dambrisco/dotfiles/master/install.sh | sh

This clones the repo, downloads all the submodules, and links the vim-related dotfiles into
the current user's home directory.  Running this command should get you up and
running with this vim config without any other work.

## Make it your own

If you want to copy this Vim config as a base for your own, you should:

* Fork this repository.
* Change the mention of "dambrisco" in the install.sh script to your own
  github name.
* Customize the vim config to suit you.

## Highlights

### Turbo Button

This Vim config supports two runtime profiles:

* Normal, with all plugins loaded.
* Minimal, with no plugins loaded. Super fast startup!

To run Vim without loading plugins use the --noplugins option.
e.g.

    vim --noplugins

I recommend setting your EDITOR environment variable to use this option:

    export EDITOR="vim --noplugin"

This way you'll have a faster startup when other programs (e.g. git) bring up
Vim.

### vimrc Organization

This Vim config (loaded from .vimrc) is broken up across several files that are
sourced.  Each file performs a different kind of customization.  For instance
one file is responsible for customizing vim settings, while another file
is responsible for defining custom key mappings.  All plugin-related
configuration is stored in it's own file that is loaded conditionally depending
on whether the --noplugins flag was used.

### Vundle

This Vim config uses the [Vundle](https://github.com/gmarik/Vundle.vim) plug-in
manager. Each plugin is listed in the `vim_plugin_definitions` file.

### Plugins

Take a look at the vim_bundles file to see all of the included plugins.

Here's a few faves:

* [NerdTree](http://github.com/scrooloose/nerdtree) - The missing file drawer for Vim.
* [fugitive](http://github.com/tpope/vim-fugitive) - killer git plugin for vim
* [surround](http://github.com/tpope/vim-surround) - quoting/parenthesizing made simple
* [AutoClose](http://github.com/vim-scripts/AutoClose) - inserts matching bracket, paren, brace or quote
* [tComment](http://github.com/vim-scripts/tComment) - comment plugin

### Additional things to install

If you use this set up there are a few things that you should remember to
install
Having trouble with tmux? `brew install reattach-to-user-namespace`
Color issues in iTerm? Import visor from the dotfiles folder and set minimum
contrast to the middle
Airline missing fonts? Include the fonts in the fonts folder to your computers
font directory
Missing syntax highlighting? Download the zsh plugin,
[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
