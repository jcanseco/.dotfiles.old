" set map leader for more key combos
let mapleader=','

" like C and D, yank from cursor to end of line
nnoremap Y y$

" move over wrapped lines same as normal lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" move between vim-splits using C-hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" auto center on search match
noremap n nzz
noremap N Nzz

" align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Open CtrlP for switching between already-opened buffers
noremap <C-b> :CtrlPBuffer<CR>

" Open CtrlP line search, which will look for text matches in open buffers
noremap <C-f> :CtrlPLine<CR>
