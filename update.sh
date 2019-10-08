# Quick dirty script to update all plugins

#VIM
vim +PluginUpdate +qall

#ZSH (zplug)
zsh -ic "zplugin self-update"
zsh -ic "zplugin update -all"

#tmux (tpm)
 ~/.shell/tmux/plugins/tpm/bin/update_plugins all
