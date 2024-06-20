local map = vim.keymap.set
local new = vim.api.nvim_create_user_command
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<leader>pv", vim.cmd.Ex, { desc = ':Explore (Disabled with nvim-trea)' })
map("n", "J", "mzJ`z", { desc = 'Append next line to current' })
map("n", "<C-d>", "<C-d>zz", { desc = 'Scroll down with mouse in center' })
map("n", "<C-u>", "<C-u>zz", { desc = 'Scroll up with mouse in center' })
map("n", "<leader>gg", ":LazyGit<CR>", { desc = 'Open LazyGit UI' })
map("x", "<leader>p", [["_dP]], { desc = 'Insert paste in new line' })
map('n', '<C-]>', ':NvimTreeRoot<CR>', { desc = 'Set Tree Root', silent = true, noremap = true })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = 'Copy selected to clipboard' })
map("n", "<leader>Y", [["+Y]], { desc = 'Copy line to clipboard' })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = 'Hard delete' })
map("i", "<C-c>", "<Esc>", { desc = 'Remap to escape' })
map("n", "<leader>f", vim.lsp.buf.format, { desc = 'Formats page based on lsp' })
map("n", "n", "nzzzv", { desc = 'Find next search query' })
map("n", "N", "Nzzzv", { desc = 'Find prev search query' })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move Row Up ' })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move Row Down' })
map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = 'Go to next error' })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = 'Go to prev error' })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = 'Go to next item in list' })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = 'Go to prev item in list' })
map('n', '<C-Up>', '<Up>zz', { desc = 'Center screen while scrolling up' })
map('n', '<C-Down>', '<Down>zz', { desc = 'Center screen while scrolling down' })
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace all instances of selected word' })
map("n", "<C-x>", ":NvimTreeToggle<CR>", { desc = 'Toggle Nvim Tree View', silent = true })
map("n", "<TAB>", ":bnext<CR>", { desc = 'Tab to next buffer' })
map("n", "<S-TAB>", ":bprev<CR>", { desc = 'Tab to previous buffer' })
map("n", "<leader><TAB>", ":bdelete!<CR>", { desc = 'Deletes current buffer', remap = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })
map('n', '<leader>cp', function()
  local node = require('nvim-tree.lib').get_node_at_cursor()
  if node and node.absolute_path then
    local path = node.absolute_path
    if node.entries ~= nil then
      path = path .. '/'
    end
    vim.fn.system('echo ' .. path .. ' | clip.exe')
    print('Directory path copied to clipboard!')
  else
    print('Failed to copy directory path.')
  end
end, { silent = true, desc = 'Copy the file path from nvim-tree'})

--- Harpoon
map("n", "<leader>a", mark.add_file)
map("n", "<C-e>", ui.toggle_quick_menu)
map("n", "<C-h>", function() ui.nav_file(1) end)
map("n", "<C-t>", function() ui.nav_file(2) end)
map("n", "<C-n>", function() ui.nav_file(3) end)
map("n", "<C-s>", function() ui.nav_file(4) end)


-- Commands that help me because I never let go of shift fast enough
new('Q', 'q', { desc = 'defines :Q as :q', force = true })
new('W', 'w', { desc = 'Defines :W as :w', force = true })
