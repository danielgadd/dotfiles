# Define persnal zsh aliases here

alias ports='echo " " && echo -e "\033[1mListening Ports: ipv4\033[m" && netstat -tuan4 | grep LISTEN && echo " " && echo -e "\033[1mListening Ports: ipv6\033[m" && netstat -tuan6 | grep LISTEN'
alias ssh="rm ~/.ssh/config; cat ~/.ssh/conf.d/* | sed '/vim: syntax/d' > ~/.ssh/config && chmod 0600 ~/.ssh/config && ssh"
alias irssi="TERM=screen-256color irssi"

# Stupid zsh autocorrect gets in my way...
alias killall="nocorrect killall"
alias docker="nocorrect docker"

# Who uses vi? We have vim - this just gets in my way....
alias vi="vim"

# Set an alias for tmux (as it has problem with 256 colours)
alias tmux="tmux -2"

# Setup BTRFS command aliases
alias btrdf="sudo btrfs filesystem show"


# Docker Stuff
alias tor-browser="xhost +local:docker; docker rm tor-browser; docker run -dit -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --name tor-browser jess/tor-browser"

  # docker commands
  alias dps="docker ps"
  alias dpsa="docker ps -a"

# Development Commands
alias tclsh="rlwrap tclsh"
