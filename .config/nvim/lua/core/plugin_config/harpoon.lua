require('core/utils')

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

NMAP("<leader>a", mark.add_file, VOID)
NMAP("<C-e>", ui.toggle_quick_menu, VOID)
NMAP("<M-1>", function() ui.nav_file(1) end, VOID)
NMAP("<M-2>", function() ui.nav_file(2) end, VOID)
NMAP("<M-3>", function() ui.nav_file(3) end, VOID)
NMAP("<M-4>", function() ui.nav_file(4) end, VOID)
