if &shell =~# 'fish$'
  set shell=sh
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  silent! pacaur -S --noconfirm --noedit --needed editorconfig-core-c

  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

set rtp+=/usr/local/bin/fzf

call plug#begin()

Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'othree/yajs.vim'
" Plug 'isRuslan/vim-es6'
" Plug 'mxw/vim-jsx'
Plug 'dag/vim-fish'

call plug#end()

" set t_Co=256
set mouse=a
set ttymouse=xterm2
set colorcolumn=100
set cursorline
set hlsearch
set number
set expandtab
set ts=2
set sw=2

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬
set list

" vim-airline configuration
let g:airline_theme = 'base16_eighties'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" enable vim-jsx for .js files
" let g:jsx_ext_required = 0
" let g:syntastic_javascript_checkers = ['eslint']

" map <C-n> :NERDTreeToggle<CR>

" ctrlp config
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_working_path_mode = 'ra'

" sudo write :)
" command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

if !empty(glob("~/.vim/plugged/base16-vim/colors/base16-eighties.vim"))
  colorscheme base16-eighties
endif
