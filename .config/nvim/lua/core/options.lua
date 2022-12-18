local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

opt.number = true
opt.relativenumber = true
opt.laststatus = 2
opt.showtabline = 0
opt.cursorline = true
opt.showmode = false
opt.ruler = true

opt.mouse = "a"
opt.timeoutlen = 500
opt.clipboard = "unnamedplus"
opt.scrolloff = 7
opt.pumheight = 10
opt.lazyredraw = true
opt.path = "**"
opt.showcmd = true
opt.autoread = true
opt.wrap = true
opt.linebreak = true
opt.wildmenu = true
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.o,*.mp3,*.mp4,*.mov,*.mkv,*.ogg,*.dat"
opt.foldenable = true
opt.foldmethod = "marker"
opt.updatetime = 50
opt.incsearch = true
opt.hlsearch = true
opt.encoding = "UTF-8"
vim.cmd('language es_ES.utf8')

-- Tabulaciones
opt.smarttab = true
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 8
opt.shiftwidth = 4
opt.softtabstop = 4

-- Copias de seguridad
opt.backup = false
opt.writebackup = false
opt.undofile = false
opt.swapfile = false
