" Pluggins {{{

if &compatible
  " Be iMproved
  set nocompatible
endif

" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim


" Auto rebuild dein's cache
let g:dein#auto_recache = 1

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
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-surround')
  call dein#add('easymotion/vim-easymotion')

  " Better copy/pasting
  call dein#add('svermeulen/vim-cutlass')
  " call dein#add('svermeulen/vim-subversive')

    " Autocompletion and diagnostics
  " call dein#add('neoclide/coc.nvim', {'merge': 0, 'rev': 'release'})
  call dein#add('neoclide/coc.nvim', {'merge': 0, 'build': 'yarn install --frozen-lockfile' })
  call dein#add('honza/vim-snippets')
  call dein#add('liuchengxu/vista.vim')

  " Interface
  call dein#add('gruvbox-community/gruvbox')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('junegunn/fzf', { 'rtp': '~/.fzf' })
  call dein#add('junegunn/fzf.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('TaDaa/vimade')
  call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('qpkorr/vim-bufkill')
  call dein#add('edkolev/tmuxline.vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('Yggdroot/indentLine')

  " Language support
  call dein#add('hashivim/vim-terraform')
  call dein#add('fatih/vim-go')
  call dein#add('rust-lang/rust.vim')
  call dein#add('derekwyatt/vim-scala')
  call dein#add('godlygeek/tabular')
  call dein#add('Glench/Vim-Jinja2-Syntax')
  call dein#add('pearofducks/ansible-vim')

  call dein#add('neomake/neomake')

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

" highlight matching pairs
set showmatch

" Try to reuse windows/tabs when switching buffers
set switchbuf=usetab

" faster CursorHold updates
set updatetime=300
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


if has('nvim')
  set inccommand=nosplit
endif

" }}}

" Interface {{{

set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

colorscheme gruvbox
set background=dark

let g:vista_default_executive = 'coc'
let g:airline#extensions#tabline#enabled = 1
let g:tmuxline_powerline_separators = 0

let NERDTreeMinimalUI = 1
let NERDTreeStatusline = 'NERD'

" Auto save all the things
set autowriteall
autocmd FocusLost * silent! wa

" Toggle the cursorline in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

let g:fzf_files_options =
  \ '--preview "bat --number --color always --italic-text always --paging never {}"'

let g:vimade = {}
let g:vimade.enablefocusfading = 1

" keep quotations marks in json files
let g:indentLine_setConceal = 0

" }}}

" Autocompletion {{{

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

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

nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

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

nnoremap <C-t> :Vista!!<CR>
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

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" nnoremap <silent> <space>y  :<C-u>CocList -A yank<cr>

" s for substitute
" nmap s <plug>(SubversiveSubstitute)
" nmap ss <plug>(SubversiveSubstituteLine)
" nmap S <plug>(SubversiveSubstituteToEndOfLine)

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

" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
autocmd BufWritePre *.tf :TerraformFmt

" }}}
