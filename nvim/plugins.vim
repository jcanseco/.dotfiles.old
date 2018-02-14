filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin('~/.config/nvim/bundle') " Download plugins into the specified path

  Plugin 'VundleVim/Vundle.vim' " Required for Vundle to work

  Plugin 'joshdick/onedark.vim'

  Plugin 'vim-airline/vim-airline' " Status line
  Plugin 'vim-airline/vim-airline-themes' " Themes for vim-airline
  Plugin 'Raimondi/delimitMate' " Automatic closing of quotes, parenthesis, brackets, etc.
  Plugin 'tpope/vim-sleuth' " Detect indent style (tabs vs. spaces) and adjust shiftwidth and expandtab accordingly
  Plugin 'sickill/vim-pasta' " Context-aware pasting (i.e. changes indentation of pasted text to match that of surrounding text)
  Plugin 'tpope/vim-commentary' " Comment stuff out
  Plugin 'sheerun/vim-polyglot' " Better syntax highlighting for various languages
  Plugin 'christoomey/vim-tmux-navigator' " Move between vim-splits and tmux panes seamlessly
  Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy finder
  Plugin 'FelikZ/ctrlp-py-matcher' " Custom matcher for CtrlP used to speed up matching
  Plugin 'shougo/deoplete.nvim' " Auto-completion
  Plugin 'zchee/deoplete-clang' " Auto-completion for C, C++, Obj-C, Obj-C++
  Plugin 'benekastah/neomake' " Code linter
  Plugin 'ludovicchabant/vim-gutentags' " Tag files generator/manager
  Plugin 'majutsushi/tagbar' " Browse tags for the current file and get an overview of its structure
  Plugin 'lervag/vimtex' " LaTeX plugin
  Plugin 'pbrisbin/vim-mkdir' " Automatically create any non-existing directories before writing the buffer

  call vundle#end()
else
  echomsg 'Error: Vundle not installed.'
endif
filetype plugin indent on
