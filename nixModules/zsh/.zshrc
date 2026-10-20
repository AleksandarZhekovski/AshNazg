export ZSH_COMPDUMP=$ZDOTDIR/cache/.zcompdump-$HOST

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

setopt autocd
unsetopt beep
bindkey -e

autoload -U compinit && compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

source $ZDOTDIR/config/prompts.zsh
source $ZDOTDIR/config/aliases.zsh

