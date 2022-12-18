vim.o.termguicolors = true

local everblush = require('everblush')
local colors = require('everblush.core').get_colors()

everblush.setup({
    transparent_background = true,
    override = {
        CursorLineNr = { fg = colors.foreground },
        LineNr = { fg = colors.comment },
        EndOfBuffer = { fg = colors.background },
    },
})
