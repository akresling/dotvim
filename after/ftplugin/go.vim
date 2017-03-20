function! IsLineEmpty(line) 
    if match(a:line, '^\s*$') != -1
        return 1
    endif
endfu

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || IsLineEmpty(getline('.'))
        return "\<tab>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


set completeopt=menu

filetype plugin on

