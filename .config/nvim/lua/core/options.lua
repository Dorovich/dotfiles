local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

opt.number = true
opt.relativenumber = true
opt.laststatus = 0
opt.showtabline = 0
opt.cursorline = true
opt.showmode = true
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
opt.wrap = false
opt.linebreak = true
opt.wildmenu = true
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe,*.o,*.mp3,*.mp4,*.mov,*.mkv,*.ogg,*.dat"
opt.foldenable = true
opt.foldmethod = "marker"
opt.updatetime = 50
opt.incsearch = true
opt.hlsearch = true
opt.encoding = "UTF-8"
opt.splitbelow = true
opt.splitright = true
vim.cmd('language es_ES.utf8')
g.c_syntax_for_h = true

-- Tabulaciones
opt.smarttab = true
opt.autoindent = true
opt.expandtab = false
opt.shiftwidth = 4 -- sustituye tabs por espacios

-- Copias de seguridad
opt.backup = false
opt.writebackup = false
opt.undofile = false
opt.swapfile = false
