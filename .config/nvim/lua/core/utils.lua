Glb = vim.g
Opt = vim.opt
Optl = vim.opt_local
Keymap = vim.keymap.set
Autocmd = vim.api.nvim_create_autocmd

NR = { noremap = true }
SL = { silent = true }
BF = { buffer = true }
NRSL = { noremap = true, silent = true }
NRBF = { noremap = true, buffer = true }
NRSLBF = { noremap = true, silent = true, buffer = true }
None = {}

function Nmap (first, second, opts)
    Keymap('n', first, second, opts)
end

function Imap (first, second, opts)
    Keymap('i', first, second, opts)
end

function Cmap (first, second, opts)
    Keymap('c', first, second, opts)
end

function Vmap (first, second, opts)
    Keymap('v', first, second, opts)
end

function Xmap (first, second, opts)
    Keymap('x', first, second, opts)
end
