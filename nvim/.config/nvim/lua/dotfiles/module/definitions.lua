local _0_0 = nil
do
  local name_0_ = "dotfiles.module.definitions"
  local loaded_0_ = package.loaded[name_0_]
  local module_0_ = nil
  if ("table" == type(loaded_0_)) then
    module_0_ = loaded_0_
  else
    module_0_ = {}
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = (module_0_["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = (module_0_["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local function _1_(...)
  _0_0["aniseed/local-fns"] = {require = {nvim = "aniseed.nvim"}}
  return {require("aniseed.nvim")}
end
local _2_ = _1_(...)
local nvim = _2_[1]
do local _ = ({nil, _0_0, {{}, nil}})[2] end
nvim.g.languagetool_server_command = "languagetool"
nvim.g.neoterm_default_mod = "botright"
nvim.g["sneak#label"] = 1
nvim.g.indentLine_fileTypeExclude = {"dashboard", "startify", "clj", "fennel"}
nvim.g.indentLine_char = "\226\148\130"
nvim.g.which_key_map = {}
nvim.g["float_preview#docked"] = 0
nvim.g.vista_default_executive = "nvim_lsp"
nvim.g["neosnippet#enable_completed_snippet"] = 1
nvim.g["neosnippet#enable_complete_done"] = 1
if nvim.g.neovide then
  nvim.g.airline_left_sep = "\238\130\180"
  nvim.g.airline_right_sep = "\238\130\182"
  nvim.g.neovide_transparency = 0.80000000000000004
  return nil
end