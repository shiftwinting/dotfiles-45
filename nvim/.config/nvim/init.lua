local api = vim.api

api.nvim_command('packadd packer.nvim')
api.nvim_set_option('termguicolors', true)
api.nvim_set_var('conjure#mapping#doc_word', 'K')

local packer = require('packer')
local packages = require('packages')
packer.startup(
  function()
    for _, value in pairs(packages) do
      packer.use(value)
    end
  end
)

