set completeopt=menuone,noinsert,noselect

let g:completion_confirm_key = "\<C-y>"
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_fuzzy_match = 1

let g:diagnostic_enable_virtual_text = 1

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="jl"
let g:UltiSnipsJumpForwardTrigger="jl"
let g:UltiSnipsJumpBackwardTrigger="jh"

call sign_define("LspDiagnosticsErrorSign", {"text" : " ", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "⚡", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "", "texthl" : "LspDiagnosticsWarning"})

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <c-j> <cmd>lua require'source'.prevCompletion()<CR>
imap <c-k> <cmd>lua require'source'.nextCompletion()<CR>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> <cr>    pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"

imap <expr> <C-f>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

