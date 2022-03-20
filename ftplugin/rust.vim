set splitbelow
let g:cargo_shell_command_runner = "terminal ++noclose"

function! CloseLastWindow() abort 
    if winnr() >= 2 
        execute "$q"
        execute "echo"
    endif 
endfunction

let g:ale_rust_cargo_use_clippy = 1

nnoremap <Leader>r :Crun<CR>
nnoremap <Leader>q :call CloseLastWindow()<CR>
nnoremap <Leader>t :Ctest -- --nocapture<CR>
nnoremap <Leader>c :Ccheck<CR>
nnoremap <Leader>b :Cbench<CR>
nnoremap \d :ALEGoToDefinition<CR>
nnoremap \h :ALEHover<CR>

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'rust': ['rustfmt'],
\}

inoremap <silent><expr><TAB>
    \ pumvisible() ? "\<C-n>" : "\<TAB>"
