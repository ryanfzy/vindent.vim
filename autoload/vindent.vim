y

" check if it is already loaded
if exists("g:loaded_vindent")
    finish
endif
let g:loaded_vindent = 1

" save current vim settings
let s:save_cpo = &cpo
" reset vim settings
set cpo&vim

" restore vim settings
function! s:Restore_cpo()
    let &cpo = s:save_cpo
    unlet s:save_cpo
endfunction

""""""""""""""""""""""""""""""""""""""""
" start of plugin body
""""""""""""""""""""""""""""""""""""""""

function vindent#Run()
    highlight vindentColor guibg=LightRed
    highlight vindentColorOne guibg=white

    autocmd Syntax * syntax match vindentColorOne /^./
    autocmd Syntax * syntax match vindentColor /\(^\s\{4}\)\@<=\s/
    autocmd Syntax * syntax match vindentColor /\(^\s\{8}\)\@<=\s/
    autocmd Syntax * syntax match vindentColor /\(^\s\{12}\)\@<=\s/
    autocmd Syntax * syntax match vindentColor /\(^\s\{16}\)\@<=\s/
    autocmd Syntax * syntax match vindentColor /\(^\s\{20}\)\@<=\s/

    "let indentLevel = str2nr(s:dictOptions['indentLevel'])
    "for i in range(1, indentLevel)
        "let syn = 'syntax match vindentColor /\(^\s\{'.i*4.'}\)\@<=\s/'
        "echom syn
        "execute syn
    "endfor
    "execute 'syntax match vindentColor /^\s\{4}\zs\s/'
    "execute 'syntax match vindentColor /^\s*\%5v\zs\s/'

    "for i in range(1, s:gIndentLevel)
        "let syn = 'syntax match vindentColor /\(^\s\+if.*\n\s\{' . i*4 . '}\)\@<=\s/'
        "echom syn
        "execute syn
    "endfor

    " this create two many matches, slows vim
    "for col in range(1, s:gMaxColumns)
        "let syn = 'syntax match vindentColor /\(^\s\{'.col.'}if.*\n\s\{'.col.'}\)\@<=./'
        "echom syn
    "endfor
    "execute 'syntax match vindentColor /\(^\s\+if.*\n\s\{4}\)\@<=\s/'
    "execute 'syntax match vindentColor /\(^\s\+if.*\n\s\{8}\)\@<=\s/'
    "execute 'syntax match vindentColor /\(\(^\s\+if.*\n\s\{4}\)\@<=.*\n\s\{4}\)\@<=./'
endfunction

""""""""""""""""""""""""""""""""""""""""
" end of plugin body
""""""""""""""""""""""""""""""""""""""""

call s:Restore_cpo()
