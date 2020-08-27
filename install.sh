#!/bin/bash

#Installer Script to install the zsh shell customisations.
#
#This is a run once installer as updates are pushed by either git _OR_ rsync pushing changes up

# What does this do:
# 1. check for zsh shell program - will error and exit if doesnt exsist
# 2. create symlink for zshrc to ~/.zshrc
# 3. Install .vim and ~/.vimrc
# 3. create INSTALLED.file to stop the installation

if ! [ -x "$(command -v zsh)" ]; then
  echo 'ERROR: zsh executable not found.' >&2
  exit 1
fi

if ! [ -x "$(command -v git)" ]; then
  echo 'ERROR: git executable not found.' >&2
  exit 1
fi

if ! [ -x "$(command -v vim)" ]; then
  echo 'ERROR: vim executable not found.' >&2
  exit 1
fi

if ! [ -x "$(command -v tmux)" ]; then
  echo 'ERROR: tmux executable not found.' >&2
  exit 1
fi


# Keep it simple

 # Setup ZSH and zplugins
 ln -s ~/.shell/zsh/zshrc ~/.zshrc
 git clone https://github.com/zdharma/zinit.git ~/.shell/zsh/zinit/bin

 # Setup Vim and Vundle
 ln -s ~/.shell/vim/vimrc ~/.vimrc
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.shell/vim/bundle/Vundle.vim
 vim +PluginInstall +qall

 # setup tmux and tpm
 ln -s ~/.shell/tmux/tmux.conf ~/.tmux.conf
 git clone https://github.com/tmux-plugins/tpm ~/.shell/tmux/plugins/tpm && ~/.shell/tmux/plugins/tpm/bin/install_plugins

 # git
 ln -s ~/.shell/gitconfig ~/.gitconfig
 ln -s ~/.shell/git ~/.git_hooks
 exit 0
