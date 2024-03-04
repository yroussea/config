require("catppuccin").setup({
    flavour = "macchiato",
	transparent_background = false,
	integrations = {
		telescope = { enabled = true },
		treesitter = true,
	}
})

vim.cmd.colorscheme "catppuccin"
