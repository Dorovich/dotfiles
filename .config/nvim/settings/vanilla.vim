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
set relativenumber
set lazyredraw
set showmode
set path+=**
set smarttab
set autoindent
set mouse=a
set hidden
set nobackup
set nowritebackup
set noswapfile
set nowrap
set clipboard=unnamedplus
set hlsearch
set incsearch
set pumheight=10
set timeoutlen=300
set encoding=utf-8
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set scrolloff=7
set shortmess+=a
set autoread
set foldenable
set foldmethod=marker
set title
set cursorline
set titlestring=%f\ %a\ %m titlelen=70
set statusline=>\ %f
syntax on
filetype plugin on
filetype plugin indent on
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
nnoremap <silent> <Leader><S-q> :q!<CR>
nnoremap <S-h> <Home>
nnoremap <S-l> <End>
imap jk <Esc>l
imap kj <Esc>l
cmap jk <Esc>
cmap kj <Esc>
vmap q <Esc>
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
nnoremap <silent> <C-c> :bdelete!<CR>
xnoremap < <gv
xnoremap > >gv
nnoremap <silent> U <C-r>
nmap <S-y> y$
map ; :
map ñ :
map Q gq
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
nnoremap <Leader>pp bi(<Esc>ea)<Esc>
nnoremap <Leader>ll bi{<Esc>ea}<Esc>
nnoremap <Leader>cc bi[<Esc>ea]<Esc>
nnoremap / /\v
vnoremap / /\v
nnoremap <Leader>h :noh<cr>
nnoremap <C-r> :%s//gI<Left><Left><Left>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""             CONFIGS COLORES             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
function! MyHighlights() abort
    highlight clear CursorLine
    "         object       effect       foreground   background
    highlight Normal       cterm=none   ctermfg=15   ctermbg=none
    highlight VertSplit    cterm=none   ctermfg=0    ctermbg=0
    highlight Statement    cterm=none   ctermfg=3    ctermbg=none
    highlight Directory    cterm=none   ctermfg=4    ctermbg=none
    highlight Constant     cterm=none   ctermfg=3    ctermbg=none
    highlight Special      cterm=none   ctermfg=4    ctermbg=none
    highlight Identifier   cterm=none   ctermfg=6    ctermbg=none
    highlight PreProc      cterm=none   ctermfg=5    ctermbg=none
    highlight String       cterm=none   ctermfg=12   ctermbg=none
    highlight Number       cterm=none   ctermfg=1    ctermbg=none
    highlight Function     cterm=none   ctermfg=1    ctermbg=none
    highlight Visual       cterm=none   ctermfg=none ctermbg=238
    highlight Character    cterm=none   ctermfg=12   ctermbg=none
    highlight ModeMsg      cterm=none   ctermfg=6    ctermbg=none
    highlight LineNr       cterm=none   ctermfg=8    ctermbg=none
    highlight CursorLine   cterm=none   ctermfg=none ctermbg=234
    highlight CursorLineNr cterm=bold   ctermfg=6    ctermbg=234
    highlight NonText      cterm=none   ctermfg=0    ctermbg=none
    highlight Comment      cterm=none   ctermfg=8    ctermbg=none
    highlight StatusLine   cterm=none   ctermfg=none ctermbg=none
    highlight StatusLineNC cterm=none   ctermfg=none ctermbg=none
    highlight MatchParen   cterm=none   ctermfg=none ctermbg=238
    highlight Folded       cterm=italic ctermfg=8    ctermbg=none
    highlight SignColumn   cterm=none   ctermfg=none ctermbg=none
    highlight Pmenu        cterm=none   ctermfg=7    ctermbg=236
    highlight PmenuSel     cterm=none   ctermfg=236  ctermbg=180
    highlight PmenuSbar    cterm=none   ctermfg=none ctermbg=236
    highlight PmenuThumb   cterm=none   ctermfg=none ctermbg=238
    highlight Todo         cterm=bold   ctermfg=0    ctermbg=2
    highlight Error        cterm=bold   ctermfg=0    ctermbg=1
    highlight ErrorMsg     cterm=bold   ctermfg=0    ctermbg=1
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme pablo
" }}}
