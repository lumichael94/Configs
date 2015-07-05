# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dev/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

case $- in *i*)
  if [ -z "$TMUX" ]; then exec tmux -2; fi;;
esac

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

cluster0="lumichael94@52.4.42.242"; export cluster0
cluster1="lumichael94@54.152.94.194"; export cluster1
cluster2="lumichael94@52.5.125.116"; export cluster2

PS1="%n@%~%% "
