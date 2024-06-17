-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use {
    "catppuccin/nvim", as = "catppuccin",
    config = { function()
      require("frigid.config.catppuccin")
    end }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'theprimeagen/harpoon',
    config = { function()
      require("frigid.config.harpoon")
    end }
  }
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {
        'williamboman/mason.nvim',
        opts = {function()
          require('frigid.config.mason')
        end},
        config = { function()
          require('mason').setup({})
        end }
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = { function()
          require('mason').setup({})
          require('frigid.config.mason-lspconfig')
        end }
      },
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
  use { 'pantharshit00/vim-prisma' }
  use { 'chr4/nginx.vim' }
  use { 'vim-airline/vim-airline' }
  use { 'vim-airline/vim-airline-themes' }
  use { 'mfussenegger/nvim-jdtls' }
  use { 'simrat39/rust-tools.nvim' }
end)
