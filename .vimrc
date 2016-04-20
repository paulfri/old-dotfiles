set nocompatible
scriptencoding utf-8
set encoding=utf-8
set t_Co=256
set mouse=a

" sanity reigns
let mapleader=" "
inoremap jk <Esc>

" install vundle
if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

" vundle it up
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'ConradIrwin/vim-bracketed-paste'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'bling/vim-airline'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'fatih/vim-go'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'morhetz/gruvbox'
  Plugin 'othree/yajs.vim'
  Plugin 'rking/ag.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-eunuch'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'vim-scripts/bufkill.vim'
call vundle#end()
filetype plugin indent on

syntax on
colorscheme gruvbox
set background=dark

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
  set grepprg=ag\ --nogroup\ --nocolor\ --column\ --hidden
  set grepformat=%f:%l:%c%m
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
