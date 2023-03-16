local builtin = require('telescope/builtin')

require('core/utils')

Nmap('<C-p>', builtin.find_files, None)
Nmap('<Leader>ff', builtin.oldfiles, None)
Nmap('<Leader>fg', builtin.live_grep, None)
Nmap('<Leader>fh', builtin.help_tags, None)
