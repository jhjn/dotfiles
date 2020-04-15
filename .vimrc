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
Plugin 'tpope/vim-fugitive'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'itchyny/lightline.vim'
	let g:lightline = {'colorscheme': 'jellybeans'}
Plugin 'vimwiki/vimwiki'
	let g:vimwiki_list = [{'path': '~/Nextcloud/vw', 'syntax': 'markdown', 'ext': '.md'}]
Plugin 'SirVer/ultisnips'
Plugin 'KeitaNakamura/tex-conceal.vim'
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
" insert datetime string
nnoremap <leader>d :pu=strftime('%Y-%m-%d %a')<Enter>o

" spelling
"setlocal spell
"set spelllang=en_gb
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Compiler
map <leader>c :w! \| !compiler <c-r>%<CR>
map <leader>op !open <c-r>%<Backspace><Backspace>pdf<CR>

"" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>


"" MARKDOWN
autocmd FileType markdown inoremap ;f \frac{}{}<Esc>hT{i
autocmd FileType markdown inoremap ;e $$<Space>$$<Esc>hT$i<Space>
autocmd FileType markdown inoremap ;b \bm{}<Esc>i
autocmd FileType markdown inoremap ;p \partial<Space>
autocmd Filetype markdown map <F5> :!pandoc<space>%<space>-o<space>%:r.pdf<Enter><Enter>
autocmd Filetype markdown nnoremap <leader>s T*a~~<C-o>$~~<Esc>

"" Latex Bindings
"autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA


"" HTML
"autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i

"------------------------------MISC---------------------------------------



" vimwiki
"let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'media', 'ext': '.md'},{'path': '~/Documents/Physics/md_notes', 'syntax': 'media', 'ext': '.md'}]
" Conceal
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = '<leader><tab>'

" Tables
let g:table_mode_corner='|'

syntax enable
set noshowmode
set laststatus=2

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
set backspace=2
