#!/bin/bash

#Installer Script to install the zsh shell customisations.
#
#This is a run once installer as updates are pushed by either git _OR_ rsync pushing changes up

# What does this do:
# 1. check for zsh shell program - will error and exit if doesnt exsist
# 2. create symlink for zshrc to ~/.zshrc
# 3. Install .vim and ~/.vimrc
# 3. create INSTALLED.file to stop the installation


if [ -f /bin/zsh ]
then
  echo "zsh found - setup can continue."
else
  echo "zsh shell could not be found. Exiting to bash."
  exit 0
fi
# Keep it simple

 # Setup ZSH and zplugins
 ln -s ~/.shell/zsh/zshrc ~/.zshrc
 git clone https://github.com/zdharma/zplugin.git ~/.shell/zsh/zplugin/bin

 # Setup Vim and Vundle
 ln -s ~/.shell/vim/vimrc ~/.vimrc
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.shell/vim/bundle/Vundle.vim
 vim +PluginInstall +qall

 # setup tmux and tpm
 ln -s ~/.shell/tmux/tmux.conf ~/.tmux.conf
 git clone https://github.com/tmux-plugins/tpm ~/.shell/tmux/plugins/tpm && ~/.shell/tmux/plugins/tpm/bin/install_plugins
 exit 0
