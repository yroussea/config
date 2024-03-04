vim.cmd("set mouse=a")

vim.opt.nu = false
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.cmd("let g:netrw_list_hide='[swp|o]$'")

vim.opt.showmode = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.cmd("set tags=./tags;/")
