-- lua/options.lua

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.scrolloff = 3 

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.signcolumn = "yes"

opt.clipboard = "unnamedplus"

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.swapfile = false

