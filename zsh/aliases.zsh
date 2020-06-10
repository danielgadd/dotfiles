# Define persnal zsh aliases here

alias irssi="TERM=screen-256color irssi"

# Add Colour to ls comman
#alias ls="ls -G --color"

# Use exa, not ls
alias ls="exa --icons"

# Stupid zsh autocorrect gets in my way...
alias killall="nocorrect killall"
alias docker="nocorrect docker"
alias pdk test unit='nocorrect pdk test unit'

# I use watch command, and sometimes having
# my aliases work with it is super useful
alias watch='watch '


# Set an alias for tmux (as it has problem with 256 colours)
alias tmux="tmux -2"

# I use pass, but typing "pass find and pass copy to find a password is WAY too hard
alias pc="pass -c \$(find ~/.password-store/ -name '*.gpg' | cut -d'/' -f 5-20 | sed 's/.gpg//' | fzf +m)"

# I also use lots of AWS IAM creds, and setting the export command is hard, and remembering every profile
# Using FZF and listing the creds from a file, is a time saver!
alias setaws="export AWS_PROFILE=\$(cat ~/.aws/credentials | grep '^\[.*\]' | cut -d'[' -f2 | cut -d ']' -f 1 | fzf +m)"

# Pass mdv off to docker, because the brew version isnt great, using a function here as its makes sense
function mdv() {
  docker run --rm -e 'MDV_THEME=889.8302' -v $PWD:/sandbox:ro -w /sandbox -it rawkode/mdv:latest $@
}

# gtt tracking - useful for tracking project work
function gtt() {
  docker run --rm -ti -v gtt-config:/root kriskbx/gitlab-time-tracker $@
}

# use fzf to open files into vim (with preview)
alias vf="vim \$(fzf --preview 'head -100 {}')"

# Copy/Paste anyone? (xclip on KDE isnt as straight-forward
alias copy="xclip -rmlastnl -selection clipboard"
alias past="xclip -o -rmlastnl -selection clipboard"

# Setup directory stack aliases
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias d='dirs -v | head -10'

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# Kubernetes?
alias k='kubectl'

# Minikube
alias mk='minikube'
alias mkd='minikube dashboard'

# DevOps commands, which I like to shorten
alias tf='terraform'
alias tfw='terraform workspace'

# start an SSM session? (without all the "extra" commandline fu
alias ssmc='aws ssm start-session --target'

## DISABLED as the plgin uses hardcodes dependencies and they error on zplugin updates
# Spotify Controls
#alias spp='spotify play'
#alias sppa='spotify pause'
#alias spn='spotify next'
#alias spl='spotify previous'
#alias spst='spotify status'

# Extra Git Stuff
alias gbv="gb -vva"
alias gpo="gp origin"

alias glg="nocorrect git lg"

# docker commands
alias dps="docker ps"
alias dpsa="docker ps -a"

# Useful Docker containers
alias 1804dev="docker run -ti --rm ubuntu:18.04 /bin/bash"

# Development Commands
alias tclsh="rlwrap tclsh"

# Just because:
alias yolo="git commit -am \"DEAL WITH IT\" && git push -f origin master"

# Git
# Aliases
# (sorted alphabetically)

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbr='git branch --remote'
alias gc='git commit -v'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias glg='git log --stat'
alias gm='git merge'
alias gp='git push -v'
alias gpu='git push upstream'
alias gr='git remote'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grh='git reset'
alias grv='git remote -v'
alias gsh='git show'
alias gsps='git show --pretty=short --show-signature'
alias gst='git status'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
