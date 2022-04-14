set splitbelow

function! CloseLastWindow() abort 
    if winnr() >= 2 
        execute "$q"
        execute "echo"
    endif 
endfunction


nnoremap <Leader>r :term go run %<CR>
nnoremap <Leader>q :call CloseLastWindow()<CR>
nnoremap \d :ALEGoToDefinition<CR>
nnoremap \h :ALEHover<CR>

