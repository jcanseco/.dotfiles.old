""" Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
    " Auto-install vim-plug and plugins when opening vim on a new machine that
    " does not have vim-plug installed
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    echomsg 'Installing plugins for the first time. Restart vim when done.'
endif


""" Plugins
call plug#begin('~/.vim/plugged') " Download plugins into the specified path

Plug 'joshdick/onedark.vim' " One Dark theme
Plug 'vim-airline/vim-airline' " Status line
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'Raimondi/delimitMate' " Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'sickill/vim-pasta' " Context-aware pasting (i.e. changes indentation of pasted text to match that of surrounding text)
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'sheerun/vim-polyglot' " Better syntax highlighting for various languages
Plug 'christoomey/vim-tmux-navigator' " Move between vim-splits and tmux panes seamlessly
Plug 'jeetsukumaran/vim-filebeagle' " File browser
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plug 'FelikZ/ctrlp-py-matcher' " Custom matcher for CtrlP used to speed up matching
Plug 'lokikl/vim-ctrlp-ag' " CtrlP extension; search for strings throughout a project using Ag
Plug 'tacahiroy/ctrlp-funky' " CtrlP extension; search for class and function definitions in the current file without using tags
Plug 'ivalkeen/vim-ctrlp-tjump' " CtrlP extension; provides support for tags, mainly go-to-declaration functionality
Plug 'ludovicchabant/vim-gutentags' " Tag files generator/manager
Plug 'MattesGroeger/vim-bookmarks' " Add bookmarks
Plug 'benekastah/neomake' " Code linter
Plug 'lervag/vimtex' " LaTeX Plug
Plug 'dbakker/vim-projectroot' " Helpers for guessing the project root using heuristics
Plug 'pbrisbin/vim-mkdir' " Automatically create any non-existing directories before writing the buffer
Plug 'unblevable/quick-scope' " Highlights for more efficient left/right motions using f/F
Plug 'christoomey/vim-system-copy' " Copy/paste using system clipboard
Plug 'google/vim-searchindex' " Make searches more like Ctrl+F on web browsers

" Helper function for building and installing YCM
" Note that '--clang-completer' builds YCM with semantic completion support for C/C++; remove it and reinstall YCM if you do not want this feature.
" Note that YCM comes with semantic completion support for Python by default.
" Refer to the README if you want semantic completion support for other languages.
" To reinstall YCM, you need to delete the ~/.vim/plugged/YouCompleteMe directory and run :PlugInstall in vim.
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer
    endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') } " Auto-completion

call plug#end()


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


""" Vim-Pasta
let g:pasta_disabled_filetypes = ['ctrlp', 'python', 'coffee', 'yaml'] " Disable vim-pasta when on the CtrlP prompt in addition to filetypes that were disabled by default


""" Quickscope
let g:qs_highlight_on_keys = ['f', 'F'] " Trigger highlights only when one of these keys is pressed
augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END


""" FileBeagle
let g:filebeagle_suppress_keymaps = 1
let g:filebeagle_show_hidden = 1


""" CtrlP
let g:ctrlp_cmd='CtrlPMixed' " Set CtrlP to search files, most-recently-used, and open buffers at the same time, but defaults to files (press Ctrl+B while the CtrlP window is open to cycle modes)
let g:ctrlp_working_path_mode='ra' " Set CtrlP to index from the project root (identified as the closest ancestral directory for the current file containing a .git directory or a CtrlP root marker)
let g:ctrlp_root_markers=['.ctrlp_root'] " CtrlP root marker; marks the project root; takes precedence over the .git folder (i.e. if it exists, this file will be used instead to identify the project root) (Note: only works if ctrlp_working_path_mode is set to 'ra')
let g:ctrlp_switch_buffer=0 " Open file in current split even if it's already opened somewhere else (another split, window, etc.)
let g:ctrlp_reuse_window = 'filebeagle\|netrw\|help\|quickfix' " Open file in current window even if current window was created by a plugin, help, or quickfix
let g:ctrlp_max_files=30000
let g:ctrlp_follow_symlinks=1
let g:ctrlp_match_window='min:10,max10'

" Ignore .git and other source control directories, node_modules, Jekyll _site dirs, .o and other binary files output by compilers, etc.
let g:ctrlp_custom_ignore={
            \ 'dir': '\.(git|svn|hg)$\|_site\|\.jsexe$\|node_modules$',
            \ 'file': '\v\.(o|hi|js_o|js_hi|dyn_hi|dyn_o)',
            \ }

" Speed up indexing for CtrlP by using SilverSearcher
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
            \ --ignore .git
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .DS_Store
            \ --ignore "**/*.pyc"
            \ --ignore review
            \ -g ""'

" Speed up matching for CtrlP by using a custom matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }


""" CtrlP-Tjump
let g:ctrlp_tjump_only_silent=1 " Go to tag directly if there is only one tag found without opening the CtrlP window
let g:ctrlp_tjump_skip_tag_name=1 " Don't display the actual tag name itself in the CtrlP window
let g:ctrlp_tjump_shortener = ['/.*/', ''] " Show only the filename of each match instead of the full filepath


""" Vim-Bookmarks
let g:bookmark_sign = '> '
let g:bookmark_no_default_key_mappings = 1


""" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/vim/.ycm_extra_conf.py' " Global config for C/C++ semantic completion
let g:ycm_min_num_of_chars_for_completion = 1 " Start completion from the first character
let g:ycm_collect_identifiers_from_tags_files = 1 " Turn on tag completion (Warning: may be slow if tags file is too big)
let g:ycm_register_as_syntastic_checker = 0 " Turn off built-in syntax checker
let g:ycm_show_diagnostics_ui = 0 " Turn off built-in syntax checker
let g:ycm_python_binary_path = 'python' " Use the first Python executable YCM can find (useful when working in a virtualenv that uses a specific Python version)
set completeopt-=preview " Only show completion as a list instead of a sub-window


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
            \ 'args': ['-extra-arg=-std=c++11', '-checks="modernize-*,readability-*,misc-*,clang-analyzer-*"'],
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
let g:vimtex_compiler_latexmk = {'callback' : 0} " Disable compiler callback (used for displaying errors when performing background compilations) since 'clientserver' is not supported in most vim distributions


""" Vim-Polyglot
let g:polyglot_disabled = ['latex']
