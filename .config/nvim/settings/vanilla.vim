"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""             CONFIGS BASICAS             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
set laststatus=0
set showtabline=0
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.o,*.mp3,*.mp4,*.mov,*.mkv,*.ogg,*.dat
set ruler
set number
set lazyredraw
set showmode
set smarttab
set autoindent
set mouse=a
set hidden
set nobackup
set nowritebackup
set noswapfile
set nowrap
set clipboard=unnamedplus
syntax on
set hlsearch
set incsearch
filetype plugin on
filetype plugin indent on
set pumheight=10
set title
set encoding=utf-8
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set so=7
set foldenable
set foldmethod=marker
set title
set cursorline
set titlestring=%f\ %a\ %m titlelen=70
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_keepdir = 0
autocmd FileType netrw setl bufhidden=wipe
autocmd CursorMoved * echon ''
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""              CONFIGS TECLAS             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
let g:mapleader = ' '
nnoremap <silent> <C-s> :w!<CR>
nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> <Leader>w :w!<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <leader><S-q> :q!<CR>
nnoremap <S-h> <Home>
nnoremap <S-l> <End>
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
nnoremap <silent> <C-c> :bdelete!<CR>
xnoremap < <gv
xnoremap > >gv
nmap <silent> U <C-r>
nmap <S-y> y$
map ; :
nnoremap <Leader><Leader> za
nnoremap <silent> <Leader>f :Lex %:p:h<CR>
nnoremap <silent> <Leader>e :Lex %:p:h<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>
nnoremap <Leader>p ebi(<Esc>ea)<Esc>
nnoremap <Leader>l ebi{<Esc>ea}<Esc>
nnoremap <Leader>c ebi[<Esc>ea]<Esc>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""             CONFIGS COLORES             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
function! MyHighlights() abort
    highlight clear CursorLine
    highlight ModeMsg       cterm=NONE ctermfg=6
    highlight LineNr        cterm=NONE ctermfg=8
    highlight CursorLine    cterm=NONE           ctermbg=234
    highlight CursorLineNr  cterm=bold ctermfg=6 ctermbg=234
    highlight NonText       cterm=NONE ctermfg=0
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme pablo
" }}}
