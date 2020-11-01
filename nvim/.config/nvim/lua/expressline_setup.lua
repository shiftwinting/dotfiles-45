local extensions = require("el.extensions")
local lsp_status = require("el.plugins.lsp_status")
local subscribe = require("el.subscribe")
local generator = function()
  local el_segments = {}
  table.insert(el_segments, extensions.mode) --mode
  table.insert(el_segments, "  ")

  table.insert(
    el_segments, --git branch
    subscribe.buf_autocmd(
      "el_git_branch",
      "BufEnter",
      function(window, buffer)
        return extensions.git_branch(window, buffer)
      end
    )
  )

  table.insert(el_segments, "      ")
  table.insert(
    el_segments, --filetype icon
    subscribe.buf_autocmd(
      "el_file_icon",
      "BufRead",
      function(_, buffer)
        return extensions.file_icon(_, buffer)
      end
    )
  )
  table.insert(el_segments, " ")
  local file_namer = function(_window, buffer) --file name
    return buffer.name
  end
  table.insert(el_segments, file_namer)

  table.insert(el_segments, "       ")
  table.insert(
    el_segments, -- git status
    subscribe.buf_autocmd(
      "el_git_status",
      "BufWritePost",
      function(window, buffer)
        return extensions.git_changes(window, buffer)
      end
    )
  )

  table.insert(el_segments, lsp_status)

  return el_segments
end

require("el").setup {generator = generator}
