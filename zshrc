export LANG=en_US.UTF-8
export EDITOR=vim

export PATH=$HOME/scripts:$HOME/.npm/bin:$HOME/.cargo/bin:$PATH
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory extendedglob
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/theophile/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# History completion with arrows
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

alias "ls"="ls --color=auto"

local_conf="$HOME/.zshrc.local"
if [ -e "$local_conf" ]
then
	source "$local_conf"
fi
