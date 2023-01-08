local autocmd = vim.api.nvim_create_autocmd

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
