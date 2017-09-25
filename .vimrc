let mapleader=" "
inoremap jj <Esc>

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
  Plug 'fatih/vim-go'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'jparise/vim-graphql'
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'neomake/neomake'
  Plug 'pangloss/vim-javascript'
  Plug 'rking/ag.vim'
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'vim-scripts/bufkill.vim'
  Plug 'jacoborus/tender.vim'
call plug#end()

filetype plugin indent on
syntax enable
colorscheme tender
set nocompatible
set background=dark
set backspace=indent,eol,start
set encoding=utf-8
set hlsearch
set inccommand=nosplit
set incsearch
set mouse=a
set wildmenu
set termguicolors

set timeoutlen=200
set noswapfile
set nobackup
set nowritebackup
set ruler
set laststatus=2

set hidden
set switchbuf=useopen,usetab
set tags=./tags;/,tags;/

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

  " bind \ to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" can't write code
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" whatever else
map <leader><space> :nohlsearch<CR>
map <leader>s :mksession<CR>

" lul i'm a dummy
noremap  <C-C> <Esc>
inoremap <C-C> <Esc>
inoremap <Esc> <nop>

nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>

let g:airline_powerline_fonts = 1
let NERDTreeShowHidden = 1
let g:rustfmt_autosave = 1
let g:airline_theme = 'tender'

" keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz<Paste>

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
nnoremap <silent> <leader>n :NERDTree<CR>
