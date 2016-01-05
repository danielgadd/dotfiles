# Some Custom Autocomplete stuff

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' file-sort modification reverse
zstyle ':completion:*:default' menu 'select=0'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion::complete:cd:' tag-order local-directories path-directories
zstyle ':completion:*:functions' ignored-patterns '_*'                          # don't auto-complete internal functions (ones prefixed with _)
zstyle ':completion:*:warnings' format $'\e[01;31m-- No Matches Found --\e[0m'
zstyle ':completion:*:descriptions' format $'\e[01;33m-- %d --\e[0m'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' special-dirs true
