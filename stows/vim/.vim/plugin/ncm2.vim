" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

autocmd BufEnter * call ncm2#enable_for_buffer()

" au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
" au User Ncm2PopupClose set completeopt=menuone
