" Switch between the last two files
" nnoremap <Leader><Leader> <C-^>

nnoremap <Leader>q :Bd<CR>

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

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" nmap <Leader>f :GFiles -o<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>F :GFiles<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>r :History:<CR>

imap jk <Esc>

" Neosnippet: {{{

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <expr><TAB> pumvisible()
"   \ ? "\<C-n>"
"   \ : neosnippet#expandable_or_jumpable()
"   \   ? "\<Plug>(neosnippet_expand_or_jump)"
"   \   : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable()
"   \ ? "\<Plug>(neosnippet_expand_or_jump)"
"   \ : "\<TAB>"

" }}}

" CoC: {{{

" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB> pumvisible()
  \ ? "\<C-n>"
  \ : <SID>check_back_space()
  \   ? "\<TAB>"
  \   :  coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <Tab> and <S-Tab> for navigate completion list
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <Enter> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" vmap <leader>f <Plug>(coc-format-selected)
" nmap <leader>f <Plug>(coc-format-selected)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" }}}
