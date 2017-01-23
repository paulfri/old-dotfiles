DISABLE_CORRECTION='true'

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export EDITOR='nvim'
export VISUAL='nvim'
export LESS='--long-prompt --LINE-NUMBERS --hilite-search --ignore-case --status-column --underline-special --QUIET'
export HOMEBREW_NO_ANALYTICS=1
export CHRUBY_DIR='/usr/local/share/chruby'
export N_PREFIX="$HOME/n"
export PATH=$PATH:$N_PREFIX/bin:$HOME/.cargo/bin

source $HOME/.antigen/antigen.zsh
[[ -f $CHRUBY_DIR/chruby.sh ]] && . $CHRUBY_DIR/chruby.sh
[[ -f $CHRUBY_DIR/auto.sh ]] && . $CHRUBY_DIR/auto.sh
[[ -f $HOME/.fzf.zsh ]] && . $HOME/.fzf.zsh

bindkey -M viins 'jj' vi-cmd-mode

alias reload!=". $HOME/.zshrc"
alias vim=nvim
alias v='vagrant'
alias g='git'
alias be='bundle exec'
alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc'

if [[ -f /usr/share/vim/vim74/macros/less.sh ]]; then
  alias vless='/usr/share/vim/vim74/macros/less.sh'
elif [[ -f /usr/share/vim/vim73/macros/less.sh ]]; then
  # homebrew puts it here for some reason?
  alias vless='/usr/share/vim/vim73/macros/less.sh'
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" \
    /usr/local/bin/diff-highlight
fi

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
  mix
  rails
  rake-fast
  redis-cli
  ruby
  sudo
  tmux
  vagrant
  vi-mode
EOBUNDLES
antigen theme $HOME paulfri
antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
