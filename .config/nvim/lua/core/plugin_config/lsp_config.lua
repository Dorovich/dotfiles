require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd' }
})

local on_attach = function()
    require('core/utils')
    nmap('<Leader>rn', vim.lsp.buf.rename, void)
    nmap('<Leader>ca', vim.lsp.buf.code_action, void)
    nmap('gd', vim.lsp.buf.definition, void)
    nmap('gi', vim.lsp.buf.implementation, void)
    nmap('gr', require('telescope/builtin').lsp_references, void)
    nmap('K', vim.lsp.buf.hover, void)
end

require('lspconfig').clangd.setup {
    on_attach = on_attach
}
