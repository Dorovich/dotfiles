" Uso vim-plug para gestionar los plugins
" Para instalarlo en sitemas unix: 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" vim-plug se intala automaticamente si no lo esta:
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin setup
call plug#begin()

Plug 'junegunn/fzf'                                        " [;]   Buscador de archivos visual
Plug 'junegunn/fzf.vim'                                    "       Lo mismo de arriba
Plug 'scrooloose/nerdTree'                                 " [C-o] Menu lateral de archivos
Plug 'tpope/vim-surround'                                  "       Cierra parentesis automaticamente
Plug 'itchyny/lightline.vim'                               "       Barra de estado inferior
Plug 'terryma/vim-multiple-cursors'                        " [C-n] Editar multiples instancias
Plug 'neoclide/coc.nvim', {'branch': 'release'}            "       Autocompletado
Plug 'mengelbrecht/lightline-bufferline'                   "       Barra de buffers superior
Plug 'ryanoasis/vim-devicons'                              "       Iconos dentro de la terminal
Plug 'mhinz/vim-startify'                                  "       Pantalla de inicio

call plug#end()

" Configuraciones basicas de nvim
set laststatus=2    " para no ver la barra de estado poner a 0
set number
set expandtab
set tabstop=4
set showtabline=2   " mostrar la barra de tabs/buffers
set shiftwidth=4
set smarttab
set smartindent
set autoindent
set cursorline
set noswapfile
set hlsearch
set incsearch
set mouse=a
set noshowmode      " desactiva el estado actual en la linea de comandos
set pumheight=10
set hidden
set nowrap
set nobackup
set nowritebackup
set clipboard=unnamedplus
set encoding=UTF-8
set nocompatible
filetype plugin on
filetype plugin indent on
syntax on
colorscheme pablo " koehler tambien esta bien

" w to go a word forward (default), shift-w to go a word backwards
nnoremap <S-w> b

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" TAB in general mode will move between buffers
nnoremap <TAB> :bnext<CR>
noremap <S-TAB> :bprevious<CR>

" CONTROL-C will delete the current buffer
nnoremap <C-c> :bdelete!<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" abrir fzf: CONTROL-V para dividir verticalmente, CONTROL-X para dividir horizontalmente
map ; :Files<CR> 

" CONTROL-J y CONTROL-K para moverse entre ventanas abiertas
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" CONTROL-O abre NerdTree
map <C-o> :NERDTreeToggle<CR>

" lightline
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = { 'colorscheme': 'one' }
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
      
" coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-clangd',
  \ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" cambia los simbolos de NerdTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" autocompletado con TAB
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" startify
let g:startify_custom_header = [
    \ "                                                                     ",
    \ "              ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗     ",
    \ "              ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     ",
    \ "              ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     ",
    \ "              ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ",
    \ "              ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║     ",
    \ "              ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝     ",
    \ "                                                                     ",
    \ ]
            
let g:startify_change_to_dir = 1
let g:startify_enable_special = 0
let g:startify_files_number = 5
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   recent']             },
    \ { 'type': 'dir',       'header': ['   files @ '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': ['   bookmarks']          },
    \ ]
let g:startify_bookmarks = [
    \ { 'f': '~/.config/nvim/init.vim'     },
    \ { 'g': '~/.bashrc'                   },
    \ { 'h': '~/.config/kitty/kitty.conf'  },
    \ ]

