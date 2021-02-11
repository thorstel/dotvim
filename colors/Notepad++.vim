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

hi Normal       cterm=none      ctermfg=Black       gui=none    guifg=#000000   ctermbg=White       guibg=#FFFFFF
hi ColorColumn                                                                  ctermbg=LightGray   guibg=#F7F7F7
hi Cursor       cterm=bold      ctermfg=White       gui=none    guifg=#FFFFFF   ctermbg=DarkRed     guibg=#C04000
hi CursorColumn                                                                 ctermbg=LightBlue   guibg=#E8E8FF
hi CursorLine                                                                   ctermbg=LightBlue   guibg=#E8E8FF
hi CursorLineNr cterm=none      ctermfg=DarkRed     gui=bold    guifg=#C04000   ctermbg=White       guibg=#FFFFFF
hi DiffAdd      cterm=none      ctermfg=Black       gui=none    guifg=#003300   ctermbg=LightGreen  guibg=#DDFFDD
hi DiffChange   cterm=none      ctermfg=Black       gui=none                    ctermbg=LightGray   guibg=#ECECEC
hi DiffDelete   cterm=none      ctermfg=White       gui=none    guifg=#DDCCCC   ctermbg=LightRed    guibg=#FFDDDD
hi DiffText     cterm=none      ctermfg=Black       gui=none    guifg=#000000   ctermbg=Yellow      guibg=#FFFF00
hi Error        cterm=none      ctermfg=White       gui=bold    guifg=#FFFFFF   ctermbg=Red         guibg=#FF0000
hi FoldColumn   cterm=bold      ctermfg=DarkGray    gui=bold    guifg=#808080   ctermbg=LightGray   guibg=#F7F7F7
hi Folded       cterm=bold      ctermfg=DarkGray    gui=bold    guifg=#808080   ctermbg=LightGray   guibg=#F7F7F7
hi IncSearch    cterm=bold      ctermfg=Yellow      gui=bold    guifg=#FFFF00   ctermbg=LightRed    guibg=#FF0000
hi LineNr       cterm=none      ctermfg=DarkGray    gui=none    guifg=#808080   ctermbg=LightGray   guibg=#F7F7F7
hi MatchParen   cterm=bold      ctermfg=LightRed    gui=bold    guifg=#FF0000   ctermbg=Yellow      guibg=#FFFF00
hi Pmenu        cterm=none      ctermfg=Black       gui=none    guifg=#000000   ctermbg=LightGray   guibg=#F3F3F3
hi PmenuSBar    cterm=none                                                      ctermbg=LightGray   guibg=#C0C0C0
hi PmenuSel     cterm=none      ctermfg=DarkBlue    gui=bold    guifg=#000080   ctermbg=LightBlue   guibg=#E8E8FF
hi PmenuThumb   cterm=none                                                      ctermbg=Black       guibg=#000000
hi Search       cterm=none      ctermfg=LightRed    gui=none    guifg=#FF0000   ctermbg=Yellow      guibg=#FFFF00
hi Todo         cterm=none      ctermfg=LightRed    gui=bold    guifg=#FF0000   ctermbg=Yellow      guibg=#FFFF00
hi Visual       cterm=reverse                                                   ctermbg=LightGray   guibg=#F0F0F0

hi Character    cterm=none      ctermfg=DarkGray    gui=none    guifg=#808080
hi Comment      cterm=none      ctermfg=DarkGreen   gui=none    guifg=#008000
hi Constant     cterm=none      ctermfg=DarkRed     gui=none    guifg=#C04000
hi Function     cterm=none      ctermfg=DarkBlue    gui=none    guifg=#0000C0
hi Identifier   cterm=none      ctermfg=DarkGrey    gui=none    guifg=#8080C0
hi NonText      cterm=none      ctermfg=Black       gui=none    guifg=#000000
hi Number       cterm=none      ctermfg=DarkYellow  gui=none    guifg=#FF8000
hi Operator     cterm=none      ctermfg=DarkBlue    gui=bold    guifg=#000080
hi PreProc      cterm=none      ctermfg=DarkRed     gui=none    guifg=#C04000
hi Special      cterm=none      ctermfg=DarkBlue    gui=none    guifg=#000080
hi SpecialKey   cterm=none      ctermfg=DarkYellow  gui=none    guifg=#FFB56A
hi Statement    cterm=none      ctermfg=Blue        gui=bold    guifg=#0000FF
hi String       cterm=none      ctermfg=DarkGray    gui=none    guifg=#808080
hi Title        cterm=none      ctermfg=Blue        gui=bold    guifg=#0000FF
hi Type         cterm=none      ctermfg=DarkMagenta gui=none    guifg=#8000FF

" Less obtrusive doxygen
hi! link doxygenBrief Special
hi! link doxygenSpecialOnelineDesc String
