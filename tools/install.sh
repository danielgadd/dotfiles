#!/bin/bash

#Installer Script to install the zsh shell customisations.
#
#This is a run once installer as updates are pushed by either git _OR_ rsync pushing changes up

# What does this do:
# 1. check for zsh shell program - will error and exit if doesnt exsist
# 2. create symlink for zshrc to ~/.zshrc
# 3. create INSTALLED.file to stop the installation



if [ -f /usr/bin/zsh ];
then
   echo "File $FILE exists."
   if [ -f ~/.shell/tools/INSTALLED.file];
   then
      exit 0
   else
       ln -s ~/.zshrc ~/.shell/zshrc
       touch ~/.shell/tools/INSTALLED.file
       echo "Shell customisations installed"
       exit 0
else
   echo "zsh does not exist, falling back to bash."
   exit 0
fi

