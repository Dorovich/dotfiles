require('core/utils')

Nmap('<C-h>', '<C-w>h', SL)
Nmap('<C-j>', '<C-w>j', SL)
Nmap('<C-k>', '<C-w>k', SL)
Nmap('<C-l>', '<C-w>l', SL)

Nmap('<C-d>', '<C-d>zz', None)
Nmap('<C-u>', '<C-u>zz', None)
Nmap('<C-f>', '<C-f>zz', None)
Nmap('<C-b>', '<C-b>zz', None)

Nmap('<C-s>', ':w<CR>', None) -- usa ZZ
Nmap('<C-q>', ':q<CR>', None) -- usa ZQ
Nmap('<M-h>', ':bprevious<CR>', SL)
Nmap('<M-l>', ':bnext<CR>', SL)
Nmap('<Tab>', 'za', NRSL)
Nmap('n', 'nzz', None)
Nmap('N', 'Nzz', None)
Nmap('U', '<C-r>', SL)
Nmap('ñ', ':', None)

Nmap('<Leader>r', ':%s//g<Left><Left>', None)
Nmap('<Leader>c', ':!make<CR>', None)
Nmap('<Leader>t', ':split<CR>:term<CR>i', None)
Nmap('<Leader>s', ':!clisp %<CR>', None)
-- Nmap('<Leader>s', ':!guile --no-auto-compile -s %<CR>', None)

Vmap('J', ":m '>+1<CR>gv=gv", None)
Vmap('K', ":m '<-2<CR>gv=gv", None)

Xmap('>', '>gv', None)
Xmap('<', '<gv', None)
