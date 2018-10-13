#!/bin/bash
# Helper script for opening files in vim.
# Usage: v.sh [Filename]

# Open current directory by default if no file argument given.
if [[ $# == 0 ]]; then
    vim .
    exit 0
fi

# Open file or directory if it exists.
if [[ -f ./$1 ]] || [[ -d ./$1 ]]; then
    vim $1
    exit 0
fi

# Prompt user regarding creating a new file if it does not exist.
read -n1 -p "vim: Creating new file '$1'. Continue? [Y/n]: " opt
printf "\n"
if [[ $opt == "Y" ]]; then
    vim $1
    exit 0
fi
