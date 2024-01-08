#
# kam's bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1='\[\e[38;5;12m\]<\[\e[38;5;14m\]3\[\e[0m\]|[\w]\$ '

case ${TERM} in
  Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
    PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')

    ;;
  screen*)
    PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
esac

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# inputrc commands
bind 'set editing-mode vi'
bind 'set bell-style none'
bind 'set completion-ignore-case On'
bind 'set show-all-if-ambiguous On'
bind 'set colored-stats On'
bind 'set visible-stats On'
bind 'set mark-symlinked-directories On'
bind 'set colored-completion-prefix On'
bind 'set menu-complete-display-prefix On'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# My Commands
# fastfetch --logo $(find /run/media/kam/2ndhdd/Documents/ascii-art -type f | shuf -n 1)
fastfetch
set -o noclobber
shopt -s autocd
complete -d cd
complete -F _command doas
printf 'Microsoft Windows [Version 6.1.7601] \nCopyright <c> 2009 Microsoft Corporation. All rights reserved.\n\n'

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# History Settings
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Alias's
alias q='exit'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias ls='ls -aFh --color=always'
alias n3='nnn -aCDEHU -T v -P p'
alias vi='neatvi'
alias g='cd ~/.local/src'
alias update-dwm='cd ~/.local/src/dwm_klaymaji && doas make clean install && pkill dwm'
alias update-nnn-plugins='sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"'
alias crispydoom='flatpak run io.github.fabiangreffrath.Doom'
