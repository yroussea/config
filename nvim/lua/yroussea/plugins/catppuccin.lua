require("catppuccin").setup({
    flavour = "macchiato",
	transparent_background = false,
	integrations = {
		telescope = { enabled = true },
		treesitter = true,
		cmp = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
	}
})

vim.cmd.colorscheme "catppuccin"
