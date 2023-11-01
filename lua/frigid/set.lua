vim.opt.guicursor = "i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150"

vim.opt.nu = true
vim.opt.relativenumber = false 

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Enable Startify
vim.g.startify_enable_special = 0

-- Set a custom header
local startify_ascii_header = {
  '                                        ▟▙            ',
  '                                        ▝▘            ',
  '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
  '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
  '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
  '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
  '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
  '',
}

vim.g.startify_custom_header = vim.fn.map(vim.list_extend(startify_ascii_header, vim.fn["startify#fortune#quote"]()), '"   " .. v:val')

-- Customize the menu list
vim.g.startify_lists = {
  { type = 'files', header = { '   Files' } },
  { type = 'dir', header = { '   Current Dir ', vim.fn.getcwd() } },
  { type = 'sessions', header = { '   Sessions' } },
  { type = 'bookmarks', header = { '   Bookmarks' } },
}

-- Set bookmarks
vim.g.startify_bookmarks = {
  { b = 'C:\\Users\\M312559\\AppData\\Local\\nvim' },
  { a = '$HOME\\AppData\\Local\\nvim' },
  { p = 'C:\\operations-interface' },
  { c = 'C:\\operations-nexus' },
  { z = 'C:\\Users\\M312559\\OneDrive - MerckGroup\\Documents\\Programs' },
}

-- Customize the appearance
vim.cmd [[ highlight StartifyBracket guifg=#9a8c98 ]]
vim.cmd [[ highlight StartifyFile guifg=#e5e5e5 ]]
vim.cmd [[ highlight StartifyFooter guifg=#c9ada7 ]]
vim.cmd [[ highlight StartifyHeader guifg=#e7c6ff ]]
vim.cmd [[ highlight StartifyNumber guifg=#bbd0ff ]]
vim.cmd [[ highlight StartifyPath guifg=#bbd0ff ]]
vim.cmd [[ highlight StartifySection guifg=#560bad guibg=#e7c6ff ]]
vim.cmd [[ highlight StartifySlash guifg=#06d6a0 ]]
vim.cmd [[ highlight StartifySpecial guifg=#f72585 ]]
  
-- Open Vim with the Startify screen
vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = "Startify" })
