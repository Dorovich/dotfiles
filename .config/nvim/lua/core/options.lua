local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

opt.laststatus = 2
opt.showtabline = 0
opt.showmode = true
opt.mouse = "a"
opt.shortmess = "a"
opt.timeoutlen = 200
opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.scrolloff = 7
opt.hlsearch = true
opt.lazyredraw = true
opt.ruler = true
opt.path = "**"
opt.wildmenu = true
opt.showcmd = true
opt.cursorline = true
opt.autoread = true
opt.wrap = true
opt.linebreak = true
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.o,*.mp3,*.mp4,*.mov,*.mkv,*.ogg,*.dat"
opt.encoding = "UTF-8"
opt.pumheight = 10

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
