if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'neomake/neomake'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-scripts/bufkill.vim'
call plug#end()

set t_Co=256
set termguicolors
colorscheme onedark

filetype plugin indent on
syntax enable
set nocompatible
set background=dark
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
set colorcolumn=+1,+21
set cursorline
set list listchars=tab:»·,trail:·,nbsp:·
set number
set numberwidth=5
set textwidth=80

" === keybindings
let mapleader=" "
map <leader><space> :nohlsearch<CR>
map <leader>s :mksession<CR>
nnoremap <Tab> :bnext<CR>:redraw<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>
" force myself to learn ctrl-c instead of esc
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

" ==== vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" ====  rking/ag.vim
set grepprg=ag\ --nogroup\ --nocolor\ --column\ --hidden
set grepformat=%f:%l:%c%m
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" ==== junegunn/fzf
let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

nnoremap <silent> <leader>g :Commits<enter>
nnoremap <silent> <leader>b :BCommits<enter>
nnoremap <silent> <C-P> :FZF<CR>
inoremap <silent> <C-P> <ESC>:FZF<CR>i

" ==== Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ==== neomake/neomake
autocmd! BufWritePost * Neomake
let g:neomake_scss_stylelint_maker = {
        \ 'errorformat':
            \ '%+P%f,' .
                \ '%*\s%l:%c  %t  %m,' .
            \ '%-Q'
    \ }
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_javascript_enabled_makers = ['eslint']

" workaround for issues with phoenix's code reloading and neomake updating
" the ctime/mtime of elixir source files
let g:neomake_elixir_enabled_makers = []

" ==== scrooloose/nerdtree
let NERDTreeShowHidden = 1
nnoremap <silent> <leader>n :NERDTree<CR>
