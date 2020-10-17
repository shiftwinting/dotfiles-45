local api = vim.api
local fn = vim.fn
local luv = vim.loop

local packer_path = '~/.local/share/nvim/site/pack/packer/opt/packer.nvim'

api.nvim_command('packadd packer.nvim')

local packer = require('packer')
local packages = require('packages')

packer.startup(function()
  for key, value in pairs(packages) do
    packer.use(value)
  end
end)
