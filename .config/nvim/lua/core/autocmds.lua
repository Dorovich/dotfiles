local autocmd = vim.api.nvim_create_autocmd
local FNAME = vim.fn.expand("%:t:r")
-- local FNAME = vim.api.nvim_buf_get_name(0)

autocmd(
    { "FileType" },
    {
        pattern = { "c", "cc", "cpp" },
        callback = function ()
            vim.schedule(C_utils)
        end,
    }
)

autocmd(
    { "FileType" },
    {
        pattern = { "nroff" },
        callback = function ()
            vim.schedule(Groff_utils)
        end,
    }
)

autocmd(
    { "FileType" },
    {
        pattern = { "help" },
        callback = function ()
            vim.schedule(Help_utils)
        end,
    }
)

autocmd(
    { "FileType" },
    {
        pattern = { "text", "org", "markdown" },
        callback = function ()
            vim.schedule(Plaintext_utils)
        end,
    }
)


autocmd(
    { "TermEnter" },
    {
        callback = function ()
            vim.schedule(Term_utils)
        end,
    }
)

autocmd(
    { "TermClose" },
    {
        command = "call nvim_input('<CR>')",
    }
)

function C_utils ()
    require("core/utils")
    NMAP('<C-c>', ':!make<CR>', NRSLBFR)
    NMAP('<C-t>', ':split<CR>:term<CR>i', NRSLBFR)
end

function Term_utils ()
    vim.opt_local.number = false;
    vim.opt_local.relativenumber = false;
end

function Groff_utils ()
    vim.opt_local.number = false;
    vim.opt_local.relativenumber = false;
    require("core/utils")
    local compile_cmd = ':!pdfmom ' .. FNAME .. '.mom > ' .. FNAME .. '.pdf<CR>'
    local see_cmd = ':!groff -mom ' .. FNAME .. '.mom -Tpdf | zathura -<CR>'
    NMAP('<C-c>', compile_cmd, NRSLBFR)
    NMAP('<C-s>', see_cmd, NRSLBFR)
end

function Help_utils ()
    require("core/utils")
    NMAP('q', ':q<CR>', NRSLBFR)
end

function Plaintext_utils ()
    vim.opt_local.wrap = true
end
