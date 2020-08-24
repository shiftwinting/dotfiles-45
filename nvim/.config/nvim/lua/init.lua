local api = vim.api
local fn = vim.fn
local luv = vim.loop

local packer_path = luv.os_homedir() .. '/.local/share/nvim/site/pack/packer/opt/packer.nvim'

api.nvim_command('packadd packer.nvim')
-- Temporary until https://github.com/neovim/neovim/pull/12632 is merged
--vim._update_package_paths()

local packer = require('packer')
local packages = require('packages')

packer.startup(function()
  for key, value in pairs(packages) do
    packer.use(value)
  end

  -- Temporary until https://github.com/neovim/neovim/pull/12632 is merged
--  vim._update_package_paths()
end)
