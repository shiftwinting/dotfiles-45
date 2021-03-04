require("el").reset_windows()

local builtin = require("el.builtin")
local extensions = require("el.extensions")
local sections = require("el.sections")
local subscribe = require("el.subscribe")
local lsp_statusline = require("el.plugins.lsp_status")

local git_icon =
  subscribe.buf_autocmd(
  "el_file_icon",
  "BufRead",
  function(_, bufnr)
    local icon = extensions.file_icon(_, bufnr)
    if icon then
      return icon .. " "
    end

    return ""
  end
)

local git_branch =
  subscribe.buf_autocmd(
  "el_git_branch",
  "BufEnter",
  function(window, buffer)
    local branch = extensions.git_branch(window, buffer)
    if branch then
      return " " .. "" .. " " .. branch
    end
  end
)

local git_changes =
  subscribe.buf_autocmd(
  "el_git_changes",
  "BufWritePost",
  function(window, buffer)
    return extensions.git_changes(window, buffer)
  end
)

local fileformat =
  subscribe.buf_autocmd(
  "custom_file_format",
  "BufEnter",
  function(bufnr)
    return ("[" .. vim.api.nvim_buf_get_option(bufnr, "fileformat") .. "]")
  end
)

require("el").setup {
  generator = function(_, _)
    return {
      " // ",
      extensions.gen_mode {
        format_string = " %s "
      },
      git_branch,
      lsp_statusline.segment,
      " ",
      sections.split,
      git_icon,
      builtin.tail_file,
      sections.collapse_builtin {
        " ",
        builtin.modified_flag
      },
      sections.split,
      lsp_statusline.server_progress,
      git_changes,
      "[",
      builtin.line_with_width(3),
      ":",
      builtin.column_with_width(2),
      "]",
      sections.collapse_builtin {
        "[",
        builtin.help_list,
        builtin.readonly_list,
        "]"
      },
      builtin.filetype,
      fileformat
    }
  end
}
