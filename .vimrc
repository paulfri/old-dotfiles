let mapleader=" "
inoremap jj <Esc>

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Valloric/ListToggle'
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
  Plug 'godlygeek/tabular'
  Plug 'janko-m/vim-test'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'kassio/neoterm'
  Plug 'leafgarland/typescript-vim'
  Plug 'majutsushi/tagbar'
  Plug 'mhinz/vim-startify'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'mxw/vim-jsx'
  Plug 'neomake/neomake'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'pangloss/vim-javascript'
  Plug 'posva/vim-vue'
  Plug 'rking/ag.vim'
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'sbdchd/neoformat'
  Plug 'scrooloose/nerdtree'
  Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
  Plug 'timonv/vim-cargo', { 'for': 'rust' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-speeddating'
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'vim-scripts/bufkill.vim'
  Plug 'yegappan/mru'
  Plug 'jparise/vim-graphql'
  Plug 'fatih/vim-go'
  Plug 'danilo-augusto/vim-afterglow'
call plug#end()

syntax on
colorscheme afterglow
set background=dark

" filetype plugin indent on
" set encoding=utf-8
" set hlsearch
" set backspace=indent,eol,start
" set incsearch
set mouse=a
set inccommand=nosplit
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
noremap  <C-C> <Esc>
inoremap <C-C> <Esc>
" lul i'm a dummy
inoremap <Esc> <nop>

nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>

let g:airline_powerline_fonts = 1
let NERDTreeShowHidden = 1
let g:rustfmt_autosave = 1

" keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz<Paste>

" ==== janko-m/vim-test
let test#strategy = "neovim"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

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

" === mxw/vim-jsx
let g:jsx_ext_required = 0

" ==== Valloric/ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" ==== netrw
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = -35
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'

" ==== AltCommand
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)

  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':vs')<cr>
set splitright

" ====
nnoremap <silent> <leader>n :NERDTree<CR>

" ==== majutsushi/tagbar
nmap <silent> <leader>r :TagbarToggle<CR>

" ==== neoformat
" autocmd FileType javascript setlocal formatprg=prettier\ --stdin
" let g:neoformat_try_formatprg = 1
" autocmd BufWritePre *.js Neoformat
