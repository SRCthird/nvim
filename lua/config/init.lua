require("config.lazy")
require("config.options")
require("config.remap")
require("config.theme")

if vim.fn.argc() == 0 then
  vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = ":NvimTreeToggle" })
end

vim.diagnostic.config({virtual_text = true})

vim.cmd.colorscheme "catppuccin"
