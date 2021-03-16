local api = vim.api

api.nvim_command("packadd packer.nvim")
vim.o.termguicolors = true
vim.g["conjure#mapping#doc_word"] = "K"

local packer = require("packer")
local packages = require("packages")

packer.startup(function()
    for _, value in pairs(packages) do
        packer.use(value)
    end
end)
packer.use_rocks({ "lunajson", "http" })
vim.cmd([[
    command! -complete=file -nargs=* DebugC lua require "dap_setup".start_c_debugger({<f-args>}, "gdb")
]])
vim.cmd([[
    command! -complete=file -nargs=* DebugRust lua require "dap_setup".start_c_debugger({<f-args>}, "gdb", "rust-gdb")
]])
