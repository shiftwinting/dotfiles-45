local api = vim.api

api.nvim_command('packadd packer.nvim')

local packer = require('packer')
local packages = require('packages')

packer.startup(function()
  for _, value in pairs(packages) do
    packer.use(value)
  end
end)
