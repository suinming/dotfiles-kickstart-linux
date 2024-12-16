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

# export path variable
export PATH="/home/suinming/.local/share:$PATH"
export PATH="/home/suinming/.local/bin:$PATH"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.local/bin:$PATH"

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# update packages
alias uu="sudo apt update -y && sudo apt upgrade -y"

# use eza to replace ls 
alias ls="eza"

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
alias gwc="bash $HOME/dotfiles/myscripts/scripts/gwc.sh" # execute git worktree clone bash script
alias gwl="git worktree list"
alias gwa="git worktree add \$1 \$2" # there might be one or two arguments
alias gwr="git worktree remove \$1"

# kulala-fmt
alias kulala-fmt="~/Downloads/kulala-fmt-linux"

# pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# start ship 
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"
