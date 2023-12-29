" Comprovar que Vim-Plug está instalado:
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Comprovar que algunas carpetas estén creadas:
if !isdirectory($HOME.'/.vim/tmp')
	call mkdir($HOME.'/.vim/tmp/undo', 'p')
	call mkdir($HOME.'/.vim/tmp/backup', 'p')
	call mkdir($HOME.'/.vim/tmp/view', 'p')
endif

" Cambiar en lista los grupos de plugins a cargar (1=activo, 0=inactivo)
let usar_paquetes = { 'fuzzy': 1, 'colores': 1 }
let usar_lenguajes = { 'org': 1, 'lisp': 1, 'glsl': 0 }

" No guardar la vista (pliegues y tal) en los siguientes filetypes:
let no_guardar_vista = ['org']

set nocompatible
set hidden
set bg=dark
set mouse=a
set clipboard=unnamedplus
set laststatus=0
set showcmd
set showmode
set ruler
" set number relativenumber
set splitbelow splitright
set wildmenu wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.o,*.mp3,*.mp4,*.mov,*.mkv,*.ogg,*.dat
set backspace=2
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
" set cursorline
set scrolloff=1 sidescrolloff=1
set encoding=utf-8 fileencoding=utf-8
set t_Co=256
set undofile undodir=~/.vim/tmp/undo
set nobackup writebackup backupdir=~/.vim/tmp/backup
set viewoptions-=options viewdir=~/.vim/tmp/view
set viminfo+=n~/.vim/.viminfo
set shell=/usr/bin/bash

syntax enable
filetype plugin on
filetype plugin indent on

let g:better_escape_shortcut = 'jk'

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_winsize = 25
let g:netrw_keepdir = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'

let g:mapleader = ','
let g:maplocaleader = ' '

nmap ñ :
nmap U <c-r>
nmap Q gq
nmap Y y$
nmap <tab> za
nmap <silent> <c-q> :q<cr>
nmap <c-s> :w<cr>
nmap <leader>r :%s//g<left><left>
nmap <leader>c :!make<cr>
nmap <silent> <leader>t :term<cr>
xmap ñ :
xmap q <esc>
xmap > >gv
xmap < <gv

" Cambiar forma del cursor según el modo:
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

command! SudoWrite w !sudo tee %

autocmd FileType help :nmap <buffer> <silent> q <c-w>q

augroup guardar_pliegues
	autocmd!
	au BufWinLeave ?* if index(no_guardar_vista, &ft) < 0 | mkview | endif
	au BufWinEnter ?* silent! loadview
augroup END

function! RunFile()
	if &ft == 'c'
		execute('!make')
		" execute('!tcc -run %')
	elseif &ft == 'lisp'
		execute('!sbcl --script %')
	elseif &ft == 'xdefaults'
		execute('!xrdb %')
	else
		execute('echo "No runner avaiable!"')
	endif
endfunction

nmap <leader>s :call RunFile()<cr>

" Limpiar la carpeta con archivos temporales:
function! ClearTemp()
	call delete($HOME.'/.vim/tmp', 'rf')
	call delete($HOME.'/.vim/.viminfo', 'rf')
	call delete($HOME.'/.vim/.netrwhist', 'rf')
endfunction

" Mapeos para netrw
function! NetrwRemoveRecursive()
	if &filetype ==# 'netrw'
		cnoremap <buffer> <CR> rm -r<CR>
		normal mu
		normal mf
	try
		normal mx
	catch
		echo "Canceled"
	endtry
	cunmap <buffer> <CR>
	endif
endfunction

function! NetrwMapping()
	" Consultar para mas info:
	"   https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
	nmap <buffer> H u
	nmap <buffer> h -^
	nmap <buffer> l <CR>
	
	nmap <buffer> . gh
	nmap <buffer> P <C-w>z
	
	nmap <buffer> ff %:w<CR>:buffer #<CR>
	nmap <buffer> fr R
	nmap <buffer> fc mtmc
	nmap <buffer> fC mc
	nmap <buffer> fm mtmm
	nmap <buffer> fM mm
	nmap <buffer> fñ mx
	nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
	nmap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>
	nmap <buffer> fd :call NetrwRemoveRecursive()<CR>
	
	nmap <buffer> <TAB> mf
	nmap <buffer> <S-TAB> mF
	nmap <buffer> <Leader><TAB> mu
	
	nmap <buffer> bb mb
	nmap <buffer> bd mB
	nmap <buffer> bl gb
endfunction

augroup netrw_mapping
	autocmd!
	autocmd filetype netrw call NetrwMapping()
augroup END

" Para que C-q y C-s lleguen a vim:
silent !stty -ixon > /dev/null 2>/dev/null

" Si no los plugins que usan filetype no van
" (solo si se estan usando packs nativos de vim):
"runtime! ALL ftdetect/*.vim

" Cargar los plugins:
call plug#begin()
Plug 'jdhao/better-escape.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
if usar_paquetes['fuzzy']
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
endif
if usar_paquetes['colores']
	Plug 'srcery-colors/srcery-vim'
	Plug 'Everblush/everblush.vim'
	Plug 'rose-pine/vim'
	Plug 'ap/vim-css-color'
endif
if usar_lenguajes['org']
	Plug 'tpope/vim-speeddating'
	Plug 'jceb/vim-orgmode'
endif
if usar_lenguajes['lisp']
	Plug 'vim-scripts/paredit.vim'
	Plug 'vlime/vlime', {'rtp': 'vim/'}
endif
if usar_lenguajes['glsl']
	Plug 'tikhomirov/vim-glsl'
endif
call plug#end()

" OTROS PLUGINS ÚTILES:
" YouCompleteMe - motor de compleción
" fugitive.vim - integración con git

" Configuraciones extras de plugins
if usar_paquetes['fuzzy']
	nmap <leader>f :Files<cr>
	nmap <leader>b :Buffers<cr>
endif

if usar_paquetes['colores']
	let g:srcery_bg = ['NONE', 'NONE']
	let g:srcery_dim_lisp_paren = 1
	let g:srcery_italic = 1
	let g:srcery_hard_black_terminal_bg = 0
	let g:everblush_transp_bg = 1
	let g:disable_bg = 1
	colorscheme srcery
else
	colorscheme peachpuff
endif

" vi: ft=vim
