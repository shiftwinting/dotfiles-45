export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# End of lines configured by zsh-newuser-install
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Antibody
source ~/.zsh_plugins.sh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export EDITOR="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# Colourful man
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[01;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[01;32m' \
        command man "$@"
}

# Aliases
alias pkgtop='pkgtop -pacman paru'
alias yeet='paru -Rsn'
alias :q='exit'
alias pins="paru -Slq | sk -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro paru -S"
alias lg="TERM=xterm-256color lazygit"
alias n="nvim"
#alias fzf='sk'

# broot
source /home/p00f/.config/broot/launcher/bash/br

#set wezterm title
set_title() {
    printf "\e]0;%s\e\\" "wezterm"
}
. ~/.wezterm.sh
precmd_functions+=(set_title)
source ~/.wezterm.sh

# Command-not-found handler
source /usr/share/doc/pkgfile/command-not-found.zsh

autoload -Uz compinit
compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/bit bit
eval "$(zoxide init zsh)"
zmodload zsh/zpty
