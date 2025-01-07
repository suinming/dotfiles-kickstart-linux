setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# =============================
# Paths
# =============================

# custom directories
export PATH="$HOME/.local/share:$HOME/.local/bin:$PATH"

# myscripts directories
export PATH="$HOME/myscripts:$PATH"

# go
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/go/bin:$PATH"

# rust cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Neovim and Lua Language Server
export PATH="$HOME/neovim/bin:/home/suinming/lua-language-server/bin:$PATH"

# sqlite3.47.2
export PATH="$HOME/Downloads/sqlite-autoconf-3470200:$PATH"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# =============================
# Aliases
# =============================

# update packages
alias uu="sudo apt update -y && sudo apt upgrade -y"

# use eza to replace ls
alias ls="eza"

# use zoxide to replace cd
alias cd="z"

# trash cli
alias tp="trash-put"
alias tm="trash-empty"
alias tl="trash-list"

# git
alias gs='git status'
alias gbr="git branch"
alias gco="git checkout \$1 \$2"
alias gre="git restore \$1"
alias gaa="git add --all"
alias gcm="git commit"
alias gp="git push origin \$1"
alias gpl="git pull origin \$1"
alias gac="git add --all && git commit"
alias gwc="bash $HOME/myscripts/gwc.sh" # execute git worktree clone bash script
alias gwl="git worktree list"
alias gwa="git worktree add \$1 \$2" # there might be one or two arguments
alias gwr="git worktree remove \$1"

# =============================
# Plugins
# =============================

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# sesh
function list-sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N           list-sesh-sessions
bindkey -M emacs 'S' list-sesh-sessions
bindkey -M vicmd 'S' list-sesh-sessions
bindkey -M viins 'S' list-sesh-sessions

# start ship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

. "$HOME/.local/bin/env"
