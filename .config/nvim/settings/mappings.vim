"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""             BASIC MAPPINGS              """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
let g:mapleader = ' '
nnoremap <silent> <C-s> :w!<CR>
nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> <Leader>w :w!<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader><S-q> :q!<CR>
nnoremap <S-h> <Home>
nnoremap <S-l> <End>
imap jk <Esc>l
cmap jk <Esc>
vmap q <Esc>
nnoremap <silent> <TAB> :bnext<CR>:file<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>:file<CR>
nnoremap <silent> <C-c> :bdelete!<CR>
xnoremap < <gv
xnoremap > >gv
nnoremap <silent> U <C-r>
nnoremap <S-y> y$
map ; :
map ñ :
map Q gq
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
nnoremap <Leader>pp bi(<Esc>ea)<Esc>
nnoremap <Leader>ll bi{<Esc>ea}<Esc>
nnoremap <Leader>cc bi[<Esc>ea]<Esc>
nnoremap <silent> <Leader>h :noh<cr>
nnoremap <C-r> :%s//gI<Left><Left><Left>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""            PLUGIN MAPPINGS              """""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (Espacio dos veces para desplegar) {{{
map <silent> <leader>f :Files<CR>
map <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-?> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-<> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C->> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" }}}
