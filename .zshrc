# Lines configured by zsh-newuser-install

#256 color
export TERM="screen-256color"

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

#case $- in *i*)
#  if [ -z "$TMUX" ]; then exec tmux -2; fi;;
#esac
#
#export TERM=xterm-256color
#[ -n "$TMUX" ] && export TERM=screen-256color

cluster0="lumichael94@52.4.42.242"; export cluster0
cluster1="lumichael94@54.152.94.194"; export cluster1
cluster2="lumichael94@52.5.125.116"; export cluster2

PS1="%n%~%% "
export GOPATH=$HOME/Documents/go_projects
path+=('/usr/local/go/bin')
path+=('/sbin')
path+=($GOPATH/bin)
export PATH
export GOWKSP=$HOME/Documents/go_projects/src/github.com/lumichael94
export FLARECONF=$HOME/Documents/flare/flareConfig.json
export EDITOR="/usr/bin/vim"

cluster0="lumichael94@52.2.228.253"; export cluster0
cluster1="lumichael94@52.6.2.226"; export cluster1
cluster2="lumichael94@52.6.83.131"; export cluster2
cluster3="lumichael94@52.6.182.190"; export cluster3
cluster4="lumichael94@52.6.47.100"; export cluster4
cluster5="lumichael94@52.6.179.250"; export cluster5

elizaSSH="ptolemy@192.168.2.9"; export elizaSSH
dropSSH="root@104.236.34.39"; export dropSSH
serverSSH="ptolemy@192.168.2.5" export serverSSH
