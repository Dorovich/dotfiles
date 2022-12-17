local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

opt.number = true
opt.relativenumber = true
opt.laststatus = 2
opt.showtabline = 0
opt.showmode = false
opt.ruler = true
opt.mouse = "a"
opt.timeoutlen = 200
opt.clipboard = "unnamedplus"
opt.scrolloff = 7
opt.pumheight = 10
opt.hlsearch = true
opt.lazyredraw = true
opt.path = "**"
opt.showcmd = true
opt.cursorline = true
opt.autoread = true
opt.wrap = true
opt.linebreak = true
opt.wildmenu = true
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.o,*.mp3,*.mp4,*.mov,*.mkv,*.ogg,*.dat"
opt.encoding = "UTF-8"
opt.foldenable = true
opt.foldmethod = "marker"

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
