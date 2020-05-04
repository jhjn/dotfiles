"--------------------------Basic Settings-------------------------------
set number                                  "Gutter numbers   
set relativenumber                          "No.s above and no.s below
set nocompatible                            "Make it Vim not Vi
set mouse=a                                 "Allow clicking & scroll
set incsearch                               "Start searching automatic
set tabstop=4                               "A tab is 4 spaces
set shiftwidth=4                            " ^^^^ used with ^^^^
set softtabstop=4                           "Deleting a tab deletes ' '
set clipboard=unnamed                       "Use macOS clipboard in vim
set scrolloff=2                             "Start scroll w 2 lines left
set smartcase          "REMOVE??????
set backspace=2                             "Backspace works as intended
set foldlevel=99                            "Begin w folds open, zM clos
set viminfo+=n~/.vim/viminfo                "Misc. between open & close
let &t_SI = "\<Esc>]50;CursorShape=1\x7"    "Insert = straight line
let &t_SR = "\<Esc>]50;CursorShape=2\x7"    "Replace = underline
let &t_EI = "\<Esc>]50;CursorShape=0\x7"    "Normal = block
let g:tex_flavor='latex'                    "Make ft='latex' not 'tex'
let g:markdown_folding = 1                  "Allow folds in .md
autocmd FileType tex setlocal foldmethod=marker "Tex folds by marker
syntax enable                               "Syntax highlighting

"-----------------------------Plugins-----------------------------------
filetype off                                "Needed for Vundle
set rtp+=~/.vim/bundle/Vundle.vim           "Needed for Vundle
call vundle#begin()                         "Needed for Vundle
Plugin 'VundleVim/Vundle.vim'               "Needed for Vundle
Plugin 'itchyny/lightline.vim'              "Lightline
	set noshowmode                          "Hide default "INSERT"
	set laststatus=2                        "2 = always show statusbar
	let g:lightline = 
		\ {'colorscheme': 'jellybeans'}     "Jellybean colours
Plugin 'junegunn/goyo.vim'                  "Goyo
Plugin 'junegunn/gv.vim'                    "Git commit viewer
Plugin 'justinmk/vim-sneak'                 "Sneak
Plugin 'preservim/nerdtree'                 "NerdTree
Plugin 'SirVer/ultisnips'                   "UltiSnips
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	let g:UltiSnipsListSnippets = '<leader><tab>'
Plugin 'tpope/vim-commentary'               "Comment using gc (gcc)
Plugin 'tpope/vim-fugitive'                 "Fugitive
Plugin 'tpope/vim-surround'                 "Surround
Plugin 'vimwiki/vimwiki'                    "VimWiki
	let g:vimwiki_list = [{'path': '~/Nextcloud/vw', 'syntax':
				\ 'markdown', 'ext': '.md'}]
	let g:vimwiki_global_ext = 0            "Stops all .md being vimwiki
call vundle#end()                           "Needed for Vundle
filetype plugin indent on                   "Needed for Vundle

"-------------------------------Bindings--------------------------------
"General
inoremap jj <Esc>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <Space> za
nnoremap ? :marks<Return>
nnoremap H 0
nnoremap J 3<C-e>
nnoremap K 3<C-y>
nnoremap L $
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap gs "ydiw"zxe"zp"yp
nnoremap gS "ydiw"zxb"zP"yP

"Leader
let mapleader=","
nnoremap <leader>a :%!column -t<Return>
nnoremap <leader>c :w! \| !compiler "%"<Return>
nnoremap <leader>d :pu=strftime('%Y-%m-%d %a')<Return>o
nnoremap <leader>m `m
nnoremap <leader>o :!open "%<.pdf"<Return> 
nnoremap <leader>p :!pp % \| vim -<Return>
nnoremap <leader>s :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>a :!column -t<Return>
vnoremap <leader>s :sort<Return>

"----------------------------Plugin-Bindings----------------------------
"NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree 
			\ | endif
map <C-n> :NERDTreeToggle<Return>

"Goyo
nnoremap <leader>g :Goyo<Return>

"GV
nnoremap <leader>vv :GV<Return>
nnoremap <leader>vf :GV!<Return>
