export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# Lines configured by zsh-newuser-install
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=100000
SAVEHIST=100000
# End of lines configured by zsh-newuser-install

# Aliases
export forgit_add=gaa
alias pins="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro paru -S"
alias notes="fd .org ~/org --type f | fzf --preview 'bat --color=always {}'"
alias sudo="sudo "

source $ZDOTDIR/plugins.sh

# Options
setopt extendedglob

# Colourful man
man() {
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;97m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;48;5;117;30m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[04;94m' \
    command man "$@"
}

# Command-not-found handler
source /usr/share/doc/pkgfile/command-not-found.zsh

# Completion
fpath+=~/.zfunc
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
autoload -U +X bashcompinit && bashcompinit

# Tools
eval "$(zoxide init zsh)"
zmodload zsh/zpty
eval "$(navi widget zsh)"
eval "$(starship init zsh)"
source $ZDOTDIR/fzf.zsh
source $ZDOTDIR/fzf_nightfly.zsh
source /home/p00f/.config/broot/launcher/bash/br

# Set terminal window title
function set_win_title() {
    echo -ne "\033]0; zsh: $(basename $PWD) \007"
}
precmd_functions+=(set_win_title)
