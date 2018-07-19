#!/bin/bash
# Helper script for resetting the git working tree to HEAD.

read -n1 -p "git: Resetting the working tree to HEAD. Continue? [Y/n]: " opt
printf "\n"
if [[ $opt == "Y" ]]; then
    git add -A && git reset --hard
fi
