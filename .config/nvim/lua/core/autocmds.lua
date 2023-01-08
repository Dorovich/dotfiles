local autocmd = vim.api.nvim_create_autocmd
local getbfr = vim.api.nvim_get_current_buf

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
    { "TermClose" },
    {
        command = [[call nvim_input('<CR>')]],
    }
)

function C_utils ()
    require("core/utils")
    local nbfr = getbfr();
    BFR_NMAP(nbfr, '<C-c>', ':!make<CR>', NRSL)
    BFR_NMAP(nbfr, '<C-t>', ':split<CR>:term<CR>i', NRSL)
end
