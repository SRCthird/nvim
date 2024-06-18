require("frigid.packer")
require("frigid.options")
require("frigid.remap")
require("frigid.theme")

if vim.fn.argc() == 0 then
  vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = ":NvimTreeToggle" })
end
