local _0_0 = nil
do
  local name_0_ = "dotfiles.module.dashboard"
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
nvim.g.dashboard_custom_shortcut = {book_marks = "L b", change_colorscheme = "\194\183\194\183\194\183", find_file = "L f", find_history = "L h", find_word = "\194\183\194\183\194\183", last_session = "\194\183\194\183\194\183", new_file = "\194\183\194\183\194\183"}
nvim.g.dashboard_change_to_dir = 1
nvim.g.dashboard_default_executive = "telescope"
return nil