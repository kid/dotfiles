colorscheme gruvbox
" let g:lightline = {
"   \ 'colorscheme': 'gruvbox',
"   \ }

set guifont=FiraCode\ Nerd\ Font:h9

set hidden

" Use both relative and absolume numbers
set number
set relativenumber

set expandtab
set tabstop=2
set shiftwidth=2

" Always show the sign column to avoid jump
set signcolumn=yes

set shortmess+=c

set updatetime=500

" Don't show mode in command line, we have lightline for that
set noshowmode

" Display whitespace
set listchars=tab:→\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬
set list

" live preview of search & replace
set inccommand=nosplit
