-- Packer auto-install {{{
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
-- }}}

-- Plugin declaration
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'theprimeagen/harpoon'
    use 'nvim-orgmode/orgmode'
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'jdhao/better-escape.vim',
        event = 'InsertEnter'
    }

    -- LSP
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig'
    }

    -- Completion
    use 'L3MON4D3/LuaSnip'
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path'
    }

    -- Colorschemes
    use 'ellisonleao/gruvbox.nvim'
    use 'RRethy/nvim-base16'
    use {
        'ramojus/mellifluous.nvim',
        requires = {'rktjmp/lush.nvim'}
    }
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
    }
    use {
        'Everblush/everblush.nvim',
        as = 'everblush',
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)