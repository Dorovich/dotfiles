"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""             BASIC MAPPINGS              """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
let g:mapleader = ' '
nnoremap <silent> <C-s> :w!<CR>
nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> <Leader>w :w!<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <leader><S-q> :q!<CR>
nnoremap <S-h> <Home>
nnoremap <S-l> <End>
imap jk <Esc>
imap kj <Esc>
vmap q <Esc>
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
nnoremap <silent> <C-c> :bdelete!<CR>
xnoremap < <gv
xnoremap > >gv
nmap <silent> U <C-r>
nmap <S-y> y$
map ; :
map ñ :
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
nnoremap <Leader>p ebi(<Esc>ea)<Esc>
nnoremap <Leader>l ebi{<Esc>ea}<Esc>
nnoremap <Leader>c ebi[<Esc>ea]<Esc>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""           FUNCTION MAPPINGS             """""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
"nnoremap <silent> <F1> :call ToggleFocusMode()<CR>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""            PLUGIN MAPPINGS              """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
map <leader>f :Files<CR>
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
map <leader>n :NERDTreeToggle<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}
