local _0_0 = nil
do
  local name_0_ = "dotfiles.module.core"
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
    return {require("aniseed.core"), require("aniseed.nvim"), require("aniseed.string")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {core = "aniseed.core", nvim = "aniseed.nvim", str = "aniseed.string"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _1_ = _2_(...)
local core = _1_[1]
local nvim = _1_[2]
local str = _1_[3]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "dotfiles.module.core"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
nvim.o.termguicolors = true
nvim.o.mouse = "a"
nvim.o.number = true
nvim.o.relativenumber = true
if nvim.g.gnvim then
  nvim.o.guifont = "JetBrains Mono,Delugia Nerd Font,Inter:h11"
elseif nvim.g.gonvim_running then
  nvim.o.guifont = "JetBrains Mono:h11"
elseif nvim.g.neovide then
  nvim.o.guifont = "JetBrains Mono,Delugia Nerd Font,Inter,Noto Color Emoji:h15"
elseif nvim.g.uivonim then
  nvim.o.guifont = "Delugia Nerd Font,Inter,Noto Color Emoji:h15"
end
nvim.o.guicursor = str.join(",", core.concat(str.split(nvim.o.guicursor, ","), {"a:blinkon700"}))
if nvim.g.uivonim then
  nvim.o.listchars = "tab:<->,space:\194\183"
else
  nvim.o.listchars = "eol:\226\134\180,tab:<->,space:\194\183"
end
nvim.o.showmode = false
nvim.o.tabstop = 2
nvim.o.shiftwidth = 2
nvim.o.expandtab = true
nvim.o.softtabstop = 2
nvim.o.foldexpr = "nvim_treesitter#foldexpr()"
nvim.o.foldmethod = "expr"
nvim.o.clipboard = "unnamedplus"
nvim.o.completeopt = "menuone,noinsert,noselect"
nvim.o.hidden = true
nvim.o.autoindent = true
nvim.o.smartindent = true
nvim.o.emoji = false
nvim.o.list = true
nvim.o.signcolumn = "auto:3"
if nvim.g.gnvim then
  nvim.o.completeopt = "menuone,noinsert,noselect,preview"
end
nvim.o.pumblend = 15
nvim.o.winblend = 15
nvim.ex.colorscheme("dracula")
nvim.ex.highlight("dashboardHeader", "guifg=#50fa7b")
nvim.ex.highlight("link", "TSParameter", "DraculaOrangeItalic")
nvim.ex.highlight("link", "fennelParen", "DraculaSubtle")
nvim.ex.highlight("link", "Label", "DraculaPurple")
nvim.ex.highlight("MsgSeparator", "guifg=#282a36")
nvim.ex.highlight("lispbrackets", "guifg=#80859E")
nvim.ex.autocmd("FileType", "dashboard", "set showtabline=0")
nvim.ex.autocmd("WinLeave", "<buffer>", "set showtabline=2")
nvim.ex.autocmd("BufEnter", "*", "lua require'diagnostic'.on_attach()")
nvim.ex.autocmd("BufEnter", "*", "lua require'completion'.on_attach()")
nvim.ex.autocmd("CursorHold", "*", "lua vim.lsp.util.show_line_diagnostics()")
return nvim.ex.autocmd("FileType", "scheme", "ParinferOff")