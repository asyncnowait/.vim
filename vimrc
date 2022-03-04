" some default setting 
set nocompatible

" indent and tab 
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent


" syntax  and filetype
syntax on
filetype indent plugin on

" line number 
set number
set relativenumber
set numberwidth=5

" row and column
set cul cuc

" highlight search matching
set hls

" set fold method to manual, zf for fold, zo for unfold
set foldmethod=manual


" fix wsl vim start with replace mode
if $TERM =~ 'xterm-256color'
    set noek
endif


" background
set background=dark
colorscheme ferris
