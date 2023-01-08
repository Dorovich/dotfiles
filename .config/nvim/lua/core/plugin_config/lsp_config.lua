require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'sumneko_lua' }
})

local attach_data = function(_, _)
    require('core/utils')
    NMAP('<Leader>rn', vim.lsp.buf.rename, VOID)
    NMAP('<Leader>ca', vim.lsp.buf.code_action, VOID)
    NMAP('gd', vim.lsp.buf.definition, VOID)
    NMAP('gD', vim.lsp.buf.declaration, VOID)
    NMAP('gi', vim.lsp.buf.implementation, VOID)
    NMAP('gr', require('telescope/builtin').lsp_references, VOID)
    NMAP('K', vim.lsp.buf.hover, VOID)
end

local capability_data = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup {
    on_attach = attach_data,
    capabilities = capability_data,
    cmd = { "clangd", "--query-driver=/usr/bin/g++" }
}

require('lspconfig').sumneko_lua.setup {
    on_attach = attach_data,
    capabilities = capability_data,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "luasnip" },
            },
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
