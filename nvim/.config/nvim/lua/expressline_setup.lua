--[[
TODO: Figure this out
local extensions = require("el.extensions")
local subscribe = require("el.subscribe")
local generator = function(_window, buffer)
  local segments = {
    subscribe.buf_autocmd(
      "el_git_status",
      "BufWritePost",
      function(window, buffer)
        return extensions.git_changes(window, buffer)
      end
    ),
    subscribe.buf_autocmd(
      "el_git_branch",
      "BufEnter",
      function(window, buffer)
        return extensions.git_branch(window, buffer)
      end
    ),
    extensions.mode,
    subscribe.buf_autocmd(
      "el_file_icon",
      "BufRead",
      function(_, buffer)
        return extensions.file_icon(_, buffer)
      end
    )
  }
end
require("el").setup({generator = generator})
--]]
require "el".setup {}
