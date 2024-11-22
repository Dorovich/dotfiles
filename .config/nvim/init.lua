vim.opt.autochdir = true
vim.opt.cindent = true
vim.opt.cinoptions = ':0,l1,t0'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.lazyredraw = true
vim.opt.makeprg = 'make -j$(nproc)'
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.undofile = true
vim.opt.wrap = false

vim.g.mapleader = ','

vim.keymap.set('n', '<leader>e', ':cwindow<cr>', { silent = true })
vim.keymap.set('n', '<leader>r', ':%s//g<left><left>', nil)
vim.keymap.set('n', 'U', '<c-r>', nil)
vim.keymap.set('n', 'gb', ':buffers<cr>:b<space>', nil)
vim.keymap.set('n', 'ñ', ':', nil)
vim.keymap.set('x', '<', '<gv', nil)
vim.keymap.set('x', '>', '>gv', nil)
vim.keymap.set('x', 'ñ', ':', nil)

vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'c', 'cpp' },
	callback = function()
		vim.opt_local.colorcolumn = '80'
		vim.keymap.set('n', '<c-j>', ':cnext!<cr>', { buffer = true })
		vim.keymap.set('n', '<c-k>', ':cprev!<cr>', { buffer = true })
	end
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'qf' },
	callback = function()
		vim.keymap.set('n', '<c-j>', ':cnext!<cr>', { buffer = true, silent = true })
		vim.keymap.set('n', '<c-k>', ':cprev!<cr>', { buffer = true, silent = true })
	end
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'text', 'markdown' },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		fname_noext = vim.fn.expand("%:t:r")
		fname = vim.fn.expand("%:t")
		vim.opt_local.makeprg = "pandoc -s -o "..fname_noext..".html".." "..fname
	end
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	'Raimondi/delimitMate',
	'tpope/vim-commentary',
	'tpope/vim-surround',
	{
		'srcery-colors/srcery-vim',
		config = function()
			vim.g.srcery_bg = { 'NONE', 'NONE' }
			vim.g.srcery_bold = 1
			vim.g.srcery_italic = 0
			vim.cmd('colorscheme srcery')
		end
	},
	{
		'NeogitOrg/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
			'ibhagwan/fzf-lua'
		},
		config = function()
			neogit = require('neogit')
			vim.keymap.set('n', '<leader>g', function()
				neogit.open({ kind = 'split' })
			end, nil)
		end
	}
})

