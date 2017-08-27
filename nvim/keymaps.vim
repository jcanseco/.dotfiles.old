" Set map leader for more key combos
let mapleader=','

" Like C and D, yank from cursor to end of line
nnoremap Y y$

" Move over wrapped lines same as normal lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Move between vim-splits using C-hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Auto center on search match
noremap n nzz
noremap N Nzz

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" Highlight last inserted text
nnoremap gV `[v`]

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Open CtrlP for switching between already-opened buffers
noremap <C-b> :CtrlPBuffer<CR>

" Open CtrlP line search, which will look for text matches in open buffers
noremap <C-f> :CtrlPLine<CR>

" Cycle through Deoplete suggestions using tab and shift+tab
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Open and close Tagbar
nnoremap <Leader>o :TagbarToggle<CR>

" Toggle continuous compilation for LaTex docs
nmap <Leader>ll <plug>(vimtex-compile)

" View LaTeX doc on a PDF viewer
nmap <Leader>lv <plug>(vimtex-view)

" View LaTeX compiler output
nmap <Leader>lo <plug>(vimtex-compile-output)
