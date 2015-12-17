#!/bin/bash

#Installer Script to install the zsh shell customisations.
#
#This is a run once installer as updates are pushed by either git _OR_ rsync pushing changes up

# What does this do:
# 1. check for zsh shell program - will error and exit if doesnt exsist
# 2. create symlink for zshrc to ~/.zshrc
# 3. Install .vim and ~/.vimrc
# 3. create INSTALLED.file to stop the installation


if [ -f /usr/bin/zsh ]
then
  echo "zsh found - setup can continue."
else
  echo "zsh shell could not be found. Exiting to bash."
  exit 0
fi

if [ -f ~/.shell/tools/INSTALLED.file ];
   then
      exit 0
   else
       ln -s ~/.shell/zsh_customisations/zshrc ~/.zshrc
       ln -s ~/.shell/zsh_customisations/*.zsh* ~/.shell/zsh/custom/
       touch ~/.shell/tools/INSTALLED.file
       ln -s ~/.shell/vim/ ~/.vim
       ln -s ~/.shell/vim/vimrc ~/.vimrc
       mkdir ~/.i3/
       ln -s ~/.shell/i3/i3_config ~/.i3/config
       ln -s ~/.shell/tools/gitconfig ~/.gitconfig
       echo "Shell customisations installed"
       ln -s ~/.shell/irb/irbrc ~/.irbrc
       ln -s ~/.shell/irb/boson/commands/common ~/.boson/commands/common
       echo "IRB Customisations Installed"
       ln -s ~/.shell/tools/gemrc ~/.gemrc
       echo "gemrc Customisations Installed"
       exit 0
fi
