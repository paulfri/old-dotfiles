DISABLE_CORRECTION="true"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color
export LESS=" -R "
export NVM_DIR=$HOME/.nvm
source $HOME/antigen.zsh

# chruby
if [ -f /usr/local/share/chruby/chruby.sh ]; then
  . /usr/local/share/chruby/chruby.sh
  . /usr/local/share/chruby/auto.sh
  chruby 2.3.0 # TODO: read .ruby-version
fi

# nvm
if [ -f "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
fi

# OSX-only stuff until I port it
if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" \
    /usr/local/bin/diff-highlight
fi

alias v='vagrant'
alias g='git'
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias be='bundle exec'

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
