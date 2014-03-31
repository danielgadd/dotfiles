########################################################
# 						       #
#                CUSTOMISED ZSH_SHELL                  #
#						       #
# This project is to create a zsh shell environment    #
# which is customised version oh oh-my-zsh             #
# and using basic scp/rysnc making the shell roamable. #
#						       #
########################################################

ToDo:
Copy over shell custom plugins and themes to current git
create test user/environment (vm)
Create .zshrc file

write bash script which will fire on ssh connect:
  1. Check if zsh is installed - if not exit
  2. look for installed file .installed
  3. diff local and remote copy
  4. reload zsh shell



Thoughts:
  1. Create argument in script to bypass zsh copy
  2. use .ssh/config file to specify global git repo (or file location)
  3. shell prompt should change based on user and local vs remote



