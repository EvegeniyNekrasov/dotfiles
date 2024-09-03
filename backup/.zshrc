# Brew aliases
alias autoremove="brew autoremove"
alias install="brew install"
alias search="brew search"
alias outdated="brew outdated"
alias upgrade="brew upgrade"
alias uninstall="brew uninstall --zap"

# Navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias gh="cd"
alias gc="cd ~/.config"
alias gp="cd ~/Desktop/Projects/"
alias gpd="cd ~/Desktop/Projects/dotfiles/"

# File listing aliases
alias l="eza -l --icons"
alias la="eza -la --icons"
alias t="eza -T --icons"
alias LA="ll --sort=acc"
alias LS="ll --sort=size"
# Init startship
eval "$(starship init zsh)"

# Zsh plugins
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
