local opt = vim.opt
local o = vim.o
local g = vim.g

opt.guicursor = "i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150"
opt.nu = true
opt.relativenumber = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.hlsearch = true
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50
if SystemOS == "Windows" then
  opt.shell = 'pwsh'
end

g.mapleader = " "

