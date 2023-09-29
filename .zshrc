export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cybensis"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
plugins=(git nvm alias-finder aliases git-prompt zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lilisette/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/lilisette/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# bun completions
[ -s "/home/lilisette/.bun/_bun" ] && source "/home/lilisette/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Turso
export PATH="/home/lilisette/.turso:$PATH"
