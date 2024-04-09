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
	--FZF and file parcours
	"nvim-lua/plenary.nvim",
	{ "nvim-telescope/telescope.nvim", tag = '0.1.2' },
	"theprimeagen/harpoon",

	--THEMES
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	'glepnir/galaxyline.nvim',

	--treesiter (color)
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{
		"RRethy/vim-illuminate",
		lazy = false, config = function()
			require('illuminate').configure({})
		end
	},

	--ZELLIJ (TMUX LIKE)
	'Lilja/zellij.nvim',

	--NERDTREE (IDK WHY IT DOESNT WORK FOR ME, BUT IDC I HUSE TELESCOPE)
	'preservim/nerdtree',
	"ryanoasis/vim-devicons",

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

	--LSP
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},
	--COMMENTS
	{
		'numToStr/Comment.nvim',
		opts = {},
		lazy = false,
	},
})

