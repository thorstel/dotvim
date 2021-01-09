" Light color scheme based on the Solarized color palette but with
" higher contrast and less color variety.

highlight clear
if exists("syntax_on")
    syntax reset
endif

if !has('gui_running') && !(has('termguicolors') && &termguicolors)
    finish
endif

let colors_name = "SolarizedLight-Bases"
set background=light

" Solarized Color Palette (https://ethanschoonover.com/solarized/)
let s:base03  = "#002B36 "
let s:base02  = "#073642 "
let s:base01  = "#586E75 "
let s:base00  = "#657B83 "
let s:base0   = "#839496 "
let s:base1   = "#93A1A1 "
let s:base2   = "#EEE8D5 "
let s:base3   = "#FDF6E3 "
let s:yellow  = "#B58900 "
let s:orange  = "#CB4B16 "
let s:red     = "#DC322F "
let s:magenta = "#D33682 "
let s:violet  = "#6C71C4 "
let s:blue    = "#268BD2 "
let s:cyan    = "#2AA198 "
let s:green   = "#859900 "

exe "hi Normal          gui=none    guifg=" .s:base01   ."guibg=" .s:base3
exe "hi ColorColumn                                       guibg=" .s:base2
exe "hi Cursor          gui=none    guifg=" .s:base3    ."guibg=" .s:orange
exe "hi CursorColumn                                      guibg=" .s:base2
exe "hi CursorLine                                        guibg=" .s:base2
exe "hi CursorLineNr    gui=bold    guifg=" .s:orange   ."guibg=" .s:base3
exe "hi DiffAdd         gui=bold    guifg=" .s:green    ."guibg=" .s:base2
exe "hi DiffChange      gui=bold    guifg=" .s:yellow   ."guibg=" .s:base2
exe "hi DiffDelete      gui=bold    guifg=" .s:red      ."guibg=" .s:base2
exe "hi DiffText        gui=bold    guifg=" .s:blue     ."guibg=" .s:base2
exe "hi Error           gui=bold    guifg=" .s:base3    ."guibg=" .s:red
exe "hi FoldColumn      gui=bold    guifg=" .s:base00   ."guibg=" .s:base2
exe "hi Folded          gui=bold    guifg=" .s:base00   ."guibg=" .s:base2
exe "hi IncSearch       gui=bold    guifg=" .s:base2    ."guibg=" .s:red
exe "hi LineNr          gui=none    guifg=" .s:base0    ."guibg=" .s:base2
exe "hi MatchParen      gui=bold    guifg=" .s:orange   ."guibg=" .s:base2
exe "hi Pmenu           gui=none    guifg=" .s:base01   ."guibg=" .s:base2
exe "hi PmenuSBar                                         guibg=" .s:base1
exe "hi PmenuSel        gui=bold    guifg=" .s:orange   ."guibg=" .s:base3
exe "hi PmenuThumb                                        guibg=" .s:base01
exe "hi Search          gui=bold    guifg=" .s:red      ."guibg=" .s:base2
exe "hi Todo            gui=bold    guifg=" .s:magenta  ."guibg=" .s:base3
exe "hi Visual                                            guibg=" .s:base2
exe "hi WildMenu        gui=bold    guifg=" .s:base3    ."guibg=" .s:orange

exe "hi Comment         gui=none    guifg=" .s:base0
exe "hi Constant        gui=none    guifg=" .s:violet
exe "hi Directory       gui=bold    guifg=" .s:blue
exe "hi Function        gui=none    guifg=" .s:base02
exe "hi Identifier      gui=none    guifg=" .s:base02
exe "hi NonText         gui=none    guifg=" .s:base1
exe "hi Number          gui=none    guifg=" .s:orange
exe "hi Operator        gui=none    guifg=" .s:base02
exe "hi PreProc         gui=bold    guifg=" .s:base02
exe "hi Question        gui=bold    guifg=" .s:green
exe "hi Special         gui=none    guifg=" .s:base02
exe "hi SpecialKey      gui=none    guifg=" .s:base1
exe "hi Statement       gui=bold    guifg=" .s:base02
exe "hi String          gui=none    guifg=" .s:blue
exe "hi Title           gui=bold    guifg=" .s:base02
exe "hi Type            gui=bold    guifg=" .s:base01

" Fix doxygen
hi! link doxygenBrief Special
hi! link doxygenSpecialOnelineDesc Special
