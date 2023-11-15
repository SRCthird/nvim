-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = {
        '^.git$'
    },
  },
  git = {
      enable = true,
      ignore = false,
      timeout = 500,
  }
})

vim.keymap.set('n', '<leader>cp', ':lua copy_dir_address()<CR>', { silent = true })

function copy_dir_address()
  local lib = require'nvim-tree.lib'
  local node = lib.get_node_at_cursor()
  if node and node.absolute_path then
    local path = node.absolute_path
    if node.entries ~= nil then
      -- If it's a folder, ensure we have the trailing slash
      path = path .. '/'
    end
    vim.fn.system('echo ' .. path .. ' | clip.exe')
    print('Directory path copied to clipboard!')
  else
    print('Failed to copy directory path.')
  end
end

