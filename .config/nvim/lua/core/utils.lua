-- Keymapping functions

local keymap = vim.keymap.set
local bufkeymap = vim.api.vim_buf_set_keymap

NR = { noremap = true }
SL = { silent = true }
NRSL = { noremap = true, silent = true }
VOID = {}

function NMAP (first, second, opts)
    keymap('n', first, second, opts)
end

function IMAP (first, second, opts)
    keymap('i', first, second, opts)
end

function CMAP (first, second, opts)
    keymap('c', first, second, opts)
end

function VMAP (first, second, opts)
    keymap('v', first, second, opts)
end

function XMAP (first, second, opts)
    keymap('x', first, second, opts)
end

function BFR_NMAP (bufnr, first, second, opts)
    bufkeymap(bufnr, 'n', first, second, opts)
end

function BFR_IMAP (bufnr, first, second, opts)
    bufkeymap(bufnr, 'i', first, second, opts)
end

function BFR_CMAP (bufnr, first, second, opts)
    bufkeymap(bufnr, 'c', first, second, opts)
end
