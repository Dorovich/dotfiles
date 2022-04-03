"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""             BASIC MAPPINGS              """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tecla lider es ESPACIO, se usa en modo normal
let g:mapleader = ' '

" CONTROL-S para guardar
nnoremap <C-s> :w!<CR>
nnoremap <leader>s :w!<CR>
nnoremap <leader>w :w!<CR>

" CONTROL-Q para salir
nnoremap <C-q> :q<CR>
nnoremap <leader>q :q<CR>

" LIDER-ESC para salir sin guardar
nnoremap <leader><S-q> :q!<CR>

" CONTROL-H y CONTROL-L para moverse a principio/final de linea
nnoremap <S-h> I<ESC>
nnoremap <S-l> A<ESC>

" w to go a word forward (default), shift-w to go a word backwards
nnoremap <S-w> b

" Copiar hasta final de liea
nmap Y y$

" Deshacer cambios con SHIFT-U
nmap <silent> U <C-r>           " shift-u para deshacer cambios

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" TAB in general mode will move between buffers
nnoremap <TAB> :bnext<CR>
noremap <S-TAB> :bprevious<CR>

" CONTROL-C will delete the current buffer
nnoremap <C-c> :bdelete!<CR>

" Continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://superuser.com/q/310417/736190
xnoremap < <gv
xnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Insert a space after current character
"nnoremap <Space><Space> a<Space><ESC>h

" Plegar/Desplegar texto
nnoremap <Leader><Leader> za

" tambien se pueden poner comandos con ';'
map ; :

" Buscador de archivos (netrw)
nnoremap <silent> <Leader>e :Lex %:p:h<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""            PLUGIN MAPPINGS              """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" abrir fzf: CONTROL-V para dividir verticalmente, CONTROL-X para dividir horizontalmente
map <leader>f :Files<CR>

" CONTROL-J y CONTROL-K para moverse entre ventanas abiertas
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" LIDER-O abre NerdTree
map <leader>n :NERDTreeToggle<CR>

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

" autocompletado con TAB
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

