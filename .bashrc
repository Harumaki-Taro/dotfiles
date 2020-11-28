#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
[ -r $HOME/.config/byobu/prompt ] && . $HOME/.config/byobu/prompt   #byobu-prompt#
