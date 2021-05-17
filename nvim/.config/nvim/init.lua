vim.o.termguicolors = true

local packer = require("packer")
local packages = require("packages")
packer.startup(function(use)
    for _, value in pairs(packages) do
        use(value)
    end
end)
