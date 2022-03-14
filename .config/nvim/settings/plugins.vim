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

Plug 'junegunn/fzf'                                 " [leader-f] Buscador de archivos visual
Plug 'junegunn/fzf.vim'                             "            Lo mismo de arriba
Plug 'scrooloose/nerdTree'                          " [leader-o] Menu lateral de archivos
Plug 'tpope/vim-surround'                           "            Cierra parentesis automaticamente
Plug 'itchyny/lightline.vim'                        "            Barra de estado inferior
Plug 'terryma/vim-multiple-cursors'                 " [leader-n] Editar multiples instancias
Plug 'neoclide/coc.nvim', {'branch': 'release'}     "            Autocompletado
Plug 'mengelbrecht/lightline-bufferline'            "            Barra de buffers superior
Plug 'ryanoasis/vim-devicons'                       "            Iconos dentro de la terminal
Plug 'mhinz/vim-startify'                           "            Pantalla de inicio
Plug 'mangeshrex/everblush.vim'                     "            Paleta de colores
Plug 'rafi/awesome-vim-colorschemes'                "            Colores variados

call plug#end()



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
  
" nerdtree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

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

