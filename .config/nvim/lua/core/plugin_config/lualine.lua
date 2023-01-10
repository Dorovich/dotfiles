vim.opt.laststatus = 2
vim.opt.ruler = false
vim.opt.showmode = false

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'codedark',
    },
}
