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

" Prevent jumping to the next match when pressing '*'
nnoremap * :keepjumps normal! mi*`i<CR>

" Disable highlights using 'Leader + d'
nnoremap <Leader>d :noh<CR>

" Align blocks of text and keep them selected
vnoremap < <gv
vnoremap > >gv

" Remove all trailing whitespace using 'Leader + t'
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> :w<CR>

" Refresh current buffer to match the saved state using 'Leader + r', and then save the file right after to remove the 'trailing whitespace' warning on airline.
nnoremap <Leader>r :e!<CR> :w<CR>

" Go back and forth between recently visited buffers
nnoremap <C-b> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" Open the file browser
nnoremap <Leader>f :FileBeagle<CR>

" Search for strings throughout a project using CtrlP-Ag via the 'Ag' or 'ag' command
command -nargs=1 Ag ProjectRootExe CtrlPagLocate <Args>
cnoreabbrev ag Ag

" Search for class and function definitions in the current file using CtrlP-Funky
nnoremap <C-f> :CtrlPFunky<CR>

" Search for tags of the symbol under the cursor using CtrlP-Tjump
nnoremap <C-]> :CtrlPtjump<CR>
vnoremap <C-]> :CtrlPtjumpVisual<CR>

" Insert bookmark (vim-bookmarks)
nnoremap mm :BookmarkToggle<CR>

" Clear all bookmarks (vim-bookmarks)
nnoremap mc :BookmarkClear<CR>

" Show all bookmarks (vim-bookmarks)
nnoremap ma :BookmarkShowAll<CR>

" Cycle through Deoplete suggestions using 'Tab' and 'Shift + Tab'
inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Toggle continuous compilation for LaTex docs
nmap <Leader>ll <Plug>(vimtex-compile)

" View LaTeX doc on a PDF viewer
nmap <Leader>lv <Plug>(vimtex-view)

" View LaTeX compiler output (detailed)
nmap <Leader>lo <Plug>(vimtex-compile-output)

" View LaTeX compilation errors
nmap <Leader>le <Plug>(vimtex-errors)

" Clean up temporary LaTeX compiler output files
nmap <Leader>lc <Plug>(vimtex-clean-full)
