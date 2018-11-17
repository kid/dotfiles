" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

nnoremap <Leader>q :q<CR>


" Copy til end if one, like C and D
nnoremap Y y$

" System copy paste
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" Ctrl-Tab for cycling through buffers
nnoremap <M-Tab> :bnext<CR>

map <C-n> :NERDTreeToggle<CR>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" nmap <Leader>f :GFiles -o<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>r :History:<CR>

imap jk <Esc>


imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr>    pumvisible() ? deoplete#close_popup() : "\<cr>"
