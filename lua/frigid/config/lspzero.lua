local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

lsp.on_attach(function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc, remap = false}
  end

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts("Go to definition"))
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("Definition popup"))
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts("Query symbols"))
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts("Go to next diagnostic"))
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts("Go to prev diagnostic"))
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts("Switch paramaters"))
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts("Find references"))
end)

lsp.set_preferences({
  sign_icon = {}
})
