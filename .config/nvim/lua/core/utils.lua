-- Keymapping functions

local keymap = vim.keymap.set

NR = { noremap = true }
SL = { silent = true }
BFR = { buffer = true }
NRSL = { noremap = true, silent = true }
NRBFR = { noremap = true, buffer = true }
NRSLBFR = { noremap = true, silent = true, buffer = true }
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
