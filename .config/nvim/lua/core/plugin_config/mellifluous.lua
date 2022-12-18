-- https://github.com/ramojus/mellifluous.nvim

require('mellifluous').setup({
    dim_inactive = false,
    color_set = 'mellifluous',

    transparent_background = {
        enabled = true,
        cursor_line = false,
    },
    plugins = {
        --cmp = true,
        nvim_tree = {
            enabled = true,
            show_root = false,
        },
    },
    telescope = {
        enabled = true
    },
})

vim.o.termguicolors = true
vim.cmd [[ colorscheme mellifluous ]]
