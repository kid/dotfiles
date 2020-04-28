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

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

Plug 'editorconfig/editorconfig-vim'
" Plug 'lifepillar/vim-mucomplete'
Plug 'neovim/nvim-lsp'

Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete-lsp'
" Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ervandew/supertab'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

colorscheme gruvbox
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ }

set guifont=FiraCode\ Nerd\ Font:h10

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

" lua << EOF
"   local nvim_lsp = require 'nvim_lsp'
"   require'nvim_lsp'.rust_analyzer.setup{}
" EOF

" disable preview window
" set completeopt-=preview

" set completeopt+=longest,menuone,noselect,noinsert
" let g:deoplete#enable_at_startup = 1
" let g:SuperTabDefaultCompletionType = "<c-n>"

map <Space> <Leader>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR> 

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

let g:which_key_map = {}

let g:which_key_map.c = {
  \ 'name': '+code',
  \ 'f': ['<cmd>lua vim.lsp.buf.formatting()', 'format-buffer'],
  \ }

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

set completeopt=noinsert,menuone ",noselect

lua require'nvim_lsp'.rust_analyzer.setup{}
lua require'nvim_lsp'.sumneko_lua.setup{}

autocmd BufEnter * call ncm2#enable_for_buffer()

au User Ncm2Plugin call ncm2#register_source({
    \ 'name' : 'Rust',
    \ 'priority': 9,
    \ 'scope': ['rust'],
    \ 'mark': 'RA',
    \ 'complete_pattern': ['\.', ':'],
    \ 'on_complete': 'ncm2#on_complete#lsp',
    \ })

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " Press enter key to trigger snippet expansion
" " The parameters are the same as `:help feedkeys()`
" " inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" " inoremap ncm2_ultisnips#expand_or("<CR>”, 'n')
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" " c-j c-k for moving in snippet
" " let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
" let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
" let g:UltiSnipsRemoveSelectModeMappings = 0
" let g:UltiSnipsEditSplit = 'context'

" inoremap <silent> <expr> <CR> ((pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : (!empty(v:completed_item) ? ncm2_ultisnips#expand_or("", 'n') : "\<CR>" ))
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
imap <expr> <c-u> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
smap <c-u> <Plug>(ultisnips_expand)
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
