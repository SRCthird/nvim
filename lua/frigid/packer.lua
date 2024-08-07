-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use({ 'wbthomason/packer.nvim' })
  use({
    'williamboman/mason.nvim',
  })
  use({
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('frigid.config.mason-lspconfig')
    end,
  })
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('frigid.config.lspconfig')
    end,
  })
  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function()
      require('frigid.config.lspzero')
    end,
  })
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  })
  use({
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('frigid.config.catppuccin')
    end
  })
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })
  use({ 'theprimeagen/harpoon' })
  use({ 'tpope/vim-fugitive' })
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('frigid.config.cmp')
    end
  })
  use({ 'hrsh7th/cmp-nvim-lsp' })
  use({ 'L3MON4D3/LuaSnip' })
  use({ 'prisma/vim-prisma' })
  use({ 'chr4/nginx.vim' })
  use({
    'nvim-tree/nvim-tree.lua',
    config = function()
      return require('frigid.config.nvimtree')
    end,
  })
  use({ 'nvim-tree/nvim-web-devicons' })
  use({
    'kdheepak/lazygit.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      if SystemOS == "Windows" then
        vim.schedule(function()
          vim.api.nvim_create_user_command(
            "LazyGit",
            function()
              local current = vim.opt.shell
              vim.opt.shell='cmd'
              require'lazygit'.lazygit()
              vim.opt.shell=current
            end,
            { force = true }
          )
        end)
      end
    end
  })
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  })
  use({ 'lewis6991/gitsigns.nvim' })
  use({ 'lukas-reineke/indent-blankline.nvim' })
  use({
    'SRCthird/minintro.nvim',
    config = function()
      require('frigid.config.minintro')
    end
  })
end)
