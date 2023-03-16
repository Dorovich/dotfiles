require('core/utils')

local Filename = vim.fn.expand("%:t:r")
-- local Filename = vim.api.nvim_buf_get_name(0)

Autocmd({ "FileType" }, {
    pattern = { "nroff" },
    callback = function ()
	Opt.number = false;
	Opt.relativenumber = false;
	local compile_cmd = ':!pdfmom ' .. Filename .. '.mom > ' .. Filename .. '.pdf<CR>'
	local see_cmd = ':!groff -mom ' .. Filename .. '.mom -Tpdf | zathura -<CR>'
	Nmap('<C-c>', compile_cmd, BF)
	Nmap('<M-c>', see_cmd, NRSLBF)
    end,
})

Autocmd({ "FileType" }, {
    pattern = { "text", "org", "markdown" },
    callback = function ()
	Optl.wrap = true
    end,
})


Autocmd({ "TermEnter" }, {
    callback = function ()
	Optl.number = false;
	Optl.relativenumber = false;
    end,
})

Autocmd({ "TermClose" }, {
    command = "call nvim_input('<CR>')",
})
