DISABLE_CORRECTION='true'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LESS='--long-prompt --LINE-NUMBERS --hilite-search --ignore-case --RAW-CONTROL-CHARS --status-column --underline-special --QUIET'
export NVM_DIR=$HOME/.nvm
export CHRUBY_DIR=/usr/local/share

source $HOME/antigen.zsh

[ -f $CHRUBY_DIR/chruby.sh ] && . $CHRUBY_DIR/chruby.sh
[ -f $CHRUBY_DIR/auto.sh ] && . $CHRUBY_DIR/auto.sh
[ -f $NVM_DIR/nvm.sh ] && . $NVM_DIR/nvm.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" \
    /usr/local/bin/diff-highlight
fi

alias reload!=". $HOME/.zshrc"
alias v='vagrant'
alias g='git'
alias be='bundle exec'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending

antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  brew
  bundler
  capistrano
  chruby
  colored-man-pages
  colorize
  gem
  gitfast
  github
  knife
  lol
  npm
  nyan
  rails
  rake-fast
  redis-cli
  ruby
  sudo
  tmux
  vagrant
  vi-mode
  thewtex/tmux-mem-cpu-load
EOBUNDLES
antigen theme $HOME paulfri
antigen apply
