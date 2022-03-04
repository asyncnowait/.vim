" -----------------------------------------------------------------------------
" File: ferris.vim
" Description: ferris vim color scheme 
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='ferris'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:ferris_bold')
  let g:ferris_bold=1
endif
if !exists('g:ferris_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:ferris_italic=1
  else
    let g:ferris_italic=0
  endif
endif
if !exists('g:ferris_undercurl')
  let g:ferris_undercurl=1
endif
if !exists('g:ferris_underline')
  let g:ferris_underline=1
endif
if !exists('g:ferris_inverse')
  let g:ferris_inverse=1
endif

if !exists('g:ferris_guisp_fallback') || index(['fg', 'bg'], g:ferris_guisp_fallback) == -1
  let g:ferris_guisp_fallback='NONE'
endif

if !exists('g:ferris_improved_strings')
  let g:ferris_improved_strings=0
endif

if !exists('g:ferris_improved_warnings')
  let g:ferris_improved_warnings=0
endif

if !exists('g:ferris_termcolors')
  let g:ferris_termcolors=256
endif

if !exists('g:ferris_invert_indent_guides')
  let g:ferris_invert_indent_guides=0
endif

if exists('g:ferris_contrast')
  echo 'g:ferris_contrast is deprecated; use g:ferris_contrast_light and g:ferris_contrast_dark instead'
endif

if !exists('g:ferris_contrast_dark')
  let g:ferris_contrast_dark='medium'
endif

if !exists('g:ferris_contrast_light')
  let g:ferris_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]     " 29-32-33
let s:gb.dark0       = ['#282828', 235]     " 40-40-40
let s:gb.dark0_soft  = ['#32302f', 236]     " 50-48-47
let s:gb.dark1       = ['#3c3836', 237]     " 60-56-54
let s:gb.dark2       = ['#504945', 239]     " 80-73-69
let s:gb.dark3       = ['#665c54', 241]     " 102-92-84
let s:gb.dark4       = ['#7c6f64', 243]     " 124-111-100
let s:gb.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:gb.gray_245    = ['#928374', 245]     " 146-131-116
let s:gb.gray_244    = ['#928374', 244]     " 146-131-116

let s:gb.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:gb.light0      = ['#fbf1c7', 229]     " 253-244-193
let s:gb.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:gb.light1      = ['#ebdbb2', 223]     " 235-219-178
let s:gb.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:gb.light3      = ['#bdae93', 248]     " 189-174-147
let s:gb.light4      = ['#a89984', 246]     " 168-153-132
let s:gb.light4_256  = ['#a89984', 246]     " 168-153-132

let s:gb.bright_red     = ['#fb4934', 167]     " 251-73-52
let s:gb.bright_green   = ['#b8bb26', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gb.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:gb.bright_purple  = ['#d3869b', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#8ec07c', 108]     " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:gb.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:ferris_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:ferris_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:ferris_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:ferris_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:ferris_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:ferris_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:ferris_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:ferris_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:ferris_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:ferris_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif


" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:ferris_hls_cursor')
  let s:hls_cursor = get(s:gb, g:ferris_hls_cursor)
endif

let s:number_column = s:none
if exists('g:ferris_number_column')
  let s:number_column = get(s:gb, g:ferris_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:ferris_sign_column')
    let s:sign_column = get(s:gb, g:ferris_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:ferris_color_column')
  let s:color_column = get(s:gb, g:ferris_color_column)
endif

let s:vert_split = s:bg0
if exists('g:ferris_vert_split')
  let s:vert_split = get(s:gb, g:ferris_vert_split)
endif

let s:invert_signs = ''
if exists('g:ferris_invert_signs')
  if g:ferris_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:ferris_invert_selection')
  if g:ferris_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:ferris_invert_tabline')
  if g:ferris_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:ferris_italicize_comments')
  if g:ferris_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:ferris_italicize_strings')
  if g:ferris_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:ferris_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:ferris_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Ferris Hi Groups: {{{

" memoize common hi groups
call s:HL('FerrisFg0', s:fg0)
call s:HL('FerrisFg1', s:fg1)
call s:HL('FerrisFg2', s:fg2)
call s:HL('FerrisFg3', s:fg3)
call s:HL('FerrisFg4', s:fg4)
call s:HL('FerrisGray', s:gray)
call s:HL('FerrisBg0', s:bg0)
call s:HL('FerrisBg1', s:bg1)
call s:HL('FerrisBg2', s:bg2)
call s:HL('FerrisBg3', s:bg3)
call s:HL('FerrisBg4', s:bg4)

call s:HL('FerrisRed', s:red)
call s:HL('FerrisRedBold', s:red, s:none, s:bold)
call s:HL('FerrisGreen', s:green)
call s:HL('FerrisGreenBold', s:green, s:none, s:bold)
call s:HL('FerrisYellow', s:yellow)
call s:HL('FerrisYellowBold', s:yellow, s:none, s:bold)
call s:HL('FerrisBlue', s:blue)
call s:HL('FerrisBlueBold', s:blue, s:none, s:bold)
call s:HL('FerrisPurple', s:purple)
call s:HL('FerrisPurpleBold', s:purple, s:none, s:bold)
call s:HL('FerrisAqua', s:aqua)
call s:HL('FerrisAquaBold', s:aqua, s:none, s:bold)
call s:HL('FerrisOrange', s:orange)
call s:HL('FerrisOrangeBold', s:orange, s:none, s:bold)

call s:HL('FerrisRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('FerrisGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('FerrisYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('FerrisBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('FerrisPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('FerrisAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('FerrisOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText FerrisBg2
hi! link SpecialKey FerrisBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory FerrisGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title FerrisGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg FerrisYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg FerrisYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question FerrisOrangeBold
" Warning messages
hi! link WarningMsg FerrisRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:ferris_improved_strings == 0
  hi! link Special FerrisOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement FerrisRed
" if, then, else, endif, swicth, etc.
hi! link Conditional FerrisRed
" for, do, while, etc.
hi! link Repeat FerrisRed
" case, default, etc.
hi! link Label FerrisRed
" try, catch, throw
hi! link Exception FerrisRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword FerrisRed

" Variable name
hi! link Identifier FerrisBlue
" Function name
hi! link Function FerrisGreenBold

" Generic preprocessor
hi! link PreProc FerrisAqua
" Preprocessor #include
hi! link Include FerrisAqua
" Preprocessor #define
hi! link Define FerrisAqua
" Same as Define
hi! link Macro FerrisAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit FerrisAqua

" Generic constant
hi! link Constant FerrisPurple
" Character constant: 'c', '/n'
hi! link Character FerrisPurple
" String constant: "this is a string"
if g:ferris_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean FerrisPurple
" Number constant: 234, 0xff
hi! link Number FerrisPurple
" Floating point constant: 2.3e10
hi! link Float FerrisPurple

" Generic type
hi! link Type FerrisYellow
" static, register, volatile, etc
hi! link StorageClass FerrisOrange
" struct, union, enum, etc.
hi! link Structure FerrisAqua
" typedef
hi! link Typedef FerrisYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:ferris_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:ferris_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd FerrisGreenSign
hi! link GitGutterChange FerrisAquaSign
hi! link GitGutterDelete FerrisRedSign
hi! link GitGutterChangeDelete FerrisAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile FerrisGreen
hi! link gitcommitDiscardedFile FerrisRed

" }}}
" Signify: {{{

hi! link SignifySignAdd FerrisGreenSign
hi! link SignifySignChange FerrisAquaSign
hi! link SignifySignDelete FerrisRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign FerrisRedSign
hi! link SyntasticWarningSign FerrisYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   FerrisBlueSign
hi! link SignatureMarkerText FerrisPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl FerrisBlueSign
hi! link ShowMarksHLu FerrisBlueSign
hi! link ShowMarksHLo FerrisBlueSign
hi! link ShowMarksHLm FerrisBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch FerrisYellow
hi! link CtrlPNoEntries FerrisRed
hi! link CtrlPPrtBase FerrisBg2
hi! link CtrlPPrtCursor FerrisBlue
hi! link CtrlPLinePre FerrisBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket FerrisFg3
hi! link StartifyFile FerrisFg1
hi! link StartifyNumber FerrisBlue
hi! link StartifyPath FerrisGray
hi! link StartifySlash FerrisGray
hi! link StartifySection FerrisYellow
hi! link StartifySpecial FerrisBg2
hi! link StartifyHeader FerrisOrange
hi! link StartifyFooter FerrisBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign FerrisRedSign
hi! link ALEWarningSign FerrisYellowSign
hi! link ALEInfoSign FerrisBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail FerrisAqua
hi! link DirvishArg FerrisYellow

" }}}
" Netrw: {{{

hi! link netrwDir FerrisAqua
hi! link netrwClassify FerrisAqua
hi! link netrwLink FerrisGray
hi! link netrwSymLink FerrisFg1
hi! link netrwExe FerrisYellow
hi! link netrwComment FerrisGray
hi! link netrwList FerrisBlue
hi! link netrwHelpCmd FerrisAqua
hi! link netrwCmdSep FerrisFg3
hi! link netrwVersion FerrisGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir FerrisAqua
hi! link NERDTreeDirSlash FerrisAqua

hi! link NERDTreeOpenable FerrisOrange
hi! link NERDTreeClosable FerrisOrange

hi! link NERDTreeFile FerrisFg1
hi! link NERDTreeExecFile FerrisYellow

hi! link NERDTreeUp FerrisGray
hi! link NERDTreeCWD FerrisGreen
hi! link NERDTreeHelp FerrisFg1

hi! link NERDTreeToggleOn FerrisGreen
hi! link NERDTreeToggleOff FerrisRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign FerrisRedSign
hi! link CocWarningSign FerrisOrangeSign
hi! link CocInfoSign FerrisYellowSign
hi! link CocHintSign FerrisBlueSign
hi! link CocErrorFloat FerrisRed
hi! link CocWarningFloat FerrisOrange
hi! link CocInfoFloat FerrisYellow
hi! link CocHintFloat FerrisBlue
hi! link CocDiagnosticsError FerrisRed
hi! link CocDiagnosticsWarning FerrisOrange
hi! link CocDiagnosticsInfo FerrisYellow
hi! link CocDiagnosticsHint FerrisBlue

hi! link CocSelectedText FerrisRed
hi! link CocCodeLens FerrisGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded FerrisGreen
hi! link diffRemoved FerrisRed
hi! link diffChanged FerrisAqua

hi! link diffFile FerrisOrange
hi! link diffNewFile FerrisYellow

hi! link diffLine FerrisBlue

" }}}
" Html: {{{

hi! link htmlTag FerrisBlue
hi! link htmlEndTag FerrisBlue

hi! link htmlTagName FerrisAquaBold
hi! link htmlArg FerrisAqua

hi! link htmlScriptTag FerrisPurple
hi! link htmlTagN FerrisFg1
hi! link htmlSpecialTagName FerrisAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar FerrisOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag FerrisBlue
hi! link xmlEndTag FerrisBlue
hi! link xmlTagName FerrisBlue
hi! link xmlEqual FerrisBlue
hi! link docbkKeyword FerrisAquaBold

hi! link xmlDocTypeDecl FerrisGray
hi! link xmlDocTypeKeyword FerrisPurple
hi! link xmlCdataStart FerrisGray
hi! link xmlCdataCdata FerrisPurple
hi! link dtdFunction FerrisGray
hi! link dtdTagName FerrisPurple

hi! link xmlAttrib FerrisAqua
hi! link xmlProcessingDelim FerrisGray
hi! link dtdParamEntityPunct FerrisGray
hi! link dtdParamEntityDPunct FerrisGray
hi! link xmlAttribPunct FerrisGray

hi! link xmlEntity FerrisOrange
hi! link xmlEntityPunct FerrisOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation FerrisOrange
hi! link vimBracket FerrisOrange
hi! link vimMapModKey FerrisOrange
hi! link vimFuncSID FerrisFg3
hi! link vimSetSep FerrisFg3
hi! link vimSep FerrisFg3
hi! link vimContinue FerrisFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword FerrisBlue
hi! link clojureCond FerrisOrange
hi! link clojureSpecial FerrisOrange
hi! link clojureDefine FerrisOrange

hi! link clojureFunc FerrisYellow
hi! link clojureRepeat FerrisYellow
hi! link clojureCharacter FerrisAqua
hi! link clojureStringEscape FerrisAqua
hi! link clojureException FerrisRed

hi! link clojureRegexp FerrisAqua
hi! link clojureRegexpEscape FerrisAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen FerrisFg3
hi! link clojureAnonArg FerrisYellow
hi! link clojureVariable FerrisBlue
hi! link clojureMacro FerrisOrange

hi! link clojureMeta FerrisYellow
hi! link clojureDeref FerrisYellow
hi! link clojureQuote FerrisYellow
hi! link clojureUnquote FerrisYellow

" }}}
" C: {{{

hi! link cOperator FerrisPurple
hi! link cStructure FerrisOrange

" }}}
" Python: {{{

hi! link pythonBuiltin FerrisOrange
hi! link pythonBuiltinObj FerrisOrange
hi! link pythonBuiltinFunc FerrisOrange
hi! link pythonFunction FerrisAqua
hi! link pythonDecorator FerrisRed
hi! link pythonInclude FerrisBlue
hi! link pythonImport FerrisBlue
hi! link pythonRun FerrisBlue
hi! link pythonCoding FerrisBlue
hi! link pythonOperator FerrisRed
hi! link pythonException FerrisRed
hi! link pythonExceptions FerrisPurple
hi! link pythonBoolean FerrisPurple
hi! link pythonDot FerrisFg3
hi! link pythonConditional FerrisRed
hi! link pythonRepeat FerrisRed
hi! link pythonDottedName FerrisGreenBold

" }}}
" CSS: {{{

hi! link cssBraces FerrisBlue
hi! link cssFunctionName FerrisYellow
hi! link cssIdentifier FerrisOrange
hi! link cssClassName FerrisGreen
hi! link cssColor FerrisBlue
hi! link cssSelectorOp FerrisBlue
hi! link cssSelectorOp2 FerrisBlue
hi! link cssImportant FerrisGreen
hi! link cssVendor FerrisFg1

hi! link cssTextProp FerrisAqua
hi! link cssAnimationProp FerrisAqua
hi! link cssUIProp FerrisYellow
hi! link cssTransformProp FerrisAqua
hi! link cssTransitionProp FerrisAqua
hi! link cssPrintProp FerrisAqua
hi! link cssPositioningProp FerrisYellow
hi! link cssBoxProp FerrisAqua
hi! link cssFontDescriptorProp FerrisAqua
hi! link cssFlexibleBoxProp FerrisAqua
hi! link cssBorderOutlineProp FerrisAqua
hi! link cssBackgroundProp FerrisAqua
hi! link cssMarginProp FerrisAqua
hi! link cssListProp FerrisAqua
hi! link cssTableProp FerrisAqua
hi! link cssFontProp FerrisAqua
hi! link cssPaddingProp FerrisAqua
hi! link cssDimensionProp FerrisAqua
hi! link cssRenderProp FerrisAqua
hi! link cssColorProp FerrisAqua
hi! link cssGeneratedContentProp FerrisAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces FerrisFg1
hi! link javaScriptFunction FerrisAqua
hi! link javaScriptIdentifier FerrisRed
hi! link javaScriptMember FerrisBlue
hi! link javaScriptNumber FerrisPurple
hi! link javaScriptNull FerrisPurple
hi! link javaScriptParens FerrisFg3

" }}}
" YAJS: {{{

hi! link javascriptImport FerrisAqua
hi! link javascriptExport FerrisAqua
hi! link javascriptClassKeyword FerrisAqua
hi! link javascriptClassExtends FerrisAqua
hi! link javascriptDefault FerrisAqua

hi! link javascriptClassName FerrisYellow
hi! link javascriptClassSuperName FerrisYellow
hi! link javascriptGlobal FerrisYellow

hi! link javascriptEndColons FerrisFg1
hi! link javascriptFuncArg FerrisFg1
hi! link javascriptGlobalMethod FerrisFg1
hi! link javascriptNodeGlobal FerrisFg1
hi! link javascriptBOMWindowProp FerrisFg1
hi! link javascriptArrayMethod FerrisFg1
hi! link javascriptArrayStaticMethod FerrisFg1
hi! link javascriptCacheMethod FerrisFg1
hi! link javascriptDateMethod FerrisFg1
hi! link javascriptMathStaticMethod FerrisFg1

" hi! link javascriptProp FerrisFg1
hi! link javascriptURLUtilsProp FerrisFg1
hi! link javascriptBOMNavigatorProp FerrisFg1
hi! link javascriptDOMDocMethod FerrisFg1
hi! link javascriptDOMDocProp FerrisFg1
hi! link javascriptBOMLocationMethod FerrisFg1
hi! link javascriptBOMWindowMethod FerrisFg1
hi! link javascriptStringMethod FerrisFg1

hi! link javascriptVariable FerrisOrange
" hi! link javascriptVariable FerrisRed
" hi! link javascriptIdentifier FerrisOrange
" hi! link javascriptClassSuper FerrisOrange
hi! link javascriptIdentifier FerrisOrange
hi! link javascriptClassSuper FerrisOrange

" hi! link javascriptFuncKeyword FerrisOrange
" hi! link javascriptAsyncFunc FerrisOrange
hi! link javascriptFuncKeyword FerrisAqua
hi! link javascriptAsyncFunc FerrisAqua
hi! link javascriptClassStatic FerrisOrange

hi! link javascriptOperator FerrisRed
hi! link javascriptForOperator FerrisRed
hi! link javascriptYield FerrisRed
hi! link javascriptExceptions FerrisRed
hi! link javascriptMessage FerrisRed

hi! link javascriptTemplateSB FerrisAqua
hi! link javascriptTemplateSubstitution FerrisFg1

" hi! link javascriptLabel FerrisBlue
" hi! link javascriptObjectLabel FerrisBlue
" hi! link javascriptPropertyName FerrisBlue
hi! link javascriptLabel FerrisFg1
hi! link javascriptObjectLabel FerrisFg1
hi! link javascriptPropertyName FerrisFg1

hi! link javascriptLogicSymbols FerrisFg1
hi! link javascriptArrowFunc FerrisYellow

hi! link javascriptDocParamName FerrisFg4
hi! link javascriptDocTags FerrisFg4
hi! link javascriptDocNotation FerrisFg4
hi! link javascriptDocParamType FerrisFg4
hi! link javascriptDocNamedParamType FerrisFg4

hi! link javascriptBrackets FerrisFg1
hi! link javascriptDOMElemAttrs FerrisFg1
hi! link javascriptDOMEventMethod FerrisFg1
hi! link javascriptDOMNodeMethod FerrisFg1
hi! link javascriptDOMStorageMethod FerrisFg1
hi! link javascriptHeadersMethod FerrisFg1

hi! link javascriptAsyncFuncKeyword FerrisRed
hi! link javascriptAwaitFuncKeyword FerrisRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword FerrisAqua
hi! link jsExtendsKeyword FerrisAqua
hi! link jsExportDefault FerrisAqua
hi! link jsTemplateBraces FerrisAqua
hi! link jsGlobalNodeObjects FerrisFg1
hi! link jsGlobalObjects FerrisFg1
hi! link jsFunction FerrisAqua
hi! link jsFuncParens FerrisFg3
hi! link jsParens FerrisFg3
hi! link jsNull FerrisPurple
hi! link jsUndefined FerrisPurple
hi! link jsClassDefinition FerrisYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved FerrisAqua
hi! link typeScriptLabel FerrisAqua
hi! link typeScriptFuncKeyword FerrisAqua
hi! link typeScriptIdentifier FerrisOrange
hi! link typeScriptBraces FerrisFg1
hi! link typeScriptEndColons FerrisFg1
hi! link typeScriptDOMObjects FerrisFg1
hi! link typeScriptAjaxMethods FerrisFg1
hi! link typeScriptLogicSymbols FerrisFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects FerrisFg1
hi! link typeScriptParens FerrisFg3
hi! link typeScriptOpSymbols FerrisFg3
hi! link typeScriptHtmlElemProperties FerrisFg1
hi! link typeScriptNull FerrisPurple
hi! link typeScriptInterpolationDelimiter FerrisAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword FerrisAqua
hi! link purescriptModuleName FerrisFg1
hi! link purescriptWhere FerrisAqua
hi! link purescriptDelimiter FerrisFg4
hi! link purescriptType FerrisFg1
hi! link purescriptImportKeyword FerrisAqua
hi! link purescriptHidingKeyword FerrisAqua
hi! link purescriptAsKeyword FerrisAqua
hi! link purescriptStructure FerrisAqua
hi! link purescriptOperator FerrisBlue

hi! link purescriptTypeVar FerrisFg1
hi! link purescriptConstructor FerrisFg1
hi! link purescriptFunction FerrisFg1
hi! link purescriptConditional FerrisOrange
hi! link purescriptBacktick FerrisOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp FerrisFg3
hi! link coffeeSpecialOp FerrisFg3
hi! link coffeeCurly FerrisOrange
hi! link coffeeParen FerrisFg3
hi! link coffeeBracket FerrisOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter FerrisGreen
hi! link rubyInterpolationDelimiter FerrisAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier FerrisRed
hi! link objcDirective FerrisBlue

" }}}
" Go: {{{

hi! link goDirective FerrisAqua
hi! link goConstants FerrisPurple
hi! link goDeclaration FerrisRed
hi! link goDeclType FerrisBlue
hi! link goBuiltins FerrisOrange

" }}}
" Lua: {{{

hi! link luaIn FerrisRed
hi! link luaFunction FerrisAqua
hi! link luaTable FerrisOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp FerrisFg3
hi! link moonExtendedOp FerrisFg3
hi! link moonFunction FerrisFg3
hi! link moonObject FerrisYellow

" }}}
" Java: {{{

hi! link javaAnnotation FerrisBlue
hi! link javaDocTags FerrisAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen FerrisFg3
hi! link javaParen1 FerrisFg3
hi! link javaParen2 FerrisFg3
hi! link javaParen3 FerrisFg3
hi! link javaParen4 FerrisFg3
hi! link javaParen5 FerrisFg3
hi! link javaOperator FerrisOrange

hi! link javaVarArg FerrisGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter FerrisGreen
hi! link elixirInterpolationDelimiter FerrisAqua

hi! link elixirModuleDeclaration FerrisYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition FerrisFg1
hi! link scalaCaseFollowing FerrisFg1
hi! link scalaCapitalWord FerrisFg1
hi! link scalaTypeExtension FerrisFg1

hi! link scalaKeyword FerrisRed
hi! link scalaKeywordModifier FerrisRed

hi! link scalaSpecial FerrisAqua
hi! link scalaOperator FerrisFg1

hi! link scalaTypeDeclaration FerrisYellow
hi! link scalaTypeTypePostDeclaration FerrisYellow

hi! link scalaInstanceDeclaration FerrisFg1
hi! link scalaInterpolation FerrisAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 FerrisGreenBold
hi! link markdownH2 FerrisGreenBold
hi! link markdownH3 FerrisYellowBold
hi! link markdownH4 FerrisYellowBold
hi! link markdownH5 FerrisYellow
hi! link markdownH6 FerrisYellow

hi! link markdownCode FerrisAqua
hi! link markdownCodeBlock FerrisAqua
hi! link markdownCodeDelimiter FerrisAqua

hi! link markdownBlockquote FerrisGray
hi! link markdownListMarker FerrisGray
hi! link markdownOrderedListMarker FerrisGray
hi! link markdownRule FerrisGray
hi! link markdownHeadingRule FerrisGray

hi! link markdownUrlDelimiter FerrisFg3
hi! link markdownLinkDelimiter FerrisFg3
hi! link markdownLinkTextDelimiter FerrisFg3

hi! link markdownHeadingDelimiter FerrisOrange
hi! link markdownUrl FerrisPurple
hi! link markdownUrlTitleDelimiter FerrisGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType FerrisYellow
" hi! link haskellOperators FerrisOrange
" hi! link haskellConditional FerrisAqua
" hi! link haskellLet FerrisOrange
"
hi! link haskellType FerrisFg1
hi! link haskellIdentifier FerrisFg1
hi! link haskellSeparator FerrisFg1
hi! link haskellDelimiter FerrisFg4
hi! link haskellOperators FerrisBlue
"
hi! link haskellBacktick FerrisOrange
hi! link haskellStatement FerrisOrange
hi! link haskellConditional FerrisOrange

hi! link haskellLet FerrisAqua
hi! link haskellDefault FerrisAqua
hi! link haskellWhere FerrisAqua
hi! link haskellBottom FerrisAqua
hi! link haskellBlockKeywords FerrisAqua
hi! link haskellImportKeywords FerrisAqua
hi! link haskellDeclKeyword FerrisAqua
hi! link haskellDeriving FerrisAqua
hi! link haskellAssocType FerrisAqua

hi! link haskellNumber FerrisPurple
hi! link haskellPragma FerrisPurple

hi! link haskellString FerrisGreen
hi! link haskellChar FerrisGreen

" }}}
" Json: {{{

hi! link jsonKeyword FerrisGreen
hi! link jsonQuote FerrisGreen
hi! link jsonBraces FerrisFg1
hi! link jsonString FerrisFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! FerrisHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! FerrisHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
