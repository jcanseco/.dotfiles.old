" Set the Leader key
let mapleader=','

" Like 'C' and 'D', yank from cursor to end of line
nnoremap Y y$

" Move over wrapped lines same as normal lines
nnoremap j gj
nnoremap k gk

vnoremap j gj
vnoremap k gk

nnoremap I g^i
nnoremap A g$a

" Move between vim-splits using 'Ctrl + (h/j/k/l)'
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Auto center on search match
noremap n nzz
noremap N Nzz

" Prevent jumping to the next match when pressing '*'
nnoremap * :keepjumps normal! mi*`i<CR>

" Align blocks of text and keep them selected
vnoremap < <gv
vnoremap > >gv

" Highlight last inserted text
nnoremap gV `[v`]

" Insert newline before/after current line
nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k

" Remove all trailing whitespace using 'LEADER + t'
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> :w<CR>

" Open CtrlP for switching between already-opened buffers
noremap <C-b> :CtrlPBuffer<CR>

" Open CtrlP line search, which will look for text matches in open buffers
noremap <C-f> :CtrlPLine<CR>

" Cycle through Deoplete suggestions using 'Tab' and 'Shift + Tab'
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Open and close Tagbar
nnoremap <Leader>o :TagbarToggle<CR>

" Toggle continuous compilation for LaTex docs
nmap <Leader>ll <plug>(vimtex-compile)

" View LaTeX doc on a PDF viewer
nmap <Leader>lv <plug>(vimtex-view)

" View LaTeX compiler output (detailed)
nmap <Leader>lo <plug>(vimtex-compile-output)

" View LaTeX compilation errors
nmap <Leader>le <plug>(vimtex-errors)

" Clean up temporary LaTeX compiler output files
nmap <Leader>lc <plug>(vimtex-clean-full)
