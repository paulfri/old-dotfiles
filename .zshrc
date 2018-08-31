export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export LESS="--long-prompt --LINE-NUMBERS --hilite-search --ignore-case --status-column --QUIET"
export HOMEBREW_NO_ANALYTICS=1
export CHRUBY_DIR="/usr/local/opt/chruby/share/chruby"
export TPM_DIR="$HOME/.tmux/plugins/tpm"
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$PATH"
export ZPLUG_HOME="/usr/local/opt/zplug"
export DOTFILES="$HOME/src/dotfiles"
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

source $ZPLUG_HOME/init.zsh
[[ -f $CHRUBY_DIR/chruby.sh ]] && . $CHRUBY_DIR/chruby.sh
[[ -f $CHRUBY_DIR/auto.sh ]] && . $CHRUBY_DIR/auto.sh
[[ -f $HOME/.fzf.zsh ]] && . $HOME/.fzf.zsh

setopt appendhistory
bindkey -M viins "jj" vi-cmd-mode

alias vim="nvim"
alias g="git"
alias n="neofetch"
alias la="ls -lah"
alias docker-gc="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc"

zplug "$DOTFILES", from:local, use:"paulfri.zsh-theme", as:theme
zplug "ael-code/zsh-colored-man-pages"
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "urbainvaes/fzf-marks"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

source "/usr/local/opt/fzf/shell/completion.zsh"
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
