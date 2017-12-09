#!/bin/bash

PATH_TO_PROJECT="/home/jcanseco/Workspace/CS434/project/"
PATH_TO_SANDBOX="/home/jcanseco/Workspace/CS434-Sandbox/"

CR=C-m # Carriage return in Tmux

tmux rename-session "CS434"

# Set up code window
tmux rename-window "code"
tmux send-keys "cd $PATH_TO_PROJECT; clear" $CR
tmux send-keys "vim build.sbt src/**/*.scala" $CR

tmux split-window -v
tmux send-keys "cd $PATH_TO_PROJECT; clear" $CR
tmux resize-pane -D 15
tmux send-keys "sbt" $CR

# Set up sandbox window
tmux new-window -n "sandbox"
tmux send-keys "cd $PATH_TO_SANDBOX; clear" $CR
tmux send-keys "ls" $CR
tmux send-keys "ls outputs" $CR

# Set up git window
tmux new-window -n "git"
tmux send-keys "cd $PATH_TO_PROJECT; clear" $CR
tmux send-keys "git status" $CR

# Set up tree window
tmux new-window -n "tree"
tmux send-keys "cd $PATH_TO_PROJECT; clear" $CR
tmux send-keys "tree src" $CR

# Switch to code window
tmux select-window -t "code"
