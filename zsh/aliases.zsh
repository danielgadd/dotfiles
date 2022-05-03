# Define persnal zsh aliases here

# Use exa, not ls
alias ls="exa --icons"

# Stupid zsh autocorrect gets in my way...
alias killall="nocorrect killall"

# I use watch command, and sometimes having
# my aliases work with it is super useful
alias watch='watch '

# python2 is dead
alias python='python3'

# Set an alias for tmux (as it has problem with 256 colours)
alias tmux="tmux -2"

# I use pass, but typing "pass find and pass copy to find a password is WAY too hard
alias pc="pass -c \$(find ~/.password-store/ -name '*.gpg' | cut -d'/' -f 5-20 | sed 's/.gpg//' | fzf +m)"

# I also use lots of AWS IAM creds, and setting the export command is hard, and remembering every profile
# Using FZF and listing the creds from a file, is a time saver!
# Turns out, the aws OMZ plugin handles reading the config files, so this is MUCH leaner
alias setaws="export AWS_PROFILE=\$(aws_profiles | fzf +m)"

# Along with setaws, granted is pretty sweet and supports profiles inside browers!
alias assume="source assume"

# While Im using setaws over assume to do my IAM role mgmt, the -ar flag for assume is super useful!
alias awsconsole="assume -ar"

# Pass mdv off to docker, because the brew version isnt great, using a function here as its makes sense
function mdv() {
  docker run --rm -e 'MDV_THEME=889.8302' -v $PWD:/sandbox:ro -w /sandbox -it rawkode/mdv:latest $@
}

# gtt tracking - useful for tracking project work
function gtt() {
  docker run --rm -ti -v gtt-config:/root kriskbx/gitlab-time-tracker $@
}

# Shorten brew commands
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'

# Same as above, but with a 'g' for "greedy" (casks)
alias bubog='brew update && brew outdated --greedy'
alias bubcg='brew upgrade --greedy && brew cleanup'

# use fzf to open files into vim (with preview)
alias vf="vim \$(fzf --preview 'head -100 {}')"

# Copy/Paste anyone? (xclip on KDE isnt as straight-forward
#alias copy="xclip -rmlastnl -selection clipboard"
#alias past="xclip -o -rmlastnl -selection clipboard"

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
alias kd='kubectl describe'
alias kg='kubectl get'
alias kk='kubectl krew'
alias kges='kubectl get externalsecrets.kubernetes-client.io'
alias kdes='kubectl describe externalsecrets.kubernetes-client.io'

# In Kubectl the autocomplete on set-context is broken :(
# So, lets fzf it...
alias kcnf="kcn \$(kgns -o=Name | cut -d'/' -f 2 | fzf +m)"

# Minikube
alias mk='minikube'
alias mkd='minikube dashboard'

# Terraform commands, which I like to shorten
alias tf='terraform'
alias tfw='terraform workspace'
alias tfws='terraform workspace select'

# start an SSM session? (without all the "extra" commandline fu
#alias ssmc='aws ssm start-session --target'

# ^ On second thought, lets use fzf to get the instanceID
# Call aws CLI alias to keep this command simple!
alias ssmc="aws ssm start-session --target \$(aws ssmc-instance-list | fzf +m | cut -d$'\t' -f1)"

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

# Youtube DL anyone?
alias ydl='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data --security-opt label=disable vimagick/youtube-dl'

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
alias gcm='git checkout $(git_main_branch)'
alias gcd='git checkout dev'
alias gcs='git checkout stage'
alias gcp='git checkout prod'
alias gco='git checkout'
alias gcob='git checkout -b'
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
alias gr='git restore'
alias grs='git restore --staged'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grh='git reset'
alias grv='git remote -v'
alias gsh='git show'
alias gsps='git show --pretty=short --show-signature'
alias gst='git status'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gap='git add -p'

# source work specific aliases, which I dont keep in GitHub
source ~/.shell/zsh/work-aliases.zsh
