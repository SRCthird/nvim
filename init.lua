require("frigid")
vim.cmd[[
" Enable Startify
let g:startify_enable_special = 0

" Set a custom header
let s:startify_ascii_header = [
 \ '                                        ▟▙            ',
 \ '                                        ▝▘            ',
 \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \]

let g:startify_custom_header = map(s:startify_ascii_header +
        \ startify#fortune#quote(), '"   ".v:val')

" Customize the menu list
let g:startify_lists = [
    "\ { 'type': 'files', 'header': ['   Files'] },
    \ { 'type': 'dir', 'header': ['   Current Dir '. getcwd()] },
    "\ { 'type': 'sessions', 'header': ['   Sessions'] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
    \ ]

let g:startify_bookmarks = [
    \ {'b': '$HOME\\AppData\\Local\\nvim'},
    \ {'p': '~/projects'},
    \ {'c': '~/.vimrc'},
    \ {'z': '~/.zshrc'},
    \ ]

" Customize the appearance
highlight StartifyBracket guifg=#9a8c98
highlight StartifyFile guifg=#e5e5e5
highlight StartifyFooter guifg=#c9ada7
highlight StartifyHeader guifg=#e7c6ff
highlight StartifyNumber guifg=#bbd0ff
highlight StartifyPath guifg=#bbd0ff
highlight StartifySection guifg=#560bad guibg=#e7c6ff
highlight StartifySlash guifg=#06d6a0
highlight StartifySpecial guifg=#f72585

" Open Vim with the Startify screen
autocmd VimEnter * Startify
]]
