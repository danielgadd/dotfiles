# Define persnal zsh aliases here

alias ports='echo " " && echo -e "\033[1mListening Ports: ipv4\033[m" && netstat -tuan4 | grep LISTEN && echo " " && echo -e "\033[1mListening Ports: ipv6\033[m" && netstat -tuan6 | grep LISTEN'
alias ssh="rm ~/.ssh/config; cat ~/.ssh/conf.d/* | sed '/vim: syntax/d' > ~/.ssh/config && chmod 0600 ~/.ssh/config && ssh"
alias irssi="TERM=screen-256color irssi"

# Set an alias for tmux (as it has problem with 256 colours)
alias tmux="tmux -2"


# Docker Stuff
alias tor-browser="xhost +local:docker; docker rm -f tor-browser && docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --name tor-browser jess/tor-browser"
  # docker commands
  alias dps="docker ps"
  alias dpsa="docker ps -a"
