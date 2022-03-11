#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="[\W] "

set -o vi
bind -m vi-insert "\C-l":clear-screen 

export PATH=$PATH:~/.bin:~/.local/bin
export EDITOR='vim'
export EBOOKS_FOLDER=~/Documents/ebooks

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

alias v=$EDITOR

alias vf='file=$(find -type f | fzf) && vim $file'
alias cf='dir=$(find -type d | fzf) && cd $dir'
alias vff='file=$(find ~/ -type f | fzf) && vim $file'
alias cff='dir=$(find ~/ -type d | fzf) && cd $dir'

alias pac="sudo pacman"
alias mixer=pulsemixer
alias weather='curl wttr.in'
alias restart='pkill -USR1'

# dotfile manager
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


