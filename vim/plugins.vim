""" Plugins
filetype off " Required by Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim " Add the Vundle installation to the runtime path
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin('~/.vim/bundle') " Download plugins into the specified path

  Plugin 'VundleVim/Vundle.vim' " Required for Vundle to work
  Plugin 'joshdick/onedark.vim' " One Dark theme
  Plugin 'vim-airline/vim-airline' " Status line
  Plugin 'vim-airline/vim-airline-themes' " Themes for vim-airline
  Plugin 'Raimondi/delimitMate' " Automatic closing of quotes, parenthesis, brackets, etc.
  Plugin 'tpope/vim-sleuth' " Detect indent style (tabs vs. spaces) and adjust shiftwidth and expandtab accordingly
  Plugin 'sickill/vim-pasta' " Context-aware pasting (i.e. changes indentation of pasted text to match that of surrounding text)
  Plugin 'tpope/vim-commentary' " Comment stuff out
  Plugin 'sheerun/vim-polyglot' " Better syntax highlighting for various languages
  Plugin 'christoomey/vim-tmux-navigator' " Move between vim-splits and tmux panes seamlessly
  Plugin 'jeetsukumaran/vim-filebeagle' " File browser
  Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy finder
  Plugin 'FelikZ/ctrlp-py-matcher' " Custom matcher for CtrlP used to speed up matching
  Plugin 'lokikl/vim-ctrlp-ag' " CtrlP extension; search for strings throughout a project using Ag
  Plugin 'tacahiroy/ctrlp-funky' " CtrlP extension; search for class and function definitions in the current file without using tags
  Plugin 'ivalkeen/vim-ctrlp-tjump' " CtrlP extension; provides support for tags, mainly go-to-declaration functionality
  Plugin 'MattesGroeger/vim-bookmarks' " Add bookmarks
  Plugin 'dbakker/vim-projectroot' " Helpers for guessing the project root using heuristics
  Plugin 'pbrisbin/vim-mkdir' " Automatically create any non-existing directories before writing the buffer

  call vundle#end()
else
  echomsg 'Error: Vundle not installed.'
endif
filetype plugin indent on " Required by Vundle


""" Airline
set laststatus=2 " Show airline even if there are no splits
set ttimeoutlen=10 " Eliminate delay when leaving Insert mode
let g:airline_powerline_fonts=1
let g:airline_theme='onedark'
let g:airline_skip_empty_sections=1 " Remove angle at end of there is no warning
let g:airline#extensions#tabline#enabled=1 " Enable airline tabline
let g:airline#extensions#tabline#tab_min_count=2 " Only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers=0 " Do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits=0


""" DelimitMate
imap <expr> <CR> pumvisible() ? "\<C-y>" : "<Plug>delimitMateCR" " Create new line and move cursor one tab into body when creating code block with braces


""" FileBeagle
let g:filebeagle_suppress_keymaps = 1
let g:filebeagle_show_hidden = 1


""" CtrlP
let g:ctrlp_cmd='CtrlPMixed' " Set CtrlP to search files, most-recently-used, and open buffers at the same time, but defaults to files (press Ctrl+B while the CtrlP window is open to cycle modes)
let g:ctrlp_working_path_mode='ra' " Set CtrlP to index from the project root (identified as the closest ancestral directory for the current file containing a .git directory or a CtrlP root marker)
let g:ctrlp_root_markers=['.ctrlp_root'] " CtrlP root marker; marks the project root; takes precedence over the .git folder (i.e. if it exists, this file will be used instead to identify the project root) (Note: only works if ctrlp_working_path_mode is set to 'ra')
let g:ctrlp_switch_buffer=0 " Open file in current split even if it's already opened somewhere else (another split, window, etc.)
let g:ctrlp_max_files=30000
let g:ctrlp_follow_symlinks=1
let g:ctrlp_match_window='min:10,max10'

" Ignore .git and other source control directories, node_modules, Jekyll _site dirs, .o and other binary files output by compilers, etc.
let g:ctrlp_custom_ignore={
  \ 'dir': '\.(git|svn|hg)$\|_site\|\.jsexe$\|node_modules$',
  \ 'file': '\v\.(o|hi|js_o|js_hi|dyn_hi|dyn_o)',
  \ }

" Speed up matching for CtrlP by using a custom matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }


""" CtrlP-Tjump
let g:ctrlp_tjump_only_silent=1 " Go to tag directly if there is only one tag found without opening the CtrlP window
let g:ctrlp_tjump_skip_tag_name=1 " Don't display the actual tag name itself in the CtrlP window
let g:ctrlp_tjump_shortener = ['/.*/', ''] " Show only the filename of each match instead of the full filepath


""" Vim-Bookmarks
let g:bookmark_sign = '> '
let g:bookmark_no_default_key_mappings = 1
