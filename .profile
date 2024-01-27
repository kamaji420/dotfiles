export HISTFILE="$HOME/.cache/bash_history"
export EDITOR=neatvi
export VISUAL=neatvi
export PATH="$HOME/.local/bin:/var/lib/flatpak/exports/bin:$PATH"
export GTK_THEME=klaymaji-themix-qam
source $HOME/.config/bash/bashrc

# NNN Configuration
export NNN_OPTS="aCDEHU"
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export NNN_PLUG='p:preview-tui;f:fzcd'
export NNN_TMPFILE='/tmp/.lastd'
export NNN_TERMINAL=tmux

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec sx
fi
