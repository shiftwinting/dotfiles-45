export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# Lines configured by zsh-newuser-install
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=100000
SAVEHIST=100000
# End of lines configured by zsh-newuser-install

# Antibody
source $ZDOTDIR/plugins.sh

export EDITOR="nvim"
export NAVI_FINDER="skim"
setopt extendedglob

export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
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
export LS_COLORS="$(vivid generate one-dark)"

# Aliases
alias ls="ls --color=auto"
alias nx="nvim \$(xplr)"
alias pkgtop="pkgtop -pacman paru"
alias yay="paru"
alias yeet="sudo pacman -Rns"
alias :q="exit"
alias pins="paru -Slq | sk -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro paru -S"
alias n="nvim"
alias sc="systemctl"
alias sudo="sudo "
alias cat="bat"
alias gp="git pull"
alias gP="git push"
alias gpf="git push --force"
alias gf="git fetch"
alias gc="git commit"
alias gca="git commit --amend"
alias ga="git add"
export forgit_add="gaa"
# broot
source /home/p00f/.config/broot/launcher/bash/br

# Command-not-found handler
source /usr/share/doc/pkgfile/command-not-found.zsh
fpath+=~/.zfunc
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
autoload -U +X bashcompinit && bashcompinit

eval "$(zoxide init zsh)"
zmodload zsh/zpty
#eval "$(navi widget zsh)"

# Set terminal window title
function set_win_title() {
    echo -ne "\033]0; zsh: $(basename $PWD) \007"
}
precmd_functions+=(set_win_title)
eval "$(starship init zsh)"

source ~/fzf.zsh
