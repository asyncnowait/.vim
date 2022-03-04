set splitbelow
let g:cargo_shell_command_runner = "terminal ++rows=20 ++noclose"

function! CloseLastWindow() abort 
    if winnr() >= 2 
        execute "$q"
        execute "echo"
    endif 
endfunction

nnoremap <Leader>r :Crun<CR>
nnoremap <Leader>q :call CloseLastWindow()<CR>
nnoremap <Leader>t :Ctest -- --nocapture<CR>
nnoremap <Leader>c :Ccheck<CR>
nnoremap <Leader>b :Cbench<CR>
nnoremap gd :ALEGoToDefinition<CR>

let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }
let g:ale_linters = {
  \  'rust': ['analyzer'],
  \}
