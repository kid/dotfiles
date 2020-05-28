inoremap jk <Esc>`^

map <Space> <Leader>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR>

let g:which_key_map = {}
let g:which_key_map.c = {
  \ 'name': '+code',
  \ 'f': ["luaeval('vim.lsp.buf.formatting()')", 'format-buffer'],
  \ }
let g:which_key_map.i = {
  \ 'name': '+insert',
  \ 's': ['Snippets', 'snippets'],
  \ }

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

" lsp
nnoremap <silent> gc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> pd    <cmd>lua vim.lsp.buf.peek_definition()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ]d :NextDiagnostic<CR>
nnoremap <silent> [d :PrevDiagnostic<CR>
nnoremap <silent> <leader>do :OpenDiagnostic<CR>
nnoremap <leader>dl <cmd>lua require'diagnostic.util'.show_line_diagnostics()<CR>

" fzf
nmap ,f :Files<CR>
nmap ,h :FZF ~<CR>
nmap ,g :GFiles<CR>
nmap ,m :History<CR>
nmap ,b :Buffer<CR>
nmap ,sn :Snippets<CR>
nmap ,c :Chistory<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nmap ,ss :Rg<space>
nmap ,sc :Rg <c-r>=expand("<cword>")<CR><CR>
nmap ,sl :Rg<UP><CR>

nmap Y y$

nmap ]t gt
nmap [t gT
