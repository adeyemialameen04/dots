# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Adds powelevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -U compinit && compinit
zinit light Aloxaf/fzf-tab

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'

# GIT ALIASES
alias add='git add .'
alias com='git commit --allow-empty-message -m ""'
alias push='git push -u origin main'
alias pl="git pull origin main"
alias fe="cd /home/code-savant-al/GENERAL_WORKS/FE_WORKS"
alias alx="cd /home/code-savant-al/GENERAL_WORKS/ALX"
# GIT FUNCTION LOL
function acp() {
    echo "=========== PREPARING TO ADD... ============="
    git add .
    echo "=========== FINISHED ADDING ============="
    printf "==== Enter your commit message boss ====: "
    read commit_message
    git commit -m "$commit_message"
    echo "=========== COMMITED ============="
    echo "=========== PREPARING TO PUSH ============="
    git push origin "$(git rev-parse --abbrev-ref HEAD)"
    echo "=========== PUSHED WELLDONE BOSS ... ============="
}

bcat()
{
  local file="$1"

  if [ -f "$file" ]; then
    bat "$file" ; bat "$file" | xclip -selection clipboard
  else
    echo "File not found dumbass, what are u stupid?"
  fi
}

# LAZY ALIASES
alias d='clear'
alias v="gcc *.c ; ./a.out"
alias s="startx"
alias myscrot='scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png'
alias ff="fastfetch"
# Networks
alias mifi='nmcli device wifi connect "Airtel 4G MiFi_861E" password 54111296'
alias phone='nmcli device wifi connect "I USE ARCH BTW" password 54150465034'
alias vim="nvim"
alias cd="z"
alias ls="lsd"
export PATH="$PATH:$HOME/.local/bin"
[ -f ~/.zsh_secrets ] && source ~/.zsh_secrets

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
