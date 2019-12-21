set number
set relativenumber
set nocompatible
"PLUGINS
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'itchyny/lightline.vim'
"Plugin 'vimwiki/vimwiki'
let g:cpp_class_scope_highlight = 1
call vundle#end()

"--------------------------Basic Settings----------------------------
filetype plugin on
filetype indent on
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
let g:vim_markdown_folding_disabled = 1
set clipboard=unnamed
set scrolloff=1
set smartcase
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set viminfo+=n~/.vim/viminfo

"-------------------------------Bindings------------------------------
"" GENERAL
let mapleader=","

inoremap jj <Esc>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
command! W write
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
"nnoremap <leader>g :Goyo<Return>
nnoremap <leader>t :TableFormat<Return>
inoremap <C-s> <Esc>:w!<Enter>i
nnoremap <C-s> :w!<Enter>
map <F7> :setlocal spell! spelllang=en_uk<CR>
nnoremap K :!open dict:///<cword><cr>
" Special o
nmap <C-K> m`O<Esc>``
nmap <C-J> m`o<Esc>``
" insert mode hjkljl
inoremap <c-h> <left> 
inoremap <c-l> <right>

" Compiler
map <leader>c :w! \| !compiler <c-r>%<CR>
map <leader>op !open <c-r>%<Backspace><Backspace>pdf<CR>

"" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"" Navigating with guides
"autocmd FileType tex inoremap ;; <Esc>/<Enter>"_c4l
"autocmd FileType tex inoremap <Space><Backspac> <Esc>/<Enter>"_c4l
"autocmd FileType tex vnoremap ;; <Esc>/<++><Enter>"_c4l
"autocmd FileType tex map ;; <Esc>/<++><Enter>"_c4l
"autocmd FileType tex inoremap ;gui <++>
"""END

"" MARKDOWN
"autocmd Filetype markdown source ~/.vim/ftplugin/auctex.vim
autocmd FileType markdown inoremap ;f \frac{}{}<Esc>hT{i
autocmd FileType markdown inoremap ;e $$<Space>$$<Esc>hT$i<Space>
autocmd FileType markdown inoremap ;b \bm{}<Esc>i
autocmd FileType markdown inoremap ;p \partial<Space>
autocmd Filetype markdown map <F5> :!pandoc<space>%<space>-o<space>%:r.pdf<Enter><Enter>
autocmd Filetype markdown nnoremap <leader>s T*a~~<C-o>$~~<Esc>

"" Latex Bindings
"autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
"autocmd FileType tex inoremap ;em \emph{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ;bf \textbf{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ;it \textit{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ;ct \textcite{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
"autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
"autocmd FileType tex inoremap ;i <Enter>\item<Space> 
"autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ;t \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
"autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
"autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
"autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
"autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
"autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
"autocmd FileType tex inoremap ;beg \begin{%DELRN%}<Enter><++><Enter>\end{%DELRN%}<Enter><Enter><++><Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c
"autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
"autocmd FileType tex inoremap ;f \footnote{}<Esc>T{i
"autocmd FileType tex inoremap ;cap \caption{}<Esc>T{i
"autocmd FileType tex inoremap ;eq \begin{equation}<Enter><Enter>\end{equation}<Enter><++><Esc>2kA
"" END


"" HTML
"autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
"autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
"autocmd FileType html inoremap ;h1 <h1></h1><Enter><Enter><p><++><Esc>2k2hi
"autocmd FileType html inoremap ;h2 <h2></h2><Enter><Enter><p><++><Esc>2k2hi
"autocmd FileType html inoremap ;h3 <h3></h3><Enter><Enter><p><++><Esc>2k2hi
"autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
"autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>14hi
"autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
"autocmd FileType html inoremap ;li <Esc>o<li></li><Esc>F>a
"autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i

"" END

"------------------------------MISC---------------------------------------


" lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" vimwiki
"let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'media', 'ext': '.md'},{'path': '~/Documents/Physics/md_notes', 'syntax': 'media', 'ext': '.md'}]

" Tables
let g:table_mode_corner='|'

syntax enable
set noshowmode
set laststatus=2

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
set backspace=2
