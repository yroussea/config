vim.keymap.set("n", "<C-p>", ":Telescope fd <CR>")
vim.keymap.set("n", "<C-g>", "<C-]>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
