#!/bin/bash

PATH_TO_PROJECT="/home/jcanseco/Workspace/CS434/project/"
PATH_TO_SANDBOX="/home/jcanseco/Workspace/CS434-Sandbox/"

# Set up code window
tmux rename-window "code"
tmux send-keys "cd $PATH_TO_PROJECT; clear" C-m
tmux send-keys "vim build.sbt src/**/*.scala" C-m

tmux split-window -v
tmux send-keys "cd $PATH_TO_PROJECT; clear" C-m
tmux resize-pane -D 15
tmux send-keys "sbt" C-m

# Set up sandbox window
tmux new-window -n "sandbox"
tmux send-keys "cd $PATH_TO_SANDBOX; clear" C-m
tmux send-keys "ls" C-m
tmux send-keys "ls outputs" C-m

# Set up git window
tmux new-window -n "git"
tmux send-keys "cd $PATH_TO_PROJECT; clear" C-m
tmux send-keys "git status" C-m

# Switch back to code window
tmux select-window -t "code"
