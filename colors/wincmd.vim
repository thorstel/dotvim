" ======================================================================
" File:        wincmd.vim
" Author:      thorstel
" Created:     2018-07-22
" License:     MIT License
" Description: Colorscheme based on the default colors of the Windows
"              command prompt.
" ======================================================================
"
" The following palette is used for the colorscheme. With the option
" g:wincmd_use_legacy_colors the legacy colors will be used instead of
" the new defaults (since 2017).
"
" +--------------+---------------+--------------+
" | Color Name   | Legacy Values | New Defaults |
" +--------------+---------------+--------------+
" | Black        | 000000        | 0C0C0C       |
" | DarkBlue     | 0000C0        | 0037DA       |
" | DarkGreen    | 008000        | 13A10E       |
" | DarkCyan     | 008080        | 3A96DD       |
" | DarkRed      | 800000        | C50F1F       |
" | DarkMagenta  | 800080        | 881798       |
" | DarkYellow   | 808000        | C19C00       |
" | LightGray    | C0C0C0        | CCCCCC       |
" | DarkGray     | 808080        | 767676       |
" | LightBlue    | 0000FF        | 3878FF       |
" | LightGreen   | 00FF00        | 16C60C       |
" | LightCyan    | 00FFFF        | 61D6D6       |
" | LightRed     | FF0000        | E74856       |
" | LightMagenta | FF00FF        | B4009E       |
" | LightYellow  | FFFF00        | F9F1A5       |
" | White        | FFFFFF        | F1F1F1       |
" +--------------+---------------+--------------+

set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "wincmd"

if exists("g:wincmd_use_legacy_colors") && g:wincmd_use_legacy_colors
    hi Normal       cterm=none ctermfg=LightGray    gui=none guifg=#C0C0C0 ctermbg=Black      guibg=#000000
    hi Cursor       cterm=bold ctermfg=Black        gui=bold guifg=#000000 ctermbg=LightGreen guibg=#00FF00
    hi Visual       cterm=none ctermfg=Black        gui=none guifg=#000000 ctermbg=LightGray  guibg=#C0C0C0
    hi Search       cterm=none ctermfg=Black        gui=none guifg=#000000 ctermbg=Yellow     guibg=#FFFF00
    hi LineNr       cterm=none ctermfg=DarkYellow   gui=none guifg=#808000
    hi CursorLineNr cterm=none ctermfg=Yellow       gui=bold guifg=#FFFF00
    hi Folded       cterm=none ctermfg=White        gui=none guifg=#FFFFFF ctermbg=DarkGrey   guibg=#808080
    hi FoldColumn   cterm=none ctermfg=White        gui=none guifg=#FFFFFF ctermbg=DarkGrey   guibg=#808080
    hi Error        cterm=none ctermfg=White        gui=bold guifg=#FFFFFF ctermbg=LightRed   guibg=#FF0000
    hi Todo         cterm=none ctermfg=LightRed     gui=bold guifg=#FF0000 ctermbg=Yellow     guibg=#FFFF00
    hi NonText      cterm=none ctermfg=DarkBlue     gui=none guifg=#0000C0
    hi SpecialKey   cterm=none ctermfg=DarkBlue     gui=none guifg=#0000C0

    hi DiffAdd      cterm=none ctermfg=White        gui=none guifg=#FFFFFF ctermbg=DarkGreen  guibg=#008000
    hi DiffDelete   cterm=none ctermfg=Black        gui=none guifg=#000000 ctermbg=DarkRed    guibg=#800000
    hi DiffChange   cterm=none ctermfg=Black        gui=none guifg=#000000 ctermbg=LightGray  guibg=#C0C0C0
    hi DiffText     cterm=none ctermfg=Black        gui=none guifg=#000000 ctermbg=DarkYellow guibg=#808000

    hi Pmenu        cterm=none ctermfg=White        gui=none guifg=#FFFFFF ctermbg=DarkGray   guibg=#808080
    hi PmenuSel     cterm=none ctermfg=Yellow       gui=none guifg=#FFFF00 ctermbg=Black      guibg=#000000
    hi PmenuSBar    cterm=none                                             ctermbg=LightGray  guibg=#C0C0C0
    hi PmenuThumb   cterm=none                                             ctermbg=Black      guibg=#000000

    hi Comment      cterm=none ctermfg=DarkGray     gui=none guifg=#808080
    hi Statement    cterm=none ctermfg=Yellow       gui=none guifg=#FFFF00
    hi Constant     cterm=none ctermfg=LightMagenta gui=none guifg=#FF00FF
    hi Identifier   cterm=none ctermfg=LightCyan    gui=none guifg=#00FFFF
    hi Type         cterm=none ctermfg=LightGreen   gui=none guifg=#00FF00
    hi Special      cterm=none ctermfg=LightRed     gui=none guifg=#FF0000
    hi PreProc      cterm=none ctermfg=DarkCyan     gui=none guifg=#008080
else
    hi Normal       cterm=none ctermfg=LightGray    gui=none guifg=#CCCCCC ctermbg=Black      guibg=#0C0C0C
    hi Cursor       cterm=bold ctermfg=Black        gui=bold guifg=#0C0C0C ctermbg=LightGreen guibg=#16C60C
    hi Visual       cterm=none ctermfg=Black        gui=none guifg=#0C0C0C ctermbg=LightGray  guibg=#CCCCCC
    hi Search       cterm=none ctermfg=Black        gui=none guifg=#0C0C0C ctermbg=Yellow     guibg=#F9F1A5
    hi LineNr       cterm=none ctermfg=DarkYellow   gui=none guifg=#C19C00
    hi CursorLineNr cterm=none ctermfg=Yellow       gui=bold guifg=#F9F1A5
    hi Folded       cterm=none ctermfg=White        gui=none guifg=#F1F1F1 ctermbg=DarkGrey   guibg=#767676
    hi FoldColumn   cterm=none ctermfg=White        gui=none guifg=#F1F1F1 ctermbg=DarkGrey   guibg=#767676
    hi Error        cterm=none ctermfg=White        gui=bold guifg=#F1F1F1 ctermbg=LightRed   guibg=#E74856
    hi Todo         cterm=none ctermfg=LightRed     gui=bold guifg=#E74856 ctermbg=Yellow     guibg=#F9F1A5
    hi NonText      cterm=none ctermfg=DarkBlue     gui=none guifg=#0037DA
    hi SpecialKey   cterm=none ctermfg=DarkBlue     gui=none guifg=#0037DA

    hi DiffAdd      cterm=none ctermfg=White        gui=none guifg=#F1F1F1 ctermbg=DarkGreen  guibg=#13A10E
    hi DiffDelete   cterm=none ctermfg=Black        gui=none guifg=#0C0C0C ctermbg=DarkRed    guibg=#C50F1F
    hi DiffChange   cterm=none ctermfg=Black        gui=none guifg=#0C0C0C ctermbg=LightGray  guibg=#CCCCCC
    hi DiffText     cterm=none ctermfg=Black        gui=none guifg=#0C0C0C ctermbg=DarkYellow guibg=#C19C00

    hi Pmenu        cterm=none ctermfg=White        gui=none guifg=#F1F1F1 ctermbg=DarkGray   guibg=#767676
    hi PmenuSel     cterm=none ctermfg=Yellow       gui=none guifg=#F9F1A5 ctermbg=Black      guibg=#0C0C0C
    hi PmenuSBar    cterm=none                                             ctermbg=LightGray  guibg=#CCCCCC
    hi PmenuThumb   cterm=none                                             ctermbg=Black      guibg=#0C0C0C

    hi Comment      cterm=none ctermfg=DarkGray     gui=none guifg=#767676
    hi Statement    cterm=none ctermfg=Yellow       gui=none guifg=#F9F1A5
    hi Constant     cterm=none ctermfg=LightMagenta gui=none guifg=#B4009E
    hi Identifier   cterm=none ctermfg=LightCyan    gui=none guifg=#61D6D6
    hi Type         cterm=none ctermfg=LightGreen   gui=none guifg=#16C60C
    hi Special      cterm=none ctermfg=LightRed     gui=none guifg=#E74856
    hi PreProc      cterm=none ctermfg=DarkCyan     gui=none guifg=#3A96DD
endif

hi link Function         Identifier

hi link Include          PreProc
hi link Define           PreProc
hi link Macro            PreProc
hi link PreCondit        PreProc

hi link Tag              Special
hi link SpecialChar      Special
hi link Delimiter        Special
hi link SpecialComment   Special
hi link Debug            Special

hi link Conditional      Statement
hi link Repeat           Statement
hi link Label            Statement
hi link Operator         Statement
hi link Keyword          Statement
hi link Exception        Statement

hi link StorageClass     Type
hi link Structure        Type
hi link Typedef          Type

hi link cStatement       Statement
hi link cLabel           Label
hi link cOperator        Operator
hi link cRepeat          Repeat
hi link cTodo            Todo
hi link cBadContinuation Error
hi link cSpecial         SpecialChar
hi link cFormat          cSpecial
hi link cString          String

