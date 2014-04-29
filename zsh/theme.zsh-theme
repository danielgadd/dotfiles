#!/bin/bash

# Custom ZSH Shell theme

#-----------------------------------------------------------------------------------------------------------------------------
# Sets the user@m in the prompt shell if connected to a remote server (ssh)
prompt_context() {
  local user=`whoami`

  if [[ "$USER" != "daniel" || -n "$SSH_CLIENT" ]]; then
    echo -n "%{$fg_bold[red]%}ssh:%{$reset_color%}%(!.%{%F{yellow}%}.)$user@%m: "
 fi
}

#-----------------------------------------------------------------------------------------------------------------------------
#Set prompt status:

prompt_status() {
  local ret_status="%(?:%{$fg_bold[green]%}> :%{$fg_bold[red]%}> %s)"
  echo -n "${ret_status}%{$fg_bold[green]%}%p"

}

#-----------------------------------------------------------------------------------------------------------------------------
#set git prompt (if in git repo):

prompt_git (){
  #set environment vars
    ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"

  # Green tick if repo is clean
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}) ✔"

  #set prompt style based on the vars set above from lib/git.zsh
  echo -n "%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}"
}

#-----------------------------------------------------------------------------------------------------------------------------
# show if current branch is ahead or behind
prompt_git_branchstatus () {
    ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[red]%}↓%{$reset_color%}|"
    ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[red]%}↑%{$reset_color%}|"
    ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[red]%}↓%{$fg_bold[green]%}↑%{$reset_color%}|"
    echo -n "$(git_remote_status)"
}

#-----------------------------------------------------------------------------------------------------------------------------
#Create directory prompt segment

prompt_directory () {
  echo -n "$fg[cyan]%}%~ "
}

#-----------------------------------------------------------------------------------------------------------------------------
#Set screen prompt if attached to screen session:

prompt_screenID (){
 if [ -n "$STY" ]; then
   echo -n "%{$fg_bold[blue]%}screen:%{$fg[red]%}($(echo $STY | cut -d'.' -f 1 | cut -d'=' -f 2))%{$fg_bold[blue]%} % %{$reset_color%}"
 fi
}

#-----------------------------------------------------------------------------------------------------------------------------
#Show symbol on rprompt if there are detached tmux sessions

prompt_detachedtmuxalert (){
  if [ -n "$(tmux ls | grep -v attached 2> /dev/null)" ]; then
   echo -n "%{$fg_bold[red]%} ●%{$reset_color%}"
  fi
}

#-----------------------------------------------------------------------------------------------------------------------------
#Show symbol on rprompt if there are detached screens

prompt_detachedscreenalert (){
  if [[ -n $(ls /var/run/screen/S-$USER 2> /dev/null ) ]]; then
   echo -n "%{$fg_bold[red]%} ●%{$reset_color%}"
  fi
}

#-----------------------------------------------------------------------------------------------------------------------------
# Set RPROMPT showing command history

prompt_cmdhistory () {
  echo -n " %B!%{%B%F{cyan}%}%!%{%f%k%b%}"
}

#-----------------------------------------------------------------------------------------------------------------------------
# get short commit ID if in GIT repo

prompt_gitcommit_sha () {
  if [[ -d $(git rev-parse --show-toplevel 2>/dev/null) ]]; then
    echo -n "%B$FG[yellow]$(git_prompt_short_sha)%{$reset_color%} |"
  fi
}

#-----------------------------------------------------------------------------------------------------------------------------
# Set RPROMPT showing current time

prompt_time () {
  echo -n " %{$reset_color%}%{%F{cyan}%}%@%{%f%k%b%}"
}

#-----------------------------------------------------------------------------------------------------------------------------
#Build prompt from functions - Order is Important

build_prompt (){
  RETVAL=$?
  prompt_context
  prompt_directory
  prompt_screenID
  prompt_git
  prompt_status
}

#-----------------------------------------------------------------------------------------------------------------------------
# Build rprompt from functions

build_rprompt () {
  prompt_gitcommit_sha
  prompt_git_branchstatus
  #prompt_cmdhistory
  prompt_detachedscreenalert
  prompt_detachedtmuxalert
  prompt_time
}

#-----------------------------------------------------------------------------------------------------------------------------
#build prompt by calling all functions together
PROMPT='$(build_prompt)'
RPROMPT='$(build_rprompt)'
