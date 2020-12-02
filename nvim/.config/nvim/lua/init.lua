local api = vim.api

api.nvim_command('packadd packer.nvim')

local packer = require('packer')
local packages = require('packages')

packer.startup(function()
  for _, value in pairs(packages) do
    packer.use(value)
  end
end)

api.nvim_set_option("termguicolors", true)
api.nvim_set_var("oak_virtualtext_bg", 1)
