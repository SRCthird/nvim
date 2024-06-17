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
  use { 'theprimeagen/harpoon' }
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = { function()
      require('frigid.config.lspzero')
    end },
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
      {
        'neovim/nvim-lspconfig',
        config = { function()
          require('frigid.config.lspconfig')
        end }
      },
      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        config = { function()
          require('frigid.config.cmp')
        end }
      },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
  }
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      return require("frigid.config.nvimtree")
    end,
  }
  use { 'nvim-tree/nvim-web-devicons' }
  use {
    'kdheepak/lazygit.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }
  use {
    "windwp/nvim-autopairs",
    config = {
      function()
        require("nvim-autopairs").setup {}
      end
    },
  }
  use { 'lewis6991/gitsigns.nvim' }
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  }
end)
