if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin()

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'

Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'


Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vader.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'jceb/vim-orgmode'

" TODO
" - add vimagit
" - check airline's tabline vs xtabline
" - check https://github.com/weilbith/nvim-lsp-smag
" - check https://github.com/haorenW1025/completion-nvim
call plug#end()

luafile ~/.config/nvim/init.lua
