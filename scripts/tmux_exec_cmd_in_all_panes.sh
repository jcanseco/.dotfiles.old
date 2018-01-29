#!/bin/bash

# Execute a command in all tmux panes
# Usage: tmux_exec_cmd_in_all_panes.sh <command>

CR=C-m # Carriage return in tmux

for pane_index in $(tmux list-panes -F '#P'); do
  tmux send-keys -t $pane_index "$@" $CR
done
