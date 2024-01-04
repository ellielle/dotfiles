export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cybensis"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
plugins=(git nvm aliases git-prompt zsh-autosuggestions zsh-syntax-highlighting)

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

# aliases
alias p=pnpm
alias lsd="ls -1"
alias vim=nvim
alias v=nvim
alias py=python3
# quick vim aliases while working on config
alias vimteststartup="nvim --startuptime startup.log -c exit && tail -5 startup.log"
alias vimclean="rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim"

# bun completions
[ -s "/home/lilisette/.bun/_bun" ] && source "/home/lilisette/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# deno
export DENO_INSTALL="/home/lilisette/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# wsl browser symlink path
export BROWSER=~/symlink-browser/firefox.exe
  
# Turso
export PATH="/home/lilisette/.turso:$PATH"

# Golang
export PATH=$PATH:/usr/local/go/bin

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# added by Webi for pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
