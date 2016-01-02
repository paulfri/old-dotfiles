" .vimrc
" @paulfri (2015-12-19)

scriptencoding utf-8
set encoding=utf-8

let mapleader=" "
let g:airline_powerline_fonts = 1
let NERDTreeShowHidden=1

" install vundle unless present
if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

" begin vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'bling/vim-airline'
  Plugin 'tpope/vim-commentary'
  Plugin 'rking/ag.vim'
  Plugin 'jpo/vim-railscasts-theme'
  Plugin 'tpope/vim-eunuch'
call vundle#end()
filetype plugin indent on
" end vundle

set t_Co=256
syntax on
colorscheme railscasts

inoremap kj <Esc>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

set timeoutlen=200
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
set list listchars=tab:»·,trail:·,nbsp:·
set textwidth=80
set colorcolumn=+1,+21

" soft tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

