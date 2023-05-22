" Comprovar que algunas carpetas estén creadas:
if !isdirectory($HOME.'/.vim/tmp')
	call mkdir($HOME.'/.vim/tmp/undo', 'p')
	call mkdir($HOME.'/.vim/tmp/backup', 'p')
	call mkdir($HOME.'/.vim/tmp/view', 'p')
endif

" Cambiar en lista los grupos de plugins a cargar (1=activo, 0=inactivo)
let cargar_plugins = { 'fuzzy': 1, 'colores': 1, 'orgmode': 1 }

" No guardar la vista (pliegues y tal) en los siguientes filetypes:
let no_guardar_vista = ['org']

" OTROS PLUGINS ÚTILES:
" YouCompleteMe - motor de compleción
" vlime - desarollo de common lisp
" paredit.vim - paréntesis y s-expressions
" fugitive.vim - integración con git

set nocompatible
set hidden
set bg=dark
set mouse=a
set clipboard=unnamedplus
set laststatus=0
set showcmd
set showmode
set ruler
set number relativenumber
set splitbelow splitright
set wildmenu wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.o,*.mp3,*.mp4,*.mov,*.mkv,*.ogg,*.dat
set autoread
set lazyredraw
set shortmess+=a
set autoindent
set hlsearch incsearch
set nowrap
set noswapfile
set smarttab
set smartcase
set autoindent
set title
set cursorline
set scrolloff=1 sidescrolloff=1
set encoding=utf-8 fileencoding=utf-8
set t_Co=256
set omnifunc=syntaxcomplete#Complete
set undofile undodir=~/.vim/tmp/undo
set nobackup writebackup backupdir=~/.vim/tmp/backup
set viewoptions-=options viewdir=~/.vim/tmp/view
set viminfo+=n~/.vim/.viminfo

syntax enable
filetype plugin on
filetype plugin indent on

let g:better_escape_shortcut = 'jk'

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_winsize = 25

let g:mapleader = ','
let g:maplocaleader = ' '

nmap ñ :
nmap U <c-r>
nmap Q gq
nmap <c-q> :q<cr>
nmap <c-s> :w<cr>
nmap <leader>r :%s//g<left><left>
nmap <leader>c :!make<cr>
nmap <silent> <leader>t :term<cr>
xmap q <esc>
xmap > >gv
xmap < <gv

" Cambiar forma del cursor según el modo:
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


autocmd FileType help :nmap <buffer> <silent> q <c-w>q

augroup guardar_pliegues
	autocmd!
	au BufWinLeave ?* if index(no_guardar_vista, &ft) < 0 | mkview | endif
	au BufWinEnter ?* silent! loadview
augroup END

" Limpiar la carpeta con archivos temporales:
function! ClearTemp()
	call delete($HOME.'/.vim/tmp', 'rf')
endfunction

" Para que C-q y C-s lleguen a vim:
silent !stty -ixon > /dev/null 2>/dev/null

" function! RunFile()
" 	let s:ft = &ft
" 	if s:ft = 'c'
" 		execute('')
" endfunction

" Si no los plugins que usan filetype no van:
runtime! ALL ftdetect/*.vim

" Cargar los plugins:
if cargar_plugins['fuzzy']
	packadd! fzf
	packadd! fzf.vim
	nmap <leader>f :Files<cr>
endif

if cargar_plugins['colores']
	packadd! srcery
	packadd! everblush
	packadd! rosepine
	let g:srcery_bg_passthrough = 1
	let g:srcery_dim_lisp_paren = 1
	let g:srcery_italic = 1
	let g:srcery_hard_black_terminal_bg = 0
	let g:everblush_transp_bg = 1
	let g:disable_bg = 1
	colorscheme srcery
else
	colorscheme peachpuff
endif

if cargar_plugins['orgmode']
	packadd! vim-speeddating
	packadd! orgmode
	silent! helptags ALL
endif
