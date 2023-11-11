-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'theprimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        },
    }
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'mhinz/vim-startify' }
    use {
        'kdheepak/lazygit.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
    }
    use { 'terrortylor/nvim-comment' }
    use {
        "windwp/nvim-autopairs",
        config = {
            function()
                require("nvim-autopairs").setup {}
            end
        },
    }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'romgrk/barbar.nvim' }
end)
