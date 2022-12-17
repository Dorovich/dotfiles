local keymap = vim.keymap.set

nr = { noremap = true }
nrsl = { noremap = true, silent = true }
void = {}

function nmap (first, second, opts) keymap('n', first, second, opts) end
function imap (first, second, opts) keymap('i', first, second, opts) end
function cmap (first, second, opts) keymap('c', first, second, opts) end
function xmap (first, second, opts) keymap('x', first, second, opts) end
