let mapleader=" "
inoremap jk <Esc>

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'morhetz/gruvbox'
  Plug 'othree/yajs.vim', { 'for': 'javascript' }
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'rking/ag.vim'
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'timonv/vim-cargo', { 'for': 'rust' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'vim-scripts/bufkill.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'neomake/neomake'
  Plug 'kassio/neoterm'
  Plug 'Valloric/ListToggle'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'mustache/vim-mustache-handlebars'
call plug#end()

" pretty colors
syntax on
colorscheme gruvbox
set background=dark

" filetype plugin indent on
" set encoding=utf-8
" set hlsearch
" set backspace=indent,eol,start
" set incsearch
" set mouse=a
" set nocompatible
" set wildmenu

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

nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>

let g:airline_powerline_fonts = 1
let NERDTreeShowHidden = 1
let g:rustfmt_autosave = 1

" ==== junegunn/fzf
let g:fzf_layout = { 'down': '~20%' }

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
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" ==== netrw
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = -35
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'

nnoremap <silent> <leader>n :Lexplore<CR>
