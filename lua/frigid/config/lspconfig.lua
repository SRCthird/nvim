local lspconfig = require("lspconfig")
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)
local lsp = require("frigid.config.lspzero").lsp

lspconfig.pyright.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
lspconfig.julials.setup({
  on_attach = lsp.on_attach,
  capabilities = cmp_capabilities
})
lspconfig.bashls.setup({})
lspconfig.jdtls.setup({})
lspconfig.prismals.setup({})
lspconfig.tsserver.setup({})
