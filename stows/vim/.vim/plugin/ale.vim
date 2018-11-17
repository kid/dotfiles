let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

let g:ale_sign_info = "◉""
let g:ale_sign_error = "◉""
let g:ale_sign_warning = "◉""

let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

highlight ALEInfoSign ctermfg=20 ctermbg=18
highlight ALEErrorSign ctermfg=9 ctermbg=18
highlight ALEWarningSign ctermfg=16 ctermbg=18

highlight ALEInfo cterm=underline ctermfg=none ctermbg=none
highlight ALEError cterm=underline ctermfg=none ctermbg=none
highlight ALEWarning cterm=underline ctermfg=none ctermbg=none
