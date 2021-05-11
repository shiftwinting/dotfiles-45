vim.o.termguicolors = true

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
        vim.cmd("packadd packer.nvim")
end

vim.api.nvim_command("packadd packer.nvim")
local packer = require("packer")
local packages = require("packages")

packer.startup(function()
        for _, value in pairs(packages) do
                packer.use(value)
        end
end)
