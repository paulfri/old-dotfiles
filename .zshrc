export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export LESS="--long-prompt --hilite-search --ignore-case --QUIET"
export HOMEBREW_NO_ANALYTICS=1
export CHRUBY_DIR="/usr/local/opt/chruby/share/chruby"
export TPM_DIR="$HOME/.tmux/plugins/tpm"
export PATH="$HOME/bin:/usr/local/sbin:$PATH"
export ZPLUG_HOME="/usr/local/opt/zplug"
export DOTFILES="$HOME/src/dotfiles"
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export FZF_DIR="/usr/local/opt/fzf"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export AWS_PROFILE=session

source $ZPLUG_HOME/init.zsh
[[ -f $CHRUBY_DIR/chruby.sh ]] && . $CHRUBY_DIR/chruby.sh
[[ -f $CHRUBY_DIR/auto.sh ]] && . $CHRUBY_DIR/auto.sh
[[ -f $FZF_DIR/shell/completion.zsh ]] && source $FZF_DIR/shell/completion.zsh
[[ -f $FZF_DIR/shell/key-bindings.zsh ]] && source $FZF_DIR/shell/key-bindings.zsh

setopt incappendhistory
bindkey -M viins "jj" vi-cmd-mode

alias vim="nvim"
alias d="docker"
alias g="git"
alias k="kubectl"
alias kx="kubectx"
alias la="ls -lah"
alias tc='clear; tmux clear-history; clear'
alias p='pnpm'

if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "$DOTFILES", from:local, use:"paulfri.zsh-theme", as:theme
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
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

stty sane

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" 
