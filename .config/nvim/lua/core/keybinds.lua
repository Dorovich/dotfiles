require('core/utils')

NMAP('H', '<Home>', NRSL)
NMAP('L', '<End>', NRSL)
NMAP('<C-h>', '<C-w>h', NRSL)
NMAP('<C-j>', '<C-w>j', NRSL)
NMAP('<C-k>', '<C-w>k', NRSL)
NMAP('<C-l>', '<C-w>l', NRSL)
NMAP('<Tab>', 'za', NRSL)
NMAP('U', '<C-r>', NRSL)
NMAP('<C-r>', ':%s//g<Left><Left>', NRSL)
NMAP('Y', 'y$', NRSL)
NMAP('<Leader>w', ':w<CR>', NRSL)
NMAP('<Leader>q', ':q<CR>', NRSL)
NMAP('<Leader>Q', ':q!<CR>', NRSL)
NMAP('<Leader>h', ':nohl<CR>', NRSL)
NMAP('Q', 'gq', VOID)
NMAP('gh', ':bprevious<CR>', SL)
NMAP('gl', ':bnext<CR>', SL)
NMAP('<C-d>', '<C-d>zz', NR)
NMAP('<C-u>', '<C-u>zz', NR)
NMAP('<C-f>', '<C-f>zz', NR)
NMAP('<C-b>', '<C-b>zz', NR)
NMAP('n', 'nzz', VOID)
NMAP('N', 'Nzz', VOID)
NMAP('ñ', ':', VOID)
NMAP('Ñ', ':', VOID)

--IMAP('jk', '<Esc>l', NRSL)

VMAP('J', ":m '>+1<CR>gv=gv", VOID)
VMAP('K', ":m '<-2<CR>gv=gv", VOID)

XMAP('>', '>gv', NRSL)
XMAP('<', '<gv', NRSL)
XMAP('<Leader>p', '\"_dp', NRSL)