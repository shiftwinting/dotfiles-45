local M = {}
function M.dotfiles()
    require("telescope.builtin").git_files({
        shorten_path = false,
        cwd = "~/dotfiles",
        prompt = "~ dotfiles ~",
        height = 10,
    })
end

return M
