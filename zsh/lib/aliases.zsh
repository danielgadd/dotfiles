# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi
# List direcory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias sl=ls # often screw this up

alias afind='ack-grep -il'


# My Aliases used for commands I like to use:

alias ports='echo " " && echo -e "\033[1mListening Ports: ipv4\033[m" && netstat -tuan4 | grep LISTEN && echo " " && echo -e "\033[1mListening Ports: ipv6\033[m" && netstat -tuan6 | grep LISTEN'

alias ssh="rm ~/.ssh/config; cat ~/.ssh/conf.d/* | sed '/vim: set/d' > ~/.ssh/config && chmod 0600 ~/.ssh/config && ssh"
