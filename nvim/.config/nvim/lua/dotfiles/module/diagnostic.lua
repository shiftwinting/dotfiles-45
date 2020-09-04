local _0_0 = nil
do
  local name_0_ = "dotfiles.module.diagnostic"
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
nvim.g.diagnostic_enable_virtual_text = 0
nvim.g.diagnostic_insert_delay = 1
nvim.call_function("sign_define", {"LspDiagnosticsHintSign", {text = "\240\159\146\161", texthl = "LspDiagnosticsHint"}})
nvim.call_function("sign_define", {"LspDiagnosticsWarningSign", {text = "\226\154\160\239\184\143", texthl = "LspDiagnosticsWarning"}})
nvim.call_function("sign_define", {"LspDiagnosticsInformationSign", {text = "\226\132\185\239\184\143", texthl = "LspDiagnosticsInformation"}})
return nvim.call_function("sign_define", {"LspDiagnosticsErrorSign", {text = "\240\159\154\171", texthl = "LspDiagnosticError"}})