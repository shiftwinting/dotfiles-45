local _0_0 = nil
do
  local name_0_ = "dotfiles.module.ale"
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
local function _2_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _2_()
    return {require("aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _1_ = _2_(...)
local nvim = _1_[1]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "dotfiles.module.ale"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
nvim.g.ale_linters = {clojure = {"joker"}, fennel = {"joker"}, java = {}, lua = {}, python = {"flake8"}, sh = {}, vim = {}}
nvim.g.ale_fixers = {["*"] = {"remove_trailing_lines", "trim_whitespace"}, java = {"google_java_format"}, python = {"flake8"}, sh = {"shfmt"}}
nvim.g.ale_sign_error = "\195\151"
nvim.g.ale_lint_on_text_changed = "always"
nvim.g.ale_disable_lsp = 1
return nil