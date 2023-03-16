require('core/options')
require('core/keybinds')
require('core/autocmds')
require('core/plugins')
require('core/plugin_config')

--[[
vim.opt.number = true
vim.opt.laststatus = 0
vim.opt.swapfile = false
vim.opt.shiftwidth = 4
vim.opt.lazyredraw = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pumheight = 8
vim.opt.path = '.,/usr/include'
vim.opt.mousemodel = 'extend'
vim.g.mapleader = ','
vim.g.c_syntax_for_h = true
vim.keymap.set('n', 'ñ', ':', {})
vim.keymap.set('i', 'jk', '<Esc>', {})
vim.keymap.set('n', '<Leader>r', ':%s//g<Left><Left>', {})
vim.keymap.set('n', '<Leader>t', ':split<CR>:term<CR>i', {})
vim.keymap.set('n', '<Leader>c', ':!make<CR>', {})
vim.api.nvim_create_autocmd("TermClose", { command = "call nvim_input('<CR>')" })
--]]
