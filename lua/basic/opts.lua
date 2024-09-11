local o = vim.o
local g = vim.g
local opt = vim.opt

o.showtabline = 2
o.tabline = " "
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

g.mapleader = " "
g.maplocalleader = "\\"
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.autowrite = true
opt.backup = false
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.encoding = "utf-8"
opt.expandtab = true
opt.fileencodings = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.list = true
opt.mouse = "a"
opt.mousemoveevent = true
opt.number = true
opt.relativenumber = true
opt.shiftround = true
opt.shiftwidth = 4
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undofile = true
opt.virtualedit = "block"
opt.spell = true
opt.spelllang = "en_us"
opt.termguicolors = true
opt.title = true
opt.linebreak = true
opt.breakindent = true
