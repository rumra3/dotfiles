# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# generate this file w/ `zkbd`
if [ -f "$HOME/.zkbd/keys" ]; then
    source $HOME/.zkbd/keys
    bindkey "${key[Delete]}" delete-char
    bindkey "${key[Backspace]}" backward-delete-char
fi

source $HOME/.env
source $HOME/.aliases
export PS1="%n@%m:%F{75}%1~ %(!.#.$)%f "

precmd () { print -Pn "\e]2;$TERM - %/\a" } # title bar prompt

export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/opt/odin"
export PATH="$PATH:/opt/zen"
