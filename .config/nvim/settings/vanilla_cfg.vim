"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""             CONFIGS BASICAS             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=0                " no mostrar la barra de estado
set showtabline=0               " no mostrar la barra de pestañas
set wildmenu                    " sugerencias de comandos
set ruler                       " posicion del cursor abajo a la derecha
set number                      " numero de linea
set lazyredraw                  " no actualizar pantalla al ejecutar macros
set smarttab
set smartindent
set autoindent                  " tabular automaticamente entre {}, por ej.
set mouse=a                     " poder seleccionar con el raton
set hidden                      " esconder buffers inactivos
set nobackup
set nowritebackup
set nocompatible                " quitar compatibilidad con vi
set clipboard=unnamedplus       " copiar/pegar desde fuera de vim
syntax on                       " colorear palabras clave segun el lenguaje
set hlsearch
set incsearch
filetype plugin on
filetype plugin indent on
set tabstop=4                   " tabular inserta 4 espacios
set shiftwidth=4                " esto tiene que ver tambien con el tabulado


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""              CONFIGS TECLAS             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mapleader = ' '           " lider = espacio
nnoremap <C-s> :w!<CR>          " guardar con control+s
nnoremap <C-q> :q<CR>           " salir con control-q
nnoremap <leader>w :w!<CR>      " guardar con lider+w
nnoremap <leader>q :q<CR>       " salir con lider-q
nnoremap <S-h> I<ESC>           " shift-h te lleva a inicio de linea
nnoremap <S-l> A<ESC>           " shift-l te lleva a final de linea
inoremap jk <Esc>               " jk para salir de modo insertar
inoremap kj <Esc>               " kj tambien sirve para salir
nnoremap <TAB> :bnext<CR>       " tab en modo normal cicla entre buffers
noremap <S-TAB> :bprevious<CR>  " shift-tab cicla al reves
nnoremap <C-c> :bdelete!<CR>    " control-c cierra el buffer                            
xnoremap < <gv                  " en modo visual, > tabula en area
xnoremap > >gv                  " en modo visual, < destabula en area
map ; :                         " tambien se puede abrir comando con ;
nnoremap <Space><Space> a<Space><ESC>h  " en modo normal, doble espacio añade uno
