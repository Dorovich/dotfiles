opt = vim.opt
g = vim.g
keymap = vim.keymap.set
autocmd = vim.api.nvim_create_autocmd
file_name = vim.fn.expand("%:t:r")

-- Settings

g.mapleader = ";"
g.maplocalleader = ","

opt.scrolloff = 1
opt.sidescrolloff = 1
opt.laststatus = 0
opt.splitright = true
opt.splitbelow = true
opt.lazyredraw = true
opt.clipboard = "unnamedplus"
opt.lispwords = opt.lispwords + "define*,lambda*"

-- Keys, Commands

keymap("n", "ñ", ":", nil)
keymap("n", "U", "<c-r>", nil)
keymap("n", "Y", "y$", nil)
keymap("x", ">", ">gv", {silent=true})
keymap("x", "<", "<gv", {silent=true})
keymap("n", "<c-q>", ":q<cr>", {silent=true})
keymap("n", "<c-s>", ":w<cr>", nil)

keymap("n", "<leader>t", ":split<cr>:term<cr>A", nil)
keymap("n", "<leader>r", ":%s//g<left><left>", nil)
keymap("n", "<leader>c", ":!make<cr>", nil)

vim.cmd("command! -nargs=0 SudoWrite :w !sudo tee %")

-- Autocmds

autocmd({ "FileType" }, {
  pattern = { "text", "org", "markdown" },
  callback = function()
    opt.wrap = true
  end
})

autocmd({ "FileType"  }, {
  pattern = { "help" },
  callback = function()
    keymap("n", "q", "<c-w>q", {buffer=true})
  end
})

autocmd({ "TermEnter" }, {
  callback = function()
    opt.number = false
    opt.relativenumber = false
  end
})

autocmd({ "TermClose" }, {
  command = "call nvim_input('<cr>')"
})

-- Plugins

local lazypath = vim.fn.stdpath "data".."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "commonlisp", "scheme", "org", "query", },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "org" },
        }
      })
    end
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk" },
        timeout = 100,
        clear_empty_lines = false,
        keys = function()
          return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
        end,
      })
    end
  },
  {
    "tpope/vim-commentary",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      local nap = require("nvim-autopairs")
      local nap_cond = require("nvim-autopairs.conds")
      local nap_rule = require('nvim-autopairs.rule')
      nap.setup({
        enable_check_bracket_line = false,
        fast_wrap = {},
      })
      nap.get_rules("'")[1].not_filetypes = { "scheme", "lisp" }
      nap.get_rules("'")[1]:with_pair(nap_cond.not_after_text("["))
    end
  },
  {
    "guns/vim-sexp",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      g["sexp_enable_insert_mode_mappings"] = 0
    end
  },
  -- {
  --   "Olical/conjure"
  -- },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      keymap("n", "<leader>f", builtin.find_files, nil)
      keymap("n", "<leader>b", builtin.buffers, nil)
    end
  },
  {
    "nvim-orgmode/orgmode",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "org",
    config = function()
      local org = require("orgmode")
      org.setup_ts_grammar()
      org.setup()
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = true,
        transparent = true,
      })
    end
  },
  {
    "DanisDGK/srcery.nvim",
    config = function()
      require("srcery").setup({
        transparent_background = true,
        term_colors = true,
        integrations = {
          treesitter = true,
        },
      })
    end
  },
  {
    "ramojus/mellifluous.nvim",
    config = function()
      require("mellifluous").setup({
        dim_inactive = false,
        color_set = "mellifluous",
        transparent_background = {
          enabled = true,
          floating_windows = false,
        },
      })
    end
  }
}, {})

vim.cmd("colorscheme kanagawa")

-- Conjure
-- g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
-- g["conjure#client#guile#socket#pipename"] = "guile-repl.socket"

-- vim: ts=2 sts=2 sw=2 et
