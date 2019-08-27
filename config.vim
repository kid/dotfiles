" Pluggins {{{

if &compatible
  " Be iMproved
  set nocompatible
endif

" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.local/share/dein'))
  call dein#begin(expand('~/.local/share/dein'))

  " Let dein manage dein
  " Required:
  call dein#add(expand('~/.local/share/dein/repos/github.com/Shougo/dein.vim'))

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Essentials
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-surround')
  call dein#add('easymotion/vim-easymotion')

  " Seems to conflict with deoplete
  " call dein#add('jiangmiao/auto-pairs')

  " Autocompletion and diagnostics
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('autozimu/LanguageClient-neovim', {
  \ 'build': 'bash install.sh',
  \ 'rev': 'next',
  \ })

  " Interface
  call dein#add('morhetz/gruvbox')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('junegunn/fzf', { 'rtp': '~/.fzf' })
  call dein#add('junegunn/fzf.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('blueyed/vim-diminactive')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle' })
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('qpkorr/vim-bufkill')
  call dein#add('edkolev/tmuxline.vim')
  call dein#add('christoomey/vim-tmux-navigator')

  " Language support
  call dein#add('hashivim/vim-terraform')
  call dein#add('fatih/vim-go')
  call dein#add('rust-lang/rust.vim')
  call dein#add('derekwyatt/vim-scala')

  " call dein#add('neomake/neomake')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" }}}

" Basic config {{{

set hidden
set lazyredraw

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" Use both relative and absolume numbers
set number
set relativenumber

set cursorline
set signcolumn=yes
set splitbelow
set splitright

" Try to reuse windows/tabs when switching buffers
set switchbuf=usetab

" faster CursorHold updates
set updatetime=500
"
" Don't show mode in command line, we have airline already
set noshowmode

" Use the same symbols as TextMate for tabstops and EOLs
if has('nvim')
  set listchars=tab:→\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬
  set list
endif

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" }}}

" Interface {{{

colorscheme gruvbox
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:tmuxline_powerline_separators = 0

let g:diminactive_enable_focus = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Auto save all the things
set autowriteall
autocmd FocusLost * silent! wa

" Toggle the cursorline in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

let g:fzf_files_options =
  \ '--preview "bat --number --color always --italic-text always --paging never {}"'

" }}}

" Autocompletion {{{

" Don't open preview window we have floating window for this
set completeopt-=preview

let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" For conceal markers, required by NeoSnippet
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" let g:LanguageClient_useFloatingHover = 1
" let g:LanguageClient_useVirtualText = 1
let g:LanguageClient_completionPreferTextEdit = 1
let g:LanguageClient_serverCommands = {
\ 'rust': ['rustup', 'run', 'stable', 'rls'],
\ 'scala': ['metals-vim'],
\ 'terraform': ['~/.bin/terraform-lsp'],
\ 'go': ['gopls'],
\ 'python': ['pyls'],
\ }


let g:neosnippet#enable_complete_done = 1

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

" }}}

" Commands and Helpers {{{

" sudo write :)
if !exists(':W')
  command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
endif

" Prevent opening files in NERDTree's buffer
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif

" }}}

" Mappings {{{

imap jk <Esc>

nnoremap <Leader>q :BD<CR>

" search selected text
vnoremap // y/<C-R>"<CR>

" Copy til end if one, like C and D
nnoremap Y y$

" System copy paste
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+y$
vnoremap <Leader>y "+y

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p

" Ctrl-Tab for cycling through buffers
nnoremap <M-Tab> :bnext<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

nnoremap <C-t> :TagbarToggle<CR>
nnoremap <C-s> :NERDTreeToggle<CR>

" Move to line
map <Leader><Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" nmap <Leader>f :GFiles -o<CR>
nmap <Leader>f :call FZFOpen(':Files')<CR>
nmap <Leader>F :call FZFOpen(':GFiles')<CR>
nmap <Leader>b :call FZFOpen(':Buffers')<CR>
nmap <Leader>c :call FZFOpen(':Commands')<CR>
nmap <Leader>r :call FZFOpen(':History:')<CR>

" autocompletion with tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable()
\ ? "\<Plug>(neosnippet_expand_or_jump)"
\ : "\<TAB>"

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>

" }}}

" Filetype settings {{{

" Use 2 spaces by default unless overriden
set shiftwidth=2

autocmd FileType fzf setlocal nonumber norelativenumber
autocmd FileType gitcommit setlocal spell nofoldenable
autocmd Filetype vim setlocal expandtab foldmethod=marker
autocmd Filetype go setlocal tabstop=4

" Don't insert comment when hitting 'o' from a comment
autocmd FileType * setlocal formatoptions-=o

autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
autocmd BufWritePre *.tf :TerraformFmt

" }}}
