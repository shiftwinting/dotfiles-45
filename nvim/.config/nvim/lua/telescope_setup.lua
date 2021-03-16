local icons = require("nvim-nonicons")
require("telescope").setup({
    defaults = {
        file_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        prompt_prefix = icons.get("telescope") .. " ",
    },
})
