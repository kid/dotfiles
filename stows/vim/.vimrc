" Pluggins: {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vimi'

  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Essentials: {{{
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
" }}}

Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skwp/greplace.vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'Yggdroot/indentLine'

" Lazy load nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
"
" " Lazy load TagBar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
"
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'

" dependencies for deoplete/ncm2/neosnippet
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/denite.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Languagespecifics: {{{

Plug 'Shougo/neco-vim'
Plug 'elzr/vim-json'
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'TheLonelyGhost/vim-inspec'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-nomadproject'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-vaultproject'
Plug 'pearofducks/ansible-vim'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'cespare/vim-toml' 

" }}}

Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install() } }

Plug 'neomake/neomake'

call plug#end()
" }}}

set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

set hidden
"
" Use both relative and absolume numbers
set number
set relativenumber

" set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2

" Always show the sign column to avoid jumps
set signcolumn=yes

" Except for fzf, nerdtree and tagbar
autocmd FileType fzf,nerdtree,tagbar setlocal signcolumn=no

" Use the same symbols as TextMate for tabstops and EOLs
if has('nvim')
  set listchars=tab:→\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬
  set list
endif

" Try to reuse windows/tabs when switching buffers
set switchbuf=usetab

" faster CursorHold updates
set updatetime=500
"
" Don't show mode in command line, we have airline already
set noshowmode

" Disable annoying ins-completion-menu messages
set shortmess+=c

" sudo write :)
if !exists(":W")
  command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
endif

" close buffer without closing split
if !exists(":Bd")
  command Bd bp\|bd \#
endif

" Enable cursorline and colorcolumn, but only on active buffer
let colorcolumn_blacklist = ['help']
let cursorline_always = ['nerdtree']
autocmd BufEnter * setlocal cursorline | if index(colorcolumn_blacklist, &ft) < 0 | setlocal colorcolumn=100
autocmd BufLeave * setlocal nocursorline | setlocal colorcolumn=0

fun! OnBufEnter()
  setlocal cursorline

  if &ft !~ 'nerdtree\|help'
    setlocal colorcolumn=100
  endif
endfun

fun! OnBufLeave()
  let cursorline_always = ['nerdtree']
  if index(cursorline_always, &ft) < 0
    set nocursorline
  endif
  set colorcolumn=0
endfun

autocmd BufEnter * call OnBufEnter()
autocmd BufLeave * call OnBufLeave()

" Disable line numbers in terminal for FZF
if has('nvim')
  autocmd TermOpen * setlocal nonumber nornu
end

set autowrite
set autoread

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

autocmd VimEnter * highlight Comment gui=italic
