" Uso vim-plug para gestionar los plugins
" Para instalarlo en sitemas unix: 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ...o bien se intala automaticamente si no lo esta:
" INSTALAR VIM-PLUG {{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" Plugin setup
call plug#begin()

Plug 'junegunn/fzf'                             " Buscador de archivos visual
Plug 'junegunn/fzf.vim'                         " Lo mismo de arriba
Plug 'scrooloose/nerdTree'                      " Menu lateral de archivos
Plug 'tpope/vim-surround'                       " Cierra parentesis automaticamente
Plug 'terryma/vim-multiple-cursors'             " Editar multiples instancias
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletado
Plug 'ryanoasis/vim-devicons'                   " Iconos dentro de la terminal
Plug 'bling/vim-bufferline'                     " Lista de buffers inferior
Plug 'bfrg/vim-cpp-modern'                      " Mejores colores para C/C++

call plug#end()

" CONFIGS {{{
      
" bufferline
" poner a 1 para activar el plugin
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_show_bufnr = 0
let g:bufferline_pathshorten = 1
let g:bufferline_modified = '+'

" coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-clangd',
  \ 'coc-lua',
  \ ]
  
" nerdtree
let g:NERDTreeDirArrowExpandable="►"
let g:NERDTreeDirArrowCollapsible="▼"

" }}}
