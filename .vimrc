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
  Plug 'janko-m/vim-test'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'kassio/neoterm'
  Plug 'morhetz/gruvbox'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'mxw/vim-jsx'
  Plug 'neomake/neomake'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'pangloss/vim-javascript'
  Plug 'rking/ag.vim'
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
  Plug 'timonv/vim-cargo', { 'for': 'rust' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-endwise'
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'vim-scripts/bufkill.vim'
call plug#end()

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
nnoremap <silent> <leader>n :Lexplore<CR>

" ==== neovim cursor configuration
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI = "\<Esc>[1 q" " insert
let &t_SR = "\<Esc>[3 q" " replace
let &t_EI = "\<Esc>[2 q" " normal
