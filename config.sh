cat <<EOF > ~/.limitbreak
# QOL stuff

alias l='ls -lhAF --group-directories-first --time-style=long-iso --color=auto'
alias c='clear'
alias clear='clear && printf "\e[3J"'
alias ..='cd ..'
alias ...='cd ../..'
alias psg='ps -ef | egrep -i '
alias grep='egrep --color'
alias serve='python3 -m http.server'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[1;3A": "\C-e \C-ucd ..\n\C-y\C-h"'
bind '"\e[1;3B": "\C-e \C-ucd ./\C-i\n\C-y\C-h"'

# Python stuff

export PYTHONSTARTUP=\$HOME/.pythonrc.py
alias python='python3'
activate () {
    source \$1/bin/activate
}

# Random stuff

alias plz='sudo "\$BASH" -c "\$(fc -ln -1)"'
EOF
if ! grep -Fxq "source ~/.limitbreak" ~/.bashrc; then
    echo "source ~/.limitbreak" >> ~/.bashrc
fi
cat <<EOF > ~/.pythonrc.py
import json
import os
import re
import sys
import time

print('\nloaded:', [x for x in globals().keys() if not x.startswith('_')])
EOF
cat <<EOF > ~/.tmux.conf
set -g default-terminal "xterm-256color"

# Remap prefix to Ctrl+A
set -g prefix C-a
bind C-a send-prefix
unbind C-b

# Quality of life stuff
set -g history-limit 10000
set -g allow-rename off

# Move windows
bind-key N swap-window -t +1 \; next-window
bind-key P swap-window -t -1 \; previous-window

# Join panes
bind-key j command-prompt -p "join pane from:"  "join-pane -s '%%'"
bind-key s command-prompt -p "send pane to:"  "join-pane -t '%%'"

# Copy into system clipboard
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

# Search mode VI (default is emacs)
set-window-option -g mode-keys vi

# Open new pane in same directory
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
EOF
touch ~/.hushlogin
