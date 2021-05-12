local themes = require("telescope.themes")
local M = {}
function M.dotfiles()
    require("telescope.builtin").git_files({
        shorten_path = false,
        cwd = "~/dotfiles",
        prompt = "~ dotfiles ~",
        height = 10,
    })
end
function M.curbuf()
    local opts = themes.get_dropdown({
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    })
    require("telescope.builtin").current_buffer_fuzzy_find(opts)
end
function M.lsp_code_actions()
    local opts = themes.get_dropdown({
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    })

    require("telescope.builtin").lsp_code_actions(opts)
end
return M
