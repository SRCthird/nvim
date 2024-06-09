
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
