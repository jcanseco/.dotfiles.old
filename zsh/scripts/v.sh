#!/bin/bash
# Helper script for opening files in vim.

# Open current directory by default if no file argument given.
if [[ $# == 0 ]]; then
    vim .
    exit 0
fi

# Open file if it exists.
if [[ -f ./$1 ]]; then
    vim $1
    exit 0
fi

# Prompt user regarding creating a new file if it does not exist.
read -p "vim: Creating new file '$1'. Continue? [Y/n]: " opt
if [[ $opt == "Y" ]]; then
    vim $1
    exit 0
fi
