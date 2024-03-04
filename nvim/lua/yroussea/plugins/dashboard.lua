--Credit: https://github.com/y-syo/nvim 
--(but seekers << analyst  :)         )

vim.cmd([[hi Red ctermfg=1 ctermbg=NONE]])
vim.cmd([[hi Gray ctermfg=8 ctermbg=NONE cterm=bold]])
vim.cmd([[hi def link DashboardHeader Red]])
vim.cmd([[hi def link DashboardFooter Gray]])

require('dashboard').setup({
	theme = 'doom',
	config = {
		header = { [[]],[[]],[[]],[[]],[[]],[[]],[[]],[[]],[[]],[[]],[[]],
		[[██╗   ██╗██╗███╗   ███╗]],
		[[██║   ██║██║████╗ ████║]],
		[[██║   ██║██║██╔████╔██║]],
		[[╚██╗ ██╔╝██║██║╚██╔╝██║]],
		[[ ╚████╔╝ ██║██║ ╚═╝ ██║]],
		[[  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
		[[]],[[]],[[]],[[]], [[]], [[]]},
		center = {
			{
				icon = ' ',
				icon_hl = 'String',
				desc = 'Recents files',
				key = 'l',
				key_hl = 'String',
				key_format = ' %s',
				action = 'Telescope oldfiles'
			},
			{
				icon = '󰊢 ',
				icon_hl = 'String',
				desc = 'Search in git repo',
				key = 'g',
				key_hl = 'String',
				key_format = ' %s',
				action = ':Telescope git_files'
			},
			{
				icon = ' ',
				icon_hl = 'String',
				desc = 'Search in current repo',
				key = 'f',
				key_hl = 'String',
				key_format = ' %s',
				action = ':Telescope fd'
			},
			{
				icon = ' ',
				icon_hl = 'String',
				desc = 'New file',
				key = 'n',
				key_hl = 'String',
				key_format = ' %s',
				action = 'ene'
			},
		},
		footer = {""},
	}
})
