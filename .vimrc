" Autoinstalar vim-plug:
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let cargar_orgmode = 1
let cargar_colores = 1

call plug#begin()
Plug 'jdhao/better-escape.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
if cargar_colores
	Plug 'srcery-colors/srcery-vim'
	Plug 'Everblush/everblush.vim'
	Plug 'rose-pine/vim'
endif
if cargar_orgmode
	Plug 'jceb/vim-orgmode'
	Plug 'tpope/vim-speeddating'
endif
call plug#end()

" OTROS PLUGINS ÚTILES:
" YouCompleteMe - motor de compleción
" vlime - desarollo de common lisp
" paredit.vim - paréntesis y s-expressions
" fugitive.vim - integración con git

let g:better_escape_shortcut = 'jk'
if cargar_colores
	let g:srcery_bg_passthrough = 1
	let g:srcery_dim_lisp_paren = 1
	let g:srcery_italic = 1
	let g:everblush_transp_bg = 1
	let g:disable_bg = 1
	colorscheme srcery
else
	colorscheme pablo
endif

set nocompatible
set hidden
set bg=dark
set mouse=a
set clipboard=unnamedplus
set laststatus=0
set showcmd
set showmode
set ruler
set number relativenumber
set splitbelow splitright
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.o,*.mp3,*.mp4,*.mov,*.mkv,*.ogg,*.dat
set autoread
set lazyredraw
set shortmess+=a
set autoindent
set hlsearch incsearch
set nowrap
set nobackup nowritebackup
set noswapfile
set smarttab
set autoindent
set title
set cursorline
set encoding=utf-8
set scrolloff=1
set sidescrolloff=1
set t_Co=256

syntax enable
filetype plugin on
filetype plugin indent on

let mapleader = ','
let maplocaleader = ' '

nmap ñ :
nmap U <c-r>
nmap Q gq
nmap <c-q> :q<cr>
nmap <c-s> :w<cr>
nmap <leader>r :%s//g<left><left>
nmap <leader>c :!make<cr>
nmap <silent> <leader>t :term<cr>
xmap q <esc>
xmap > >gv
xmap < <gv

" Cambiar forma del cursor según el modo:
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

autocmd FileType help :nmap <buffer> <silent> q <c-w>q
