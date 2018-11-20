let g:LanguageClient_serverCommands = {
  \ 'go': ['go-langserver'],
  \ 'ruby': ['solargraph', 'stdio'],
  \ 'rust': ['rls'],
  \ }

" autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
