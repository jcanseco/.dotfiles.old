set nocompatible " Enable modern Vim features not compatible with Vi spec (Note: must be at the beginning)


""" Dependencies
source ~/.dotfiles/nvim/plugins.vim
source ~/.dotfiles/nvim/keymaps.vim


""" Colors

" Disable Background Color Erase (BCE) so that color schemes render properly when inside 256-color tmux and GNU screen.
" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux (this is for the OneDark colorscheme)
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

colorscheme onedark


""" General
set number " show current line number on the side bar
set relativenumber " show numbers of other lines relative to the current line
set noshowmode " disable the mode status at the bottom
set showcmd " show last command executed at the bottom of screen
set scrolloff=8 " keep 8 screen lines above/below the cursor if possible
set ignorecase " ignore case when searching ...
set smartcase " ... unless search pattern contains upper case characters
set smartindent " smart autoindenting when starting a new line
set nowrap " don't wrap lines
set linebreak " wrap long lines; don't break words
set colorcolumn=81 " highlight the 81st column
set mouse-=a " Disable mouse click to go to position
set autoread " detect when a file is changed
set list lcs=tab:\ \ " when cursor is on a tab char, go to beginning of tab, not end (Note: the space after the second \ is important)
set hidden " allow for current buffer to be backgrounded
set splitbelow " open files below the current window when doing a horizontal split
set splitright " open files to the right of the current window when doing a vertical split
set hlsearch " highlight search results
set noswapfile " don't make swap files
set formatoptions=croqlj " format options that are good for Google style. See :help fo-table
set backspace=indent,eol,start " allow backspacing through autoindents, line-endings, and backwards through the start of an insertion


""" Tab Control
set expandtab " replace tabs with spaces
set tabstop=4 " # of spaces used to visually represent the <TAB> character. So when vim opens a file and sees a <TAB> char, it represents that with the given # of spaces
set softtabstop=4 " # of spaces inserted when you hit tab in Insert mode, and the # of spaces deleted when you hit backspace on a tab
set shiftwidth=4 " # of spaces to use for indent and unindent

" Language-specific tab indentation
autocmd Filetype c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2


""" Auto Commands
autocmd InsertEnter * :setlocal nohlsearch " toggle hl off when entering insert mode
autocmd InsertLeave * :setlocal hlsearch " toggle hl back on when leaving insert mode
autocmd BufNewFile,BufEnter * silent! lcd %:p:h " Automatically change the working path to the path of the current file


""" Airline
set laststatus=2 " Show airline even if there are no splits
set ttimeoutlen=10 "Eliminate delay when leaving Insert mode
let g:airline_powerline_fonts=1
let g:airline_theme='onedark'
let g:airline_skip_empty_sections=1 "remove angle at end of there is no warning
let g:airline#extensions#tabline#enabled=1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count=2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers=0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits=0


""" DelimitMate
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR" " create new line and move cursor one tab into body when creating code block with braces


""" CtrlP
let g:ctrlp_cmd='CtrlPMixed' " set CtrlP to search files, most-recently-used and open buffers at the same time, but defaults to files (press Ctrl+B while the CtrlP window is open to cycle modes)
let g:ctrlp_custom_ignore={
  \ 'dir': '\.(git|svn|hg)$\|_site\|\.jsexe$\|node_modules$',
  \ 'file': '\v\.(o|hi|js_o|js_hi|dyn_hi|dyn_o)',
  \ } " ignore .git and other source control directories, node_modules, Jekyll _site dirs, .o and other binary files output by compilers, etc.
let g:ctrlp_working_path_mode=0 " use vim's current working directory, not the directory of the currently loaded file
let g:ctrlp_root_markers=['.ctrlp_root'] " if a .ctrlp_root exists anywhere between the open file and /, CtrlP will index from there instead
let g:ctrlp_max_files=30000
let g:ctrlp_follow_symlinks=1
let g:ctrlp_match_window='min:10,max10'

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
let g:deoplete#sources#clang#clang_header ="/usr/include/clang/"

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


filetype plugin indent on " Enable file type based indenting and syntax highlighting (Note: needs to be at the end)
syntax on
