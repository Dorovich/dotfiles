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

Plug 'scrooloose/nerdTree'                          " Menu lateral de archivos
Plug 'tpope/vim-surround'                           " Cierra parentesis automaticamente
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Editar multiples instancias
Plug 'ryanoasis/vim-devicons'                       " Iconos dentro de la terminal
Plug 'bfrg/vim-cpp-modern'                          " Mejores colores para C/C++
Plug 'jceb/vim-orgmode'                             " Emulacion de Org-mode

Plug 'neovim/nvim-lspconfig'                        " Cofiguraciones para LSP
Plug 'hrsh7th/nvim-cmp'                             " Autocomopletado de texto y tal
Plug 'hrsh7th/cmp-nvim-lsp'                         " Lo mismo de arriba
Plug 'hrsh7th/cmp-buffer'                           " Para datos del búfer
Plug 'hrsh7th/cmp-path'                             " Para rutas del sistema
Plug 'L3MON4D3/LuaSnip'                             " Sugerencias de palabras
Plug 'saadparwaiz1/cmp_luasnip'                     " LuaSnip + nvim-cmp

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

" nerdtree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" nvim-cmp
lua <<EOF
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { capabilities = capabilities, }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
}

--require'lspconfig'.rust_analyzer.setup{}

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

EOF

" }}}
