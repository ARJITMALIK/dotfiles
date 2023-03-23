local o = vim.opt
local tabs = 2
local scroll = 8

-- line nums
o.relativenumber = true
o.number = true

-- tab related stuff
o.tabstop = tabs
o.shiftwidth = tabs
o.expandtab = true
o.autoindent = true
o.softtabstop = tabs
o.smartindent = true

-- wrapping
o.wrap = false

-- searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = false

-- ah! cursor line 
o.cursorline = true

-- some appearance related stuff
o.termguicolors = true
o.signcolumn = "yes"
o.background = "dark" -- not needed but who knows!!

-- backspace
o.backspace = "indent,eol,start"

-- nearly forgot, the clipboard
o.clipboard:append("unnamedplus")

-- misc
o.undofile = true
o.swapfile = false
o.backup = false

-- srollofffffff
o.scrolloff = scroll
o.sidescrolloff = scroll

-- completion
-- o.completeopt = "menu, menuone, noselect"
