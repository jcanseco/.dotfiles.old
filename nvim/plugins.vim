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
  Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy finder
  Plugin 'FelikZ/ctrlp-py-matcher' " Custom matcher for CtrlP used to speed up matching
  Plugin 'shougo/deoplete.nvim' " Auto-completion
  Plugin 'zchee/deoplete-clang' " Auto-completion for C, C++, Obj-C, Obj-C++
  Plugin 'benekastah/neomake' " Code linter
  Plugin 'ludovicchabant/vim-gutentags' " Tag files generator/manager
  Plugin 'lervag/vimtex' " LaTeX plugin
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
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR" " Create new line and move cursor one tab into body when creating code block with braces


""" CtrlP
let g:ctrlp_cmd='CtrlPMixed' " Set CtrlP to search files, most-recently-used and open buffers at the same time, but defaults to files (press Ctrl+B while the CtrlP window is open to cycle modes)
let g:ctrlp_working_path_mode=0 " For files in the search results that are in the same directory as the current file, show only the relative path instead of the full path
let g:ctrlp_root_markers=['.ctrlp_root'] " If a .ctrlp_root exists anywhere between the open file and /, CtrlP will index from there instead
let g:ctrlp_by_filename=1 " Search by filename, not filepath
let g:ctrlp_max_files=30000
let g:ctrlp_follow_symlinks=1
let g:ctrlp_match_window='min:10,max10'

" Ignore .git and other source control directories, node_modules, Jekyll _site dirs, .o and other binary files output by compilers, etc.
let g:ctrlp_custom_ignore={
  \ 'dir': '\.(git|svn|hg)$\|_site\|\.jsexe$\|node_modules$',
  \ 'file': '\v\.(o|hi|js_o|js_hi|dyn_hi|dyn_o)',
  \ }

" Speed up indexing for CtrlP by using SilverSearcher
let g:ctrlp_user_command = '/usr/bin/ag %s -i --nocolor --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ --ignore review
  \ -g ""'

" Speed up matching for CtrlP by using a custom matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }


""" Deoplete
let g:deoplete#enable_at_startup = 1

" Required fields for Deoplete-Clang (see Deoplete-Clang GitHub page for info)
let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-3.8/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/include/clang/"

" Automatically close the Scratch (i.e Preview) window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


""" Neomake
autocmd! BufWritePost * Neomake " Run Neomake every time the file is saved

let g:neomake_cpp_enabled_makers = ['clang', 'clangtidy']
let g:neomake_cpp_clang_maker = {
            \ 'args': ['-fsyntax-only', '-std=c++11', '-Wall', '-Wextra'],
            \ 'errorformat':
            \ '%-G%f:%s:,' .
            \ '%f:%l:%c: %trror: %m,' .
            \ '%f:%l:%c: %tarning: %m,' .
            \ '%f:%l:%c: %m,'.
            \ '%f:%l: %trror: %m,'.
            \ '%f:%l: %tarning: %m,'.
            \ '%f:%l: %m',
            \ }
let g:neomake_cpp_clangtidy_maker = {
            \ 'exe': 'clang-tidy',
            \ 'args': ['--checks="modernize-*,readability-*,misc-*,clang-analyzer-*"'],
            \ 'errorformat':
            \ '%E%f:%l:%c: fatal error: %m,' .
            \ '%E%f:%l:%c: error: %m,' .
            \ '%W%f:%l:%c: warning: %m,' .
            \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
            \ '%E%m',
            \ }


""" VimTeX
let g:vimtex_view_method = 'zathura' " Set the default PDF viewer
let g:vimtex_quickfix_latexlog = {'fix_paths' : 0} " Fixes bug with NeoVim support which prevents the opening of the error window
