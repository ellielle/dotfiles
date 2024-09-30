export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cybensis"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
plugins=(zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lily/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/lily/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# aliases
alias py=python3
alias lst="lsd --tree"
alias gl="git --no-pager log --oneline --decorate --graph"
alias gst="git status"
alias gc="git commit -S -m"
# quick vim aliases while working on config
alias vimteststartup="nvim --startuptime startup.log -c exit && tail -5 startup.log"
alias vimclean="rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim"
# watch go project directory for changes and run 'go test ./' 
alias goautotest="watchexec -c clear -o do-nothing -d 100ms --exts go 'pkg=\"./...\"; echo \"running tests for \$pkg\"; go test \"\$pkg\"'"

# bun completions
[ -s "/home/lily/.bun/_bun" ] && source "/home/lily/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# wsl browser set to wslview tool
export BROWSER=wslview

# Golang
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"

# bob's your neovim uncle
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# added by Webi for pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Turso
export PATH="/home/lily/.turso:$PATH"

# pomodoro using timer from https://github.com/caarlos0/timer
declare -A pomo_options 
pomo_options["work"]="45"
pomo_options["break"]="10"
pomo_options["tinker"]="20"

pomodoro() {
  clear
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
    val=$1
    echo $val 
    timer ${pomo_options["$val"]}m
    spd-say "'$val' session done"
  fi
}

