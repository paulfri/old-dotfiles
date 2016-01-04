" .vimrc
" @paulfri (2015-12-19)

" either improve or break compatibility
set nocompatible
scriptencoding utf-8
set encoding=utf-8
set t_Co=256

" sanity reigns
let mapleader=" "
inoremap kj <Esc>

" install vundle
if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

" vundle it up
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'airblade/vim-gitgutter'
  Plugin 'bling/vim-airline'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'jpo/vim-railscasts-theme'
  Plugin 'rking/ag.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-eunuch'
  Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

syntax on
colorscheme railscasts

set timeoutlen=200
set noswapfile
set nobackup
set nowritebackup
set history=50
set backspace=indent,eol,start
set ruler
set laststatus=2

set hidden
set incsearch
set hlsearch
set switchbuf=useopen,usetab
set tags=./tags;/,tags;/
set wildmenu

" need dat gfx
set colorcolumn=+1,+21
set cursorline
set list listchars=tab:»·,trail:·,nbsp:·
set number
set numberwidth=5
set textwidth=80

" soft tabs, 2 spaces
set expandtab
set shiftround
set shiftwidth=2
set tabstop=2

" need 4 speed
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_match_window = 'bottom,order:ttb'
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore ".git"'

  " bind \ to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

map <leader>n <plug>NERDTreeTabsToggle<CR>
map <leader><space> :nohlsearch<CR>
map <leader>s :mksession<CR>

let g:airline_powerline_fonts = 1
let NERDTreeShowHidden=1
