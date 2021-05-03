local api = vim.api

api.nvim_command("packadd packer.nvim")
vim.o.termguicolors = true

local packer = require("packer")
local packages = require("packages")

packer.startup(function()
        for _, value in pairs(packages) do
                packer.use(value)
        end
end)

vim.cmd([[
    command! -complete=file -nargs=* DebugC lua require "dap_setup".start_c_debugger({<f-args>}, "lldb")
]])
vim.cmd([[
    command! -complete=file -nargs=* DebugRust lua require "dap_setup".start_c_debugger({<f-args>}, "gdb", "rust-gdb")
]])

vim.g["conjure#highlight#enabled"] = 1
vim.g["conjure#highlight#timeout"] = 500
vim.g["conjure#highlight#group"] = "IncSearch"
vim.g["conjure#mapping#doc_word"] = "K"
vim.g["conjure#extract#tree_sitter#enabled"] = true

vim.cmd([[
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype lua nnoremap <F4> :w <bar> exec '!lua '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>
autocmd filetype rust nnoremap <F4> :w <bar> exec '!rustc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')' && rm '.shellescape('%:r')<CR>
]])
