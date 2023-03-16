require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'lua_ls' }
})

local attach_data = function(_, _)
    require('core/utils')
    Nmap('<Leader>rn', vim.lsp.buf.rename, None)
    Nmap('<Leader>ca', vim.lsp.buf.code_action, None)
    Nmap('gd', vim.lsp.buf.definition, None)
    Nmap('gD', vim.lsp.buf.declaration, None)
    Nmap('gi', vim.lsp.buf.implementation, None)
    Nmap('gr', require('telescope/builtin').lsp_references, None)
    Nmap('K', vim.lsp.buf.hover, None)
end

local capability_data = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup {
    on_attach = attach_data,
    capabilities = capability_data,
    cmd = { "clangd", "--query-driver=/usr/bin/g++" }
}

require('lspconfig').lua_ls.setup {
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
