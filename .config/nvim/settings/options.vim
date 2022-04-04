set laststatus=2
set showtabline=2
set wildmenu
set ruler
set number
set lazyredraw
set so=7
set noshowmode
set noexpandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
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
set title
set titlestring=NVIM\ %F\ %a%r%m titlelen=70
filetype plugin on
filetype plugin indent on
syntax on
colorscheme pablo

set cursorline
hi clear CursorLine
hi CursorLine ctermbg=234
set list
set listchars=tab:\|\ 
hi Whitespace ctermfg=8

let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_keepdir = 0
autocmd FileType netrw setl bufhidden=wipe
