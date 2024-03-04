
local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}


local colors = {
  bg = '#24273a',
  dark_grey = '#24273F',
  white = "#CAD3F5",
  yellow = '#EED49F',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#0087d7',
  red = '#ec5f67'
}


local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  LeftEnd = {
	provider = function() return ' ' end,
	highlight = {colors.darkblue,colors.yellow},
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {n = 'N ',i = 'I ',c= 'C ',v= 'V ',V= 'VL ', ['␖'] = 'VB '}
      return alias[vim.fn.mode()]
    end,

    highlight = {colors.darkblue,colors.yellow,'bold'},
	separator = ' ',
    separator_highlight = {colors.purple,colors.dark_grey},
  },
}


gls.left[3] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = buffer_not_empty,
    highlight = {colors.white,colors.dark_grey}
  }
}

gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    highlight = {colors.white,colors.bg, 'bold'},
  }
}

gls.right[1] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = {colors.white,colors.dark_grey},
  },
}

gls.short_line_left[1] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.purple,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferType = {
    provider = 'FileName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.white,colors.bg,'bold'}
  }
}
