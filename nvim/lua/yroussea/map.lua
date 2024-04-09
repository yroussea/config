vim.g.mapleader = ' '

local keymap = vim.keymap

--			TELESCOPE			--
keymap.set("n", "<leader>ff", ":Telescope fd <CR>")
keymap.set("n", "<leader>fg", ":Telescope git_files <CR>")
keymap.set("n", "<leader>fd", ":Telescope live_grep <CR>")

keymap.set("n", "<leader>fe", ":Telescope harpoon marks <CR>")
--harpoon : 
--<leader>ee all harpooned files
--<leader>ew previous one
--<leader>er next one
--<leader>a add file to harpooned files

--			MOVE LINE			--
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

--		SEARCH AND REPLACE		--
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--			INDENT				--
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

--			COMMENT				--
vim.api.nvim_set_keymap("n", "<leader>/", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<leader>/", "gc", { noremap = false })

--			 TABS				--
keymap.set("n", "<C-left>", ":tabprevious<CR>", { noremap = true, silent = true})
keymap.set("n", "<C-right>", ":tabnext<CR>", { noremap = true, silent = true})
