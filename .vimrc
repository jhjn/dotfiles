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
set smartcase                               "Case snstv when uppercase
set lazyredraw                              "Dont redraw screen in macro
set undofile                                "Undo persists after close
set backspace=2                             "Backspace works as intended
set foldlevel=99                            "Folds begin open, zM closes
set viminfo+=n~/.vim/viminfo                "Misc. between open & close
set suffixesadd={.md}                       "gf on foo finds foo.md too
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
Plugin 'itchyny/lightline.vim'              "Custom status bar
	set noshowmode                          "Hide default "INSERT"
	set laststatus=2                        "2 = always show statusbar
	let g:lightline = 
		\ {'colorscheme': 'jellybeans'}     "Jellybean colours
Plugin 'junegunn/goyo.vim'                  "Distraction free mode
Plugin 'justinmk/vim-sneak'                 "s<letter><letter>
Plugin 'majutsushi/tagbar'                  "Tag overview of file
Plugin 'preservim/nerdtree'                 "File browsing ,f
Plugin 'SirVer/ultisnips'                   "Snippet expansion
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	let g:UltiSnipsListSnippets = '<leader><tab>'
Plugin 'terryma/vim-expand-region'          "+ expands selection (_)
Plugin 'tpope/vim-commentary'               "Comment using gc (gcc)
Plugin 'tpope/vim-fugitive'                 "Git integration
Plugin 'tpope/vim-surround'                 "Surround
Plugin 'vimwiki/vimwiki'                    "<Enter> on []() go to file
	let g:vimwiki_list = [{'path': '~/Nextcloud/vw', 'syntax':
				\ 'default', 'ext': '.md'}]
	let g:vimwiki_global_ext = 0            "Stops all .md being vimwiki
call vundle#end()                           "Needed for Vundle
filetype plugin indent on                   "Needed for Vundle

"-------------------------------Bindings--------------------------------
"General
inoremap jj <Esc>
nnoremap <Space> za
nnoremap ? :marks<Return>
nnoremap H 0
nnoremap J 3<C-e>
nnoremap K 3<C-y>
nnoremap L $
nnoremap Y y$
nnoremap Q @@
nnoremap j gj
nnoremap k gk
nnoremap gs "ydiw"zxe"zp"yp
nnoremap gS "ydiw"zxb"zP"yP
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" For outputting shell command in buffer
:command! -nargs=* -complete=shellcmd Shell new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
"Leader
let mapleader=","
nnoremap <leader>a :%!column -t<Return>
nnoremap <leader>b :terminal<Return>
nnoremap <leader>c :w! \| !compiler "%"<Return>
nnoremap <leader>d :pu=strftime('%Y-%m-%d %a')<Return>o
nnoremap <leader>l :!make 
nnoremap <leader>m `m
nnoremap <leader>o :!open "%<.pdf"<Return> 
nnoremap <leader>p :!pp % \| vim -<Return>
nnoremap <leader>s :%s/\<<C-r><C-w>\>//<Left>
"nnoremap <leader>@ :Shell jkl <C-r><C-w><Return>
vnoremap <leader>a :!column -t<Return>
vnoremap <leader>s :sort<Return>

"----------------------------Plugin-Bindings----------------------------
"Fugitive
" press gq after ,gs to see all the staging commands
nnoremap <leader>gs :Git<Return>
nnoremap <leader>gc :Gcommit<Return>
nnoremap <leader>gd :Git diff<Return>

"Goyo
nnoremap <leader>y :Goyo<Return>

"NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree 
			\ | endif
nnoremap <leader>f :NERDTreeToggle<Return>

"Tagbar
nnoremap <leader>t :TagbarToggle<Return>

"Vimwiki
map <leader>= =0ylo<Esc>65pkhljlDyykP
autocmd FileType vimwiki nnoremap <Space> :VimwikiToggleListItem<Return>
hi VimwikiHeader1 ctermfg=160
hi VimwikiHeader2 ctermfg=161
hi VimwikiHeader3 ctermfg=1
hi VimwikiHeader4 ctermfg=168
hi VimwikiListTodo ctermfg=8
hi VimwikiPre ctermfg=141
hi VimwikiCode ctermfg=99
hi link VimwikiEqIn Statement
hi link VimwikiMath Statement
