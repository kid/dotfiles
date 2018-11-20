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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
" Plug 'wincent/terminus'
" }}m

" Better language packs

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
"
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'roxma/nvim-yarp'
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
" Plug 'ervandew/supertab'
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plug 'w0rp/ale'

" Languagespecifics: {{{

Plug 'rust/rust.vim'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'TheLonelyGhost/vim-inspec'

" }}}

" Plug 'hashivim/vim-consul'
" Plug 'hashivim/vim-nomadproject'
" Plug 'hashivim/vim-packer'
" Plug 'hashivim/vim-terraform'
" Plug 'hashivim/vim-vagrant'
" Plug 'hashivim/vim-vaultproject'
" Plug 'pearofducks/ansible-vim'

" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'fishbullet/deoplete-ruby'

Plug 'neomake/neomake'

call plug#end()
" }}}

" set t_Co=256
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

set hidden
"
" Use both relative and absolume numbers
set number
set relativenumber
" 
" set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2

" Always show the sign column to avoid jumps
set signcolumn=yes

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬
set list

" Try to reuse windows/tabs when switching buffers
set switchbuf=usetab

" sudo write :)
if !exists(":W")
  command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
endif

" Enable cursorline and colorcolumn, but only on active buffer
let colorcolumn_blacklist = ['help']
autocmd BufEnter * setlocal cursorline | if index(colorcolumn_blacklist, &ft) < 0 | setlocal colorcolumn=100
autocmd BufLeave * setlocal nocursorline | setlocal colorcolumn=0

set autowrite
set autoread

let g:go_def_mapping_enabled = 0

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
