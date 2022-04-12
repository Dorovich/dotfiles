set laststatus=0
set showtabline=0
set showmode
set wildmenu
set ruler
set number
set lazyredraw
set so=7
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
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
set titlestring=%f\ %a\ %m titlelen=70
filetype plugin on
filetype plugin indent on
syntax on
colorscheme pablo

hi ModeMsg ctermfg=6
hi NonText ctermfg=0
hi LineNr ctermfg=8
hi CursorLineNr ctermfg=6 ctermbg=234 cterm=bold
set cursorline
hi clear CursorLine
hi CursorLine ctermbg=234

" activar solo si se usan tabs en vez de espacios
"set list
"set listchars=tab:\|\ 
"hi Whitespace ctermfg=8

let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_keepdir = 0
autocmd FileType netrw setl bufhidden=wipe
