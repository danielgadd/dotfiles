My Dotfiles Repo
------------------

This is my personal git repo for my dofiles I use on my computers.

Most stuff is from other repos and blog sites, but needed to put it somewhere as my local git server (raspberry pi) isnt very reliable.

## Installation

for linux:
`git clone https://github.com/daniel-gadd/dotfiles.git ~/.shell && ~/.shell/tools/install.sh`

## What is covered?

I Have the following config Files in this repo:
* i3wm
* tmux
* zsh
* terminal fonts
* IRB ruby shell

## Notes

### How to update the zsh submodule:

* `cd zsh`
* `git fetch`
* `git pull origin master`
* add the `/zsh` folder using `git add`
* Commit Changes and push
