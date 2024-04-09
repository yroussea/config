-- ************************************************************************** --
--                                                                            --
--                                                        :::      ::::::::   --
--   harpoon.lua                                        :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: yroussea <yroussea@student.42angouleme.fr  +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2024/03/13 19:11:47 by yroussea          #+#    #+#             --
--   Updated: 2024/03/13 19:18:48 by yroussea         ###   ########.fr       --
--                                                                            --
-- ************************************************************************** --

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>ee", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>ew", function() ui.nav_next() end)
vim.keymap.set("n", "<leader>er", function() ui.nav_prev() end)

require("telescope").load_extension('harpoon')
