local v = vim.opt

v.tabstop = 2
v.softtabstop = 2
v.clipboard =  "unnamedplus"
v.shiftwidth = 2
v.expandtab = true
v.smartindent = true
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
-- v.mouse = "a"
v.showmode = false
v.autoread = true
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- sorry for that but just can't figure out how to make cursorshape to always block
-- any suggestions would be highly appriciated

-- vim.cmd[[set guicursor= ]]
vim.cmd[[au CursorHold * checktime]]
vim.cmd[[set guifont=Cascadia\ Code:h9]]
vim.cmd[[let g:neovide_transparancy=0.1]]
