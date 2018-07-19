#!/bin/bash
# Helper script for quick creation of temporary sandbox projects in vim.
# Usage: vs.sh [Extension]

# Create and go to new temporary directory
cd $(mktemp -d)

# Create 'main' file with given extension (or empty extension if none given)
if [[ $# == 0 ]]; then
    vim main
else
    vim main.$1
fi
