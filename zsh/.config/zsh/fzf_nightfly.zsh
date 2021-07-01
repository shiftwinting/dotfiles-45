_gen_fzf_default_opts() {

local color00='#011627'
local color01='#1d3b53'
local color02='#a1cd5e'
local color03='#e3d18a'
local color04='#82aaff'
local color05='#c792ea'
local color06='#7fdbca'
local color07='#a1aab8'
local color08='#7c8f8f'
local color09='#ff5874'
local color0A='#21c7a8'
local color0B='#ecc48d'
local color0C='#82aaff'
local color0D='#ff5874'
local color0E='#7fdbca'
local color0F='#d6deeb'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

#export SKIM_DEFAULT_COMMAND="$SKIM_DEFAULT_COMMAND"\
#" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"
#" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
#" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

}

_gen_fzf_default_opts
