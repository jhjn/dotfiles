"--------------------------Basic Settings------------------------------
set number                                  "Gutter numbers   
set relativenumber                          "No.s above and no.s below
set nocompatible                            "Make it Vim not Vi
set mouse=a                                 "Allow clicking & scroll
set tabstop=4
set shiftwidth=4
set softtabstop=4
set clipboard=unnamed                       "Use macOS clipboard in vim
set scrolloff=2                             "Start scroll w 2 lines left
set smartcase "REMOVE??????
set backspace=2                             "Backspace works as intended
set foldlevel=99                            "Begin w folds open, zM close
set viminfo+=n~/.vim/viminfo                "Misc. between open & close
let &t_SI = "\<Esc>]50;CursorShape=1\x7"    "Insert = straight line
let &t_SR = "\<Esc>]50;CursorShape=2\x7"    "Replace = underline
let &t_EI = "\<Esc>]50;CursorShape=0\x7"    "Normal = block
let g:tex_flavor='latex'                    "Make ft='latex' not 'tex'
let g:markdown_folding = 1                  "Allow folds in .md
syntax enable                               "Syntax highlighting

"-----------------------------Plugins-----------------------------------
filetype off                                "Needed for Vundle
set rtp+=~/.vim/bundle/Vundle.vim           "Needed for Vundle
call vundle#begin()                         "Needed for Vundle
Plugin 'VundleVim/Vundle.vim'               "Needed for Vundle
Plugin 'preservim/nerdtree'                 "NerdTree
Plugin 'tpope/vim-surround'                 "Surround
Plugin 'tpope/vim-fugitive'                 "Fugitive
Plugin 'junegunn/goyo.vim'                  "Goyo
Plugin 'justinmk/vim-sneak'                 "Sneak
Plugin 'itchyny/lightline.vim'              "Lightline
	set noshowmode                          "Hide default "INSERT"
	set laststatus=2                        "2 = always show statusbar
	let g:lightline = {'colorscheme': 'jellybeans'}
Plugin 'vimwiki/vimwiki'                    "VimWiki
	let g:vimwiki_list = [{'path': '~/Nextcloud/vw', 'syntax': 'markdown', 'ext': '.md'}]
	let g:vimwiki_global_ext = 0            "Stops all .md being vimwiki
Plugin 'SirVer/ultisnips'                   "UltiSnips
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	let g:UltiSnipsListSnippets = '<leader><tab>'
"Plugin 'KeitaNakamura/tex-conceal.vim'     "Conceal
	"set conceallevel=1
	"let g:tex_conceal='abdmg'
	"hi Conceal ctermbg=none
call vundle#end()                           "Needed for Vundle
filetype plugin indent on                   "Needed for Vundle

"-------------------------------Bindings------------------------------
"" GENERAL
inoremap jj <Esc>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap H 0
nnoremap L $
nnoremap j gj
nnoremap k gk
nnoremap Y y$

" LEADER
let mapleader=","
map <leader>c :w! \| !compiler <c-r>%<CR>
map <leader>o :!open <c-r>%<Backspace><Backspace>pdf<CR> 
nnoremap <leader>d :pu=strftime('%Y-%m-%d %a')<Enter>o
nnoremap <leader>s :%s/\<<C-r><C-w>\>//<Left>

"----------------------------Plugin-Bindings-----------------------------
"" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"Goyo
nnoremap <leader>g :Goyo<Return>
