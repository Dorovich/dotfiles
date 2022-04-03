"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""             CONFIGS BASICAS             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
set laststatus=0                " no mostrar la barra de estado
set showtabline=0               " no mostrar la barra de pestañas
set wildmenu                    " sugerencias de comandos
set ruler                       " posicion del cursor abajo a la derecha
set number                      " numero de linea
set lazyredraw                  " no actualizar pantalla al ejecutar macros
set showmode                    " mostrar modo actual en la linea de comando
set smarttab
set smartindent                 " tabular automaticamente entre {}, por ej.
set autoindent                  " copia la tabulacion de la linea anterior
set mouse=a                     " poder seleccionar con el raton
set hidden                      " esconder buffers inactivos
set nobackup                    " no hacer copia de seguridad al sobreescribir
set nowritebackup               " lo mismo de arriba basicamente
set nocompatible                " quitar compatibilidad con vi
set clipboard=unnamedplus       " copiar/pegar desde fuera de vim
syntax on                       " colorear palabras clave segun el lenguaje
set hlsearch                    " subrayar todos los similares cuando buscas
set incsearch                   " mostar patron mientras se busca
filetype plugin on
filetype plugin indent on
set tabstop=4                   " tabular inserta 4 espacios
set shiftwidth=4                " esto tiene que ver tambien con el tabulado
set so=7                        " lineas de margen al desplazarse
set foldenable                  " activar el plegado de texto
set foldmethod=marker           " plegar el texto rodeado con {{{ y }}}

set list                        " requerido para usar 'listchars'
set noexpandtab                 " tabular inserta tabs, no espacios
set listchars=tab:\·\           " simbolo a usar en las tabulaciones
hi Whitespace ctermfg=8         " color de las tabulaciones

let g:netrw_winsize = 30        " netrw ocupa el 30% de la pantalla
let g:netrw_banner = 0          " no muestra el mensaje en netrw
let g:netrw_keepdir = 0	        " netrw busca en el mismo directorio
autocmd FileType netrw setl bufhidden=wipe " borra los buffers que crea netrw por alguna razon
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""              CONFIGS TECLAS             """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
let g:mapleader = ' '           " lider = espacio
nnoremap <C-s> :w!<CR>          " guardar con control+s
nnoremap <C-q> :q<CR>           " salir con control-q
nnoremap <Leader>w :w!<CR>      " guardar con lider+w
nnoremap <Leader>q :q<CR>       " salir con lider-q
nnoremap <S-h> I<ESC>           " shift-h te lleva a inicio de linea
nnoremap <S-l> A<ESC>           " shift-l te lleva a final de linea
inoremap jk <Esc>               " jk para salir de modo insertar
inoremap kj <Esc>               " kj tambien sirve para salir
nnoremap <TAB> :bnext<CR>       " tab en modo normal cicla entre buffers
noremap <S-TAB> :bprevious<CR>  " shift-tab cicla al reves
nnoremap <C-c> :bdelete!<CR>    " control-c cierra el buffer                            
xnoremap < <gv                  " en modo visual, > tabula en area
xnoremap > >gv                  " en modo visual, < destabula en area
nmap <silent> U <C-r>           " shift-u para deshacer cambios
map ; :                         " tambien se puede abrir comando con ;
nnoremap <Leader><Leader> za    " lider-lider abre o cierra texto plegado
nnoremap <silent> <Leader>f :Lex %:p:h<CR> " lider-f abre o cierra netrw
" }}}
