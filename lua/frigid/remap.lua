vim.g.mapleader = " " -- Set <leader> as space
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- :Explore (Disabled with nvim-trea)
vim.api.nvim_create_user_command('Q', 'q', {force = true}) -- defines :Q as :q

vim.keymap.set("n", "J", "mzJ`z") -- Append next line to current

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down with mouse in center
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up with mouse in center

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>") -- Open LazyGit UI

vim.keymap.set("x", "<leader>p", [["_dP]]) -- Insert paste in new line

vim.keymap.set('n', '<C-]>', ':NvimTreeRoot<CR>', { silent = true, noremap = true }) -- Set Tree Root

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- Copy selected to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- Copy line to clipboard

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- Hard delete

vim.keymap.set("i", "<C-c>", "<Esc>") -- Remap to escape

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "n", "nzzzv") -- Find next search query
vim.keymap.set("n", "N", "Nzzzv") -- Find prev search query
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move Row Up 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move Row Down
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- Go to next error
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz") -- Go to prev error
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- Go to next item in list 
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") -- Go to prev item in list
vim.keymap.set("n", "<TAB>", ":bnext<CR>") -- Tab to next buffer
vim.keymap.set("n", "<S-TAB>", ":bprev<CR>") -- Tab to previous buffer

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Replace all instances of selected word

vim.keymap.set("n", "<leader><leader>", ":w<CR>:so<CR>") -- Writes and calls the lua file

vim.keymap.set("n", "<C-x>", ":NvimTreeToggle<CR>", { silent = true }) --  Toggle Nvim Tree View
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) -- Toggle UndoTree view

vim.keymap.set("n", "<C-r>", ":CommentToggle<CR>") -- Toggles Comment for current line
vim.keymap.set("v", "<C-r>", ":'<,'>CommentToggle<CR>") -- Toggles Comment for multiple lines
