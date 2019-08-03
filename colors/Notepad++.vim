" ======================================================================
" File:        Notepad++.vim
" Author:      thorstel
" Created:     2018-12-01
" License:     MIT License
" Description: Colorscheme based on the default colors of Notepad++.
" ======================================================================

set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "Notepad++"

hi Normal       cterm=none    ctermfg=Black       gui=none guifg=#000000 ctermbg=White      guibg=#FFFFFF
hi Cursor       cterm=bold    ctermfg=LightBlue   gui=none guifg=#E8E8FF ctermbg=DarkBlue   guibg=#000080
hi LineNr       cterm=none    ctermfg=DarkGray    gui=none guifg=#808080 ctermbg=LightGray  guibg=#F7F7F7
hi ColorColumn                                                           ctermbg=LightBlue  guibg=#E8E8FF
hi CursorLine                                                            ctermbg=LightBlue  guibg=#E8E8FF
hi CursorLineNr cterm=none    ctermfg=Black       gui=bold guifg=#000000 ctermbg=White      guibg=#FFFFFF
hi Folded       cterm=none    ctermfg=DarkGray    gui=none guifg=#808080 ctermbg=LightGray  guibg=#F7F7F7
hi FoldColumn   cterm=none    ctermfg=DarkGray    gui=none guifg=#808080 ctermbg=LightGray  guibg=#F7F7F7
hi Search       cterm=none    ctermfg=LightRed    gui=none guifg=#FF0000 ctermbg=Yellow     guibg=#FFFF00
hi Visual       cterm=reverse                                            ctermbg=LightGray  guibg=#F0F0F0

hi Pmenu        cterm=none    ctermfg=Black       gui=none guifg=#000000 ctermbg=LightGray  guibg=#F3F3F3
hi PmenuSel     cterm=none    ctermfg=DarkBlue    gui=bold guifg=#000080 ctermbg=LightBlue  guibg=#E8E8FF
hi PmenuSBar    cterm=none                                               ctermbg=LightGray  guibg=#C0C0C0
hi PmenuThumb   cterm=none                                               ctermbg=Black      guibg=#000000

hi DiffAdd      cterm=none    ctermfg=Black       gui=none guifg=#003300 ctermbg=LightGreen guibg=#DDFFDD
hi DiffDelete   cterm=none    ctermfg=White       gui=none guifg=#DDCCCC ctermbg=LightRed   guibg=#FFDDDD
hi DiffChange   cterm=none    ctermfg=Black       gui=none               ctermbg=LightGray  guibg=#ECECEC
hi DiffText     cterm=none    ctermfg=Black       gui=none guifg=#000000 ctermbg=Yellow     guibg=#FFFF00

hi Character    cterm=none    ctermfg=DarkGray    gui=none guifg=#808080
hi Comment      cterm=none    ctermfg=DarkGreen   gui=none guifg=#008000
hi Constant     cterm=none    ctermfg=DarkRed     gui=none guifg=#800000
hi Error        cterm=none    ctermfg=White       gui=bold guifg=#FFFFFF ctermbg=LightRed   guibg=#FF0000
hi Function     cterm=none    ctermfg=DarkBlue    gui=none guifg=#0000C0
hi Identifier   cterm=none    ctermfg=DarkGrey    gui=none guifg=#8080C0
hi NonText      cterm=none    ctermfg=Black       gui=none guifg=#000000
hi Number       cterm=none    ctermfg=DarkYellow  gui=none guifg=#FF8000
hi Operator     cterm=none    ctermfg=DarkBlue    gui=bold guifg=#000080
hi PreProc      cterm=none    ctermfg=DarkRed     gui=none guifg=#804000
hi Special      cterm=none    ctermfg=LightRed    gui=none guifg=#FF0000
hi SpecialKey   cterm=none    ctermfg=DarkYellow  gui=none guifg=#FFB56A
hi Statement    cterm=none    ctermfg=Blue        gui=bold guifg=#0000FF
hi String       cterm=none    ctermfg=DarkGray    gui=none guifg=#808080
hi Todo         cterm=none    ctermfg=LightRed    gui=bold guifg=#FF0000 ctermbg=Yellow     guibg=#FFFF00
hi Type         cterm=none    ctermfg=DarkMagenta gui=none guifg=#8000FF

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

