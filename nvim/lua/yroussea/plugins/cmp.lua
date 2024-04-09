local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' , keyword_length = 1},
		{ name = 'luasnip' },
		{ name = 'buffer' },
	}),
	window = {
		completion = cmp.config.window.bordered(),
	},
	formatting = {
		fields = {"abbr", "kind", "menu"},
		format = function (_, vim_item)
			vim_item.menu = ""

			return vim_item
		end,
	},
})
