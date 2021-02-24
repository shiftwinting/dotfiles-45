local gl = require('galaxyline')
local colors = {
  bg = '#282c34',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#608B4E',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#569CD6',
  red = '#D16969'
}
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui'}

gls.left[1] = {
  RainbowRed = {
    provider = function() return ' ' end,
    highlight = {colors.blue,colors.darkblue}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local mode_letters = {
        n = "NORMAL ",
        i = "INSERT ",
        [''] = "V-BLOCK",
        c = "COMMAND",
        cv= "VIM EX ",
        ce= "EX     ",
        v = "VISUAL ",
        V = "V-LINE",
        s = "SELECT ",
        S = "S-LINE ",
        [''] = "S-BLOCK",
        ic= "INSCOMP",
        ix= "INSCOMP",
        R = "REPLACE",
        Rc= "R-COMPL",
        Rx= "R-COMPL",
        Rv= "R-VIRTL",
        r = "PROMPT ",
        rm= "PROMPT ",
        ['r?'] = "CONFIRM",
        t = "TERMNAL"
      }
      return mode_letters[vim.fn.mode()]
    end,
    separator = ' ',
    highlight = {colors.red,colors.darkblue},
    separator_highlight = {colors.darkblue, colors.darkblue}
  },
}
gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.darkblue}
  }
}

gls.left[4] = {
  GitIcon = {
    provider = function() return '' end,
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.darkblue},
    separator = ' ',
    separator_highlight = {colors.bg, colors.darkblue}
  }
}

gls.left[5] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = ' ',
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.darkblue},
    separator_highlight = {colors.bg, colors.darkblue}
  }
}

gls.left[6] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.darkblue}
  },
}

gls.left[7] = {
  FileName = {
    provider = {'FileName'},
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,colors.darkblue}
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  🚫 ',
    highlight = {colors.red,colors.bg}
  }
}

gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' ⚠️ ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = ' 💡',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = ' ℹ️ ',
    highlight = {colors.blue,colors.bg},
  }
}

gls.right[1] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg}
  }
}
gls.right[2] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[3] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}
gls.right[4] = {
  LineInfo = {
    separator = ' ',
    provider = 'LineColumn',
    highlight = {colors.fg,colors.bg},
    separator_highlight = {colors.bg, colors.bg}
  },
}

gls.right[5] = {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg}
  }
}

gls.right[6] = {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg}
  }
}
gls.right[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}

gls.right[8] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {colors.blue,colors.bg}
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
