" Configuraciones basicas de nvim
set laststatus=2    " mostrar la barra de estado: 2=ver, 0=esconder
set showtabline=2   " mostrar la barra de tabs/buffers: 2=ver, 0=esconder
set wildmenu
set ruler
set number
set lazyredraw
set so=7
set noshowmode
set noexpandtab
"set expandtab		" tabs = espacios
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
set autoindent
set cursorline
set noswapfile
set hlsearch
set incsearch
set mouse=a
set pumheight=10
set hidden
set nowrap
set nobackup
set nowritebackup
set clipboard=unnamedplus
set encoding=UTF-8
set foldenable
set foldmethod=marker
set nocompatible
set ttyfast
filetype plugin on
filetype plugin indent on
syntax on
colorscheme pablo " koehler tambien esta bien

hi clear CursorLine
hi CursorLine ctermbg=234

set list
set listchars=tab:\·\ 
hi Whitespace ctermfg=8

let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_keepdir = 0
autocmd FileType netrw setl bufhidden=wipe
