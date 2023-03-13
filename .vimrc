" Settings
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
set shiftwidth=4
set scrolloff=7
set shortmess+=a
set autoread
set title
set cursorline
set statusline=>\ %f
filetype plugin on
filetype plugin indent on

" Mappings
map ñ :
map Ñ :
map Q gq
nmap <S-y> y$
nmap <TAB> za
nnoremap <C-s> :w!<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-S-q> :q!<CR>
nnoremap <S-h> <Home>
nnoremap <S-l> <End>
nnoremap <silent> U <C-r>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>
nnoremap <C-r> :%s//gI<Left><Left><Left>
inoremap jk <Esc>
vmap q <Esc>
xnoremap < <gv
xnoremap > >gv
