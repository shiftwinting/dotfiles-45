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
local _2amodule_name_2a = "dotfiles.module.diagnostic"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
nvim.g.diagnostic_enable_virtual_text = 0
nvim.g.diagnostic_insert_delay = 1
nvim.call_function("sign_define", {"LspDiagnosticsHintSign", {text = "\240\159\146\161", texthl = "LspDiagnosticsHint"}})
nvim.call_function("sign_define", {"LspDiagnosticsWarningSign", {text = "!", texthl = "LspDiagnosticsWarning"}})
nvim.call_function("sign_define", {"LspDiagnosticsInformationSign", {text = "i", texthl = "LspDiagnosticsInformation"}})
return nvim.call_function("sign_define", {"LspDiagnosticsErrorSign", {text = "\226\157\140", texthl = "LspDiagnosticError"}})