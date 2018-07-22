" ----------------------------------------------------------------------
" File:        wincmd.vim
" Description: Colorscheme based on the default colors of the Windows
"              command prompt.
" Author:      thorstel 
" Created:     2018-07-22
" ----------------------------------------------------------------------
"
" The following palette is used for the colorscheme. With the option
" g:wincmd_use_legacy_colors the legacy colors will be used instead of
" the new defaults (since 2017).
"
" +--------------+---------------+--------------+
" | Color Name   | Legacy Values | New Defaults |
" +--------------+---------------+--------------+
" | Black        | 000000        | 0C0C0C       |
" | DarkBlue     | 000080        | 0037DA       |
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
    hi Normal       ctermfg=LightGray    gui=NONE guifg=#C0C0C0 ctermbg=Black     guibg=#000000
    hi Search       ctermfg=Black        gui=NONE guifg=#000000 ctermbg=Yellow    guibg=#FFFF00
    hi NonText      ctermfg=DarkBlue     gui=NONE guifg=#000080
    hi SpecialKey   ctermfg=DarkBlue     gui=NONE guifg=#000080

    hi Pmenu        ctermfg=White        gui=NONE guifg=#FFFFFF ctermbg=DarkGray  guibg=#808080
    hi PmenuSel     ctermfg=Yellow       gui=NONE guifg=#FFFF00 ctermbg=Black     guibg=#000000
    hi PmenuSBar                                                ctermbg=LightGray guibg=#C0C0C0
    hi PmenuThumb                                               ctermbg=White     guibg=#FFFFFF

    hi Folded       ctermfg=White        gui=NONE guifg=#FFFFFF ctermbg=DarkGrey  guibg=#808080
    hi FoldColumn   ctermfg=White        gui=NONE guifg=#FFFFFF ctermbg=DarkGrey  guibg=#808080

    hi Error        ctermfg=White        gui=BOLD guifg=#FFFFFF ctermbg=LightRed  guibg=#FF0000
    hi Todo         ctermfg=LightRed     gui=BOLD guifg=#FF0000 ctermbg=Yellow    guibg=#FFFF00

    hi Comment      ctermfg=DarkGray     gui=NONE guifg=#808080
    hi Statement    ctermfg=Yellow       gui=NONE guifg=#FFFF00
    hi Constant     ctermfg=LightMagenta gui=NONE guifg=#FF00FF
    hi Identifier   ctermfg=LightCyan    gui=NONE guifg=#00FFFF
    hi Type         ctermfg=LightGreen   gui=NONE guifg=#00FF00
    hi Special      ctermfg=LightRed     gui=NONE guifg=#FF0000
    hi PreProc      ctermfg=LightBlue    gui=NONE guifg=#0000FF

    hi LineNr       ctermfg=DarkYellow   gui=NONE guifg=#808000
    hi CursorLineNr ctermfg=Yellow       gui=BOLD guifg=#FFFF00
else
    hi Normal       ctermfg=LightGray    gui=NONE guifg=#CCCCCC ctermbg=Black     guibg=#0C0C0C
    hi Search       ctermfg=Black        gui=NONE guifg=#0C0C0C ctermbg=Yellow    guibg=#F9F1A5
    hi NonText      ctermfg=DarkBlue     gui=NONE guifg=#0037DA
    hi SpecialKey   ctermfg=DarkBlue     gui=NONE guifg=#0037DA

    hi Pmenu        ctermfg=White        gui=NONE guifg=#F1F1F1 ctermbg=DarkGray  guibg=#767676
    hi PmenuSel     ctermfg=Yellow       gui=NONE guifg=#F9F1A5 ctermbg=Black     guibg=#0C0C0C
    hi PmenuSBar                                                ctermbg=LightGray guibg=#CCCCCC
    hi PmenuThumb                                               ctermbg=White     guibg=#F1F1F1

    hi Folded       ctermfg=White        gui=NONE guifg=#F1F1F1 ctermbg=DarkGrey  guibg=#767676
    hi FoldColumn   ctermfg=White        gui=NONE guifg=#F1F1F1 ctermbg=DarkGrey  guibg=#767676

    hi Error        ctermfg=White        gui=BOLD guifg=#F1F1F1 ctermbg=LightRed  guibg=#E74856
    hi Todo         ctermfg=LightRed     gui=BOLD guifg=#E74856 ctermbg=Yellow    guibg=#F9F1A5

    hi Comment      ctermfg=DarkGray     gui=NONE guifg=#767676
    hi Statement    ctermfg=Yellow       gui=NONE guifg=#F9F1A5
    hi Constant     ctermfg=LightMagenta gui=NONE guifg=#B4009E
    hi Identifier   ctermfg=LightCyan    gui=NONE guifg=#61D6D6
    hi Type         ctermfg=LightGreen   gui=NONE guifg=#16C60C
    hi Special      ctermfg=LightRed     gui=NONE guifg=#E74856
    hi PreProc      ctermfg=LightBlue    gui=NONE guifg=#3878FF

    hi LineNr       ctermfg=DarkYellow   gui=NONE guifg=#C19C00
    hi CursorLineNr ctermfg=Yellow       gui=BOLD guifg=#F9F1A5
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
