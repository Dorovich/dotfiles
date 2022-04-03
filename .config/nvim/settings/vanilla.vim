"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""             CONFIGS BASICAS             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
set laststatus=0
set showtabline=0
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.o,*.mp3,*.mp4 
set ruler
set number
set lazyredraw
set showmode
set smarttab
set smartindent
set autoindent
set mouse=a
set hidden
set nobackup
set nowritebackup
set noswapfile
set nowrap
set nocompatible
set clipboard=unnamedplus
syntax on
set hlsearch
set incsearch
filetype plugin on
filetype plugin indent on
set pumheight=10
set title
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set so=7
set foldenable
set foldmethod=marker
set list
set noexpandtab
set listchars=tab:\·\ 
hi Whitespace ctermfg=8
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_keepdir = 0
autocmd FileType netrw setl bufhidden=wipe
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""              CONFIGS TECLAS             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
let g:mapleader = ' '
nnoremap <C-s> :w!<CR>
nnoremap <C-q> :q<CR>
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader><S-q> :q!<CR>
nnoremap <S-h> I<ESC>
nnoremap <S-l> A<ESC>
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap <TAB> :bnext<CR>
noremap <S-TAB> :bprevious<CR>
nnoremap <C-c> :bdelete!<CR>
xnoremap < <gv
xnoremap > >gv
nmap <silent> U <C-r>
map ; :
nnoremap <Leader><Leader> za
nnoremap <silent> <Leader>f :Lex %:p:h<CR>
nnoremap <silent> <Leader>e :Lex %:p:h<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
nnoremap <Leader>p i(<Esc>ea)<Esc>
nnoremap <Leader>l i{<Esc>ea}<Esc>
" }}}
