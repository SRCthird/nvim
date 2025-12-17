return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "jsonls",
        },
        opts = {
          ui = {
            icons = {
              package_pending = " ",
              package_installed = "󰄳 ",
              package_uninstalled = " 󰚌",
            },
            keymaps = {
              install_server = "a",
              uninstall_server = "d",
            },
          },
          max_concurrent_installers = 10,
        },
      })
      --- Lua Config ---
      vim.lsp.config(
        "lua_ls", {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim", "require" },
              },
            },
          },
        })
    end,
  },
}
