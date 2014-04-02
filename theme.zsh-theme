# Custom ZSH Shell theme

#-----------------------------------------------------------------------------------------------------------------------------
# Sets the user@m in the prompt shell if connected to a remote server (ssh)
prompt_context() {
  local user=`whoami`

  if [[ "$USER" != "daniel" || -n "$SSH_CLIENT" ]]; then
    echo -n "%(!.%{%F{yellow}%}.)$user@%m"
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
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
  
  echo -n "%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}"
}

#-----------------------------------------------------------------------------------------------------------------------------
#Create directory prompt segment

prompt_directory (){
  echo -n "$fg[cyan]%}%~ "
}

#-----------------------------------------------------------------------------------------------------------------------------
#Set screen prompt if attached to screen session:

prompt_screenID (){
 if [ -n "$STY" ]; then
    echo -n "%{$fg_bold[blue]%}screen:%{$fg[red]%}$(echo $STY | cut -d'.' -f 1 | cut -d'=' -f 2)%{$fg_bold[blue]%} % %{$reset_color%}"
 fi
}
#-----------------------------------------------------------------------------------------------------------------------------
#Build prompt from functions

build_prompt (){
  RETVAL=$?
  prompt_context
  prompt_directory
  prompt_screenID
  prompt_git
  prompt_status
}

#build prompt by calling all functions together
PROMPT='$(build_prompt)'

