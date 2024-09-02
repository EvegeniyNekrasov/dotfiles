alias autoremove="brew autoremove"
alias install="brew install"
alias search="brew search"
alias outdated="brew outdated"
alias upgrade="brew upgrade"
alias uninstall="brew uninstall --zap"

eval "$(starship init zsh)"

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
