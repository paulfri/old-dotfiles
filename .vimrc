" .vimrc
" @paulfri (2015-12-19)

let mapleader=" "
let g:airline_powerline_fonts = 1

" begin vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'bling/vim-airline'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'rking/ag.vim'
  Plugin 'jpo/vim-railscasts-theme'
  Plugin 'tpope/vim-eunuch'
call vundle#end()
filetype plugin indent on
" end vundle

syntax on
colorscheme railscasts

set t_Co=256

set nocompatible
set noswapfile
set nobackup
set nowritebackup
set history=50
set backspace=indent,eol,start
set ruler
set laststatus=2

set hidden
set incsearch
set switchbuf=useopen,usetab
set tags=./tags;/,tags;/
set wildmenu

set number
set numberwidth=5

" soft tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" show extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" 80 character column
set textwidth=80
set colorcolumn=+1,+21

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" maps
map <Leader>n <plug>NERDTreeTabsToggle<CR>
