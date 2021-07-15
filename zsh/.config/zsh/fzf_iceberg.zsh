_gen_fzf_default_opts() {

local color00='#161822'
local color01='#36384A'
local color02='#A4BF8D'
local color03='#EBCA89'
local color04='#85A0C7'
local color05='#A092C8'
local color06='#89B8C2'
local color07='#828597'
local color08='#5C5E70'
local color09='#E46767'
local color0A='#A4BF8D'
local color0B='#EBCA89'
local color0C='#85A0C7'
local color0D='#E46767'
local color0E='#89B8C2'
local color0F='#fdf6e3'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"
}

_gen_fzf_default_opts
