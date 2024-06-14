require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local new = vim.api.nvim_create_user_command
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "J", "mzJ`z") -- Append next line to current

map("n", "<C-d>", "<C-d>zz") -- Scroll down with mouse in center
map("n", "<C-u>", "<C-u>zz") -- Scroll up with mouse in center

map("x", "<leader>p", [["_dP]]) -- Insert paste in new line

map('n', '<C-]>', ':NvimTreeRoot<CR>', { silent = true, noremap = true }) -- Set Tree Root

map({"n", "v"}, "<leader>y", [["+y]]) -- Copy selected to clipboard
map("n", "<leader>Y", [["+Y]]) -- Copy line to clipboard

map({"n", "v"}, "<leader>d", [["_d]]) -- Hard delete

map("i", "<C-c>", "<Esc>") -- Remap to escape

map("n", "<leader>f", vim.lsp.buf.format) -- Formats page based on lsp

map("n", "n", "nzzzv") -- Find next search query
map("n", "N", "Nzzzv") -- Find prev search query
map("v", "J", ":m '>+1<CR>gv=gv") -- Move Row Up 
map("v", "K", ":m '<-2<CR>gv=gv") -- Move Row Down
map("n", "<C-k>", "<cmd>cnext<CR>zz") -- Go to next error
map("n", "<C-j>", "<cmd>cprev<CR>zz") -- Go to prev error
map("n", "<leader>k", "<cmd>lnext<CR>zz") -- Go to next item in list 
map("n", "<leader>j", "<cmd>lprev<CR>zz") -- Go to prev item in list
map('n', '<C-Up>', '<Up>zz') -- Center screen while scrolling up
map('n', '<C-Down>', '<Down>zz') -- Center screen while scrolling down

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Replace all instances of selected word

map("n", "<leader><leader>", ":w<CR>:so<CR>") -- Writes and calls the lua file

map("n", "<C-x>", ":NvimTreeToggle<CR>", { silent = true }) --  Toggle Nvim Tree View
map("n", "<leader>u", vim.cmd.UndotreeToggle) -- Toggle UndoTree view

map("n", "<C-r>", ":CommentToggle<CR>") -- Toggles Comment for current line
map("v", "<C-r>", ":'<,'>CommentToggle<CR>") -- Toggles Comment for multiple lines

map("n", "<TAB>", ":bnext<CR>") -- Tab to next buffer
map("n", "<S-TAB>", ":bprev<CR>") -- Tab to previous buffer
map("n", "<leader>qq", ":bdelete!<CR>") -- Deletes current buffer

-- Commands that help me because I never let go of shift fast enough
new('Q', 'q', {force = true}) -- defines :Q as :q
new('W', 'w', {force = true}) -- Defines :W as :w

--- Harpoon
map("n", "<leader>a", mark.add_file)
map("n", "<C-e>", ui.toggle_quick_menu)

map("n", "<C-h>", function() ui.nav_file(1) end)
map("n", "<C-t>", function() ui.nav_file(2) end)
map("n", "<C-n>", function() ui.nav_file(3) end)
map("n", "<C-s>", function() ui.nav_file(4) end)

-- Tree
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
end, { silent = true })
