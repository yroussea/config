local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	--FZF
	"nvim-lua/plenary.nvim",
	{ "nvim-telescope/telescope.nvim", tag = '0.1.2' },

	--THEMES
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	'glepnir/galaxyline.nvim',

	--treesiter (color)
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	
	--ZELLIJ (TMUX LIKE)
	'Lilja/zellij.nvim',

	--NERDTREE (IDK WHY IT DOESNT WORK FOR ME, BUT IDC I HUSE TELESCOPE)
	'preservim/nerdtree',
	"ryanoasis/vim-devicons",
	"tiagofumo/vim-nerdtree-syntax-highlight",

	--TMUX
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	--Dashboard
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter', dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},

	--42HEADER
	{ "Diogo-ss/42-header.nvim", lazy = false },
})

