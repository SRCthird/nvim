require('frigid.config.mason')
require('mason-lspconfig').setup({
  ensure_installed = {
    -- 'tsserver',
    'eslint',
    'rust_analyzer',
    'pyright',
    'pylsp',
    'html',
    'cssls',
  },
  handlers = {
    require('lsp-zero').default_setup,
  },
})
