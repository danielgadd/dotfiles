#!/bin/bash

#This is a roaming Check script called by ssh on connect with LocalCommand and passing variables to the script.

#Things to do:
# 1. - SSH to remote and see if zsh is installed:
# 	- IF TRUE : start rysnc/GIT to upload/update shell files
#	          : call the "intall.sh file
#		  : change default shell (ASK) and drop into zsh
#	- IF FALSE: error message and drop to "bash -l"


# This script is called with LocalCommand "~/.ssh/roaming.sh %h %p %u " which sets the following:
#	$1 = %h (IP_ADDR/Hostname)
#	$2 = %p (PORT) - Will check its 22 - otherwise exit as its a non-default port
#	$3 = %u (USER)
#
# EG: ~/.ssh/roaming.sh 192.168.0.1 22

if ssh $3@$1  "[ -f /usr/bin/zsh ]"
then
  LocalCommand eval /usr/bin/rsync --delete -azvue ssh /development/zsh_shell/ %r@%h:~/.shell/
  else
    echo "zsh shell could not be found. Exiting to bash."
  exit 0
fi
