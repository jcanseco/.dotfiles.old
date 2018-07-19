#!/bin/bash
# Helper script for resetting the git working tree to HEAD.

read -p "git: Resetting the working tree to HEAD. Continue? [Y/n]: " opt
if [[ $opt == "Y" ]]; then
    git add -A && git reset --hard
fi
