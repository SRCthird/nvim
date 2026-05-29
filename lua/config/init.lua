require("config.lazy")
require("config.options")
require("config.remap")
require("config.theme")

if vim.fn.argc() == 0 then
  vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = ":NvimTreeToggle" })
else
  local path = vim.fn.argv(0)
  if vim.fn.isdirectory(path) == 1 then
    vim.api.nvim_set_current_dir(path)
    vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = ":NvimTreeToggle" })
    vim.cmd("enew")
  end
end

vim.diagnostic.config({ virtual_text = true })

vim.cmd.colorscheme "catppuccin"
