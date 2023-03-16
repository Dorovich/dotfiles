local builtin = require('telescope/builtin')

require('core/utils')

Nmap('<C-p>', builtin.find_files, None)
Nmap('<Space><Space>', builtin.oldfiles, None)
Nmap('<Space>fg', builtin.live_grep, None)
Nmap('<Space>fh', builtin.help_tags, None)
