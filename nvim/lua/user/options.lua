local v = vim.opt

v.tabstop = 2
v.softtabstop = 2
v.clipboard =  "unnamedplus"
v.shiftwidth = 2
v.expandtab = true
v.smartindent = true
v.autoindent = true
v.smartcase = true
v.nu = true
v.relativenumber = true
v.termguicolors = true
v.hlsearch = false
v.updatetime = 100
v.undofile = true
v.wrap = false
v.swapfile = false
v.fileencoding = "utf-8"
v.completeopt =  { "menuone", "noselect", "noinsert" }
v.writebackup = false
v.signcolumn = "yes"
v.scrolloff = 8
v.sidescrolloff = 8
v.backup = false
v.timeoutlen = 500
v.shortmess:append "c"
v.cursorline = true
v.mouse = "a"
v.showmode = false
v.autoread = true

vim.cmd[[
""" Customize colors
func! s:my_colors_setup() abort
    " this is an example
    " hi Pmenu guifg=#d7e5dc gui=NONE
    hi PmenuSel guibg=#2a2f4f gui=NONE
    hi PmenuSel guifg=#ffffff gui=NONE
    " hi PmenuSbar guibg=#d7e5dc
    " hi PmenuThumb guibg=#585858
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END
]]
