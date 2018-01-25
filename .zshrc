export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'
export LESS='--long-prompt --LINE-NUMBERS --hilite-search --ignore-case --status-column --underline-special --QUIET'
export DISABLE_CORRECTION='true'
export HOMEBREW_NO_ANALYTICS=1
export CHRUBY_DIR='/usr/local/share/chruby'
export GOPATH='/Users/paulfri/go'

source $HOME/.antigen/antigen.zsh
[[ -f $CHRUBY_DIR/chruby.sh ]] && . $CHRUBY_DIR/chruby.sh
[[ -f $CHRUBY_DIR/auto.sh ]] && . $CHRUBY_DIR/auto.sh
[[ -f $HOME/.fzf.zsh ]] && . $HOME/.fzf.zsh

bindkey -M viins 'jj' vi-cmd-mode

alias vim='nvim'
alias g='git'
alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc'

antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  bundler
  chruby
  colored-man-pages
  colorize
  github
  nyan
  vi-mode
  zsh-users/zsh-completions
EOBUNDLES
antigen theme $HOME paulfri
antigen apply
