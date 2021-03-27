local icons = require("nvim-nonicons")
require("telescope").setup({
    defaults = {
        file_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        prompt_prefix = icons.get("telescope") .. " ",
    },
    extensions = {
        arecibo = {
            ["selected_engine"] = "duckduckgo",
            ["url_open_command"] = "firefox",
            ["show_http_headers"] = false,
            ["show_domain_icons"] = false,
        },
    },

})
