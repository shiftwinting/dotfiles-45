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
local function _1_(...)
  _0_0["aniseed/local-fns"] = {require = {nvim = "aniseed.nvim"}}
  return {require("aniseed.nvim")}
end
local _2_ = _1_(...)
local nvim = _2_[1]
do local _ = ({nil, _0_0, {{}, nil}})[2] end
nvim.g.ale_linters = {clojure = {"joker"}, fennel = {"joker"}, java = {}, lua = {}, python = {"flake8"}, sh = {}, vim = {}}
nvim.g.ale_fixers = {["*"] = {"remove_trailing_lines", "trim_whitespace"}, java = {"google_java_format"}, sh = {"shfmt"}}
nvim.g.ale_sign_error = "\195\151"
nvim.g.ale_lint_on_text_changed = "always"
nvim.g.ale_disable_lsp = 1
return nil