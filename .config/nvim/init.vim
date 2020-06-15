if empty(glob("~/.config/nvim/autoload/plug.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'arcticicestudio/nord-vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'jremmen/vim-ripgrep'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'majutsushi/tagbar'
  Plug 'neomake/neomake'
  Plug 'sbdchd/neoformat'
  Plug 'scrooloose/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-scripts/bufkill.vim'
call plug#end()

set nocompatible
filetype plugin indent on

syntax enable
colorscheme nord
set background=dark
set termguicolors
set cursorline
set colorcolumn=+1,+21

set backspace=indent,eol,start
set encoding=utf-8
set hlsearch
set inccommand=nosplit
set incsearch
set mouse=a
set wildmenu
set timeoutlen=200
set noswapfile
set nobackup
set nowritebackup
set ruler
set laststatus=2
set expandtab
set shiftround
set shiftwidth=2
set tabstop=2
set hidden
set switchbuf=useopen,usetab
set tags=./tags;/,tags;/
set list listchars=tab:»·,trail:·,nbsp:·
set number
set numberwidth=5
set textwidth=80
set clipboard=unnamedplus

" === keybindings
let mapleader=" "
noremap  <C-q> :BD<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <Tab> :bnext<CR>:redraw<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>
noremap  <C-C> <Esc>
inoremap <C-C> <Esc>
inoremap <Esc> <nop>
" keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz<Paste>
" copy relative/absolute filepath to clipboard
nnoremap <leader>cf :let @*=expand("%")<CR>
nnoremap <leader>CF :let @*=expand("%:p")<CR>
" pretty print json
nnoremap <leader>pp :%!jq .<CR>

" ==== majutsushi/tagbar
nnoremap <silent> <leader>u :TagbarToggle<enter>

" ==== vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='nord'

" ==== jremmen/vim-ripgrep
let g:rg_highlight = 1
nnoremap \ :Rg<SPACE>

" ==== junegunn/fzf
let g:fzf_layout = { 'down': '~20%' }
nnoremap <C-T> :Tags<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <leader>g :Commits<enter>
nnoremap <silent> <leader>b :BCommits<enter>
nnoremap <silent> <C-P> :FZF<CR>
inoremap <silent> <C-P> <ESC>:FZF<CR>i

" ==== Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ==== sbdchd/neoformat
autocmd BufWritePre *.ex Neoformat
autocmd BufWritePre *.exs Neoformat
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.json Neoformat
autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.tf Neoformat

" ==== scrooloose/nerdtree
let NERDTreeShowHidden = 1
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
