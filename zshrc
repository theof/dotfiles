export BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export LANG=en_US.UTF-8

export PATH=$HOME/scripts:$PATH
if [[ `uname` == 'Darwin' ]]; then
    export PATH="$HOME/.brew/bin:$HOME/Library/Python/2.7/bin:$PATH"
		export MANPATH="$HOME/.brew/share/man:/usr/share/man:/usr/local/share/man/"
fi

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

powerline-daemon -q
. /Users/tvallee/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# History completion with arrows
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
