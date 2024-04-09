local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require'lspconfig'.clangd.setup{					filetype = {"c"}			}
require'lspconfig'.jedi_language_server.setup{		filetype = {"py"}			}
require'lspconfig'.autotools_ls.setup{				filetype = {"Makefile"}		}
require'lspconfig'.bashls.setup{					filetype = {"sh"}			}
require'lspconfig'.ocamllsp.setup{					filetype = {"ml"}			}

lsp.setup()
