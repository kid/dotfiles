if &shell =~# 'fish$'
  set shell=sh
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  silent! pacaur -S --noconfirm --noedit --needed editorconfig-core-c

  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-nomadproject'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-vaultproject'
Plug 'pearofducks/ansible-vim'

" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'fishbullet/deoplete-ruby'

call plug#end()

set t_Co=256
set mouse=a
set ttymouse=xterm2
set colorcolumn=100
set relativenumber
set cursorline
set hlsearch
set number
set expandtab
set ts=2
set sw=2

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬
set list

" let base16colorspace=256  " Access colors present in 256 colorspace
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" vim-airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Autocompletion
let g:deoplete#enable_at_startup = 1

" vim-go configuration
let g:go_fmt_command = "goimports"

" ALE Config
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

let g:ale_sign_info = "◉""
let g:ale_sign_error = "◉""
let g:ale_sign_warning = "◉""

let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

highlight ALEInfoSign ctermfg=20 ctermbg=18
highlight ALEErrorSign ctermfg=9 ctermbg=18
highlight ALEWarningSign ctermfg=16 ctermbg=18

highlight ALEInfo cterm=underline ctermfg=none ctermbg=none
highlight ALEError cterm=underline ctermfg=none ctermbg=none
highlight ALEWarning cterm=underline ctermfg=none ctermbg=none

" Bindings

imap jk <Esc>
imap kj <Esc>

map <C-n> :NERDTreeToggle<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" sudo write :)
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
