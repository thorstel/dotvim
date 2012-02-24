"
" Vim color file
"
" Name:     thorstel.vim
"
" Based on the moria-light colorscheme
"

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "thorstel"

" ================
"  GENERAL COLORS
" ================

hi Normal guibg=#F8F8F8 guifg=#000000 gui=none ctermfg=black cterm=none
hi CursorColumn guibg=#F0F0F0 gui=none cterm=none
hi CursorLine guibg=#F0F0F0 gui=none cterm=none

hi FoldColumn guibg=bg guifg=#375288 gui=none cterm=none
hi Folded guibg=#E0E0E0 guifg=#25365a gui=bold cterm=bold ctermbg=cyan ctermfg=blue
hi LineNr guifg=#375288 gui=none guibg=#E0E0E0 cterm=none
hi MoreMsg guibg=bg guifg=#2f4471 gui=bold
hi NonText guibg=bg guifg=#C0C0C0 gui=none cterm=none
"hi NonText guibg=bg guifg=#375288 gui=bold
hi Pmenu guibg=#708bc5 guifg=#000000 gui=none ctermfg=black cterm=none
hi PmenuSbar guibg=#4a6db5 guifg=fg gui=none cterm=none
hi PmenuThumb guibg=#a6b7db guifg=fg gui=none cterm=none
hi SignColumn guibg=bg guifg=#375288 gui=none cterm=none
hi StatusLine guibg=#999999 guifg=fg gui=bold cterm=bold ctermbg=cyan ctermfg=black
hi StatusLineNC guibg=#999999 guifg=fg gui=none cterm=none
hi TabLine guibg=#999999 guifg=fg gui=bold
hi TabLineFill guibg=#333333 guifg=fg gui=none cterm=none
hi VertSplit guibg=#999999 guifg=fg gui=none cterm=none

hi Cursor guibg=#883400 guifg=bg gui=none cterm=none
hi DiffAdd guibg=#008b00 guifg=#ffffff gui=none cterm=none
hi DiffChange guibg=#00008b guifg=#ffffff gui=none cterm=none
hi DiffDelete guibg=#8b0000 guifg=#ffffff gui=none cterm=none
hi DiffText guibg=#0000cd guifg=#ffffff gui=bold
hi Directory guibg=bg guifg=#0000f0 gui=none cterm=none
hi ErrorMsg guibg=#ee2c2c guifg=#ffffff gui=bold
hi IncSearch guibg=#ffcd78 gui=none cterm=none
hi ModeMsg guibg=bg guifg=fg gui=bold
hi PmenuSel guibg=#ffff00 guifg=#000000 gui=none cterm=none
hi Question guibg=bg guifg=#813f11 gui=bold
hi Search guibg=#a0f0a0 gui=none cterm=none
hi SpecialKey guibg=bg guifg=#C0C0C0 gui=none cterm=none
"hi SpecialKey guibg=bg guifg=#912f11 gui=none cterm=none

" only since version 7.3!
hi ColorColumn guibg=#E0E0E0 gui=none cterm=none
hi Conceal guibg=#F8F8F8 guifg=#000000 gui=none cterm=none

" ==========
"  SPELLING
" ==========

if has("spell")
    hi SpellBad guisp=#ee2c2c gui=undercurl
    hi SpellCap guisp=#2c2cee gui=undercurl
    hi SpellLocal guisp=#008b8b gui=undercurl
    hi SpellRare guisp=#ee2cee gui=undercurl
endif

" ========
"  WINDOW
" ========

hi TabLineSel guibg=bg guifg=fg gui=bold
hi Title guifg=fg gui=bold
if version >= 700
    hi Visual guibg=#c4c4c4 gui=none cterm=none
else
    hi Visual guibg=#c4c4c4 guifg=fg gui=none cterm=none
endif
hi VisualNOS guibg=bg guifg=#a0a0a0 gui=bold,underline
hi WarningMsg guibg=bg guifg=#ee2c2c gui=bold
hi WildMenu guibg=#ffff00 guifg=fg gui=bold

" ========
"  SYNTAX
" ========

hi Comment guibg=bg guifg=#786000 gui=italic ctermfg=yellow
hi Constant guibg=bg guifg=#077807 gui=none ctermfg=green cterm=none
hi Error guibg=bg guifg=#ee2c2c gui=bold ctermfg=white ctermbg=red cterm=bold
hi Identifier guibg=bg guifg=#007080 gui=none ctermfg=blue cterm=none
hi Ignore guibg=bg guifg=bg gui=none cterm=none
hi lCursor guibg=#008000 guifg=#ffffff gui=none cterm=none
hi MatchParen guibg=#00ffff gui=none cterm=none
hi PreProc guibg=bg guifg=#800090 gui=none ctermfg=magenta cterm=none
hi Special guibg=bg guifg=#912f11 gui=none ctermfg=red cterm=none
hi Statement guibg=bg guifg=#1f3f81 gui=bold ctermfg=blue cterm=bold
hi Todo guibg=#ffff00 guifg=fg gui=bold ctermfg=blue cterm=bold ctermbg=none
hi Type guibg=bg guifg=#912f11 gui=bold ctermfg=red cterm=bold
hi Underlined guibg=bg guifg=#0000cd gui=underline

hi htmlBold guibg=bg guifg=fg gui=bold
hi htmlBoldItalic guibg=bg guifg=fg gui=bold,italic
hi htmlBoldUnderline guibg=bg guifg=fg gui=bold,underline
hi htmlBoldUnderlineItalic guibg=bg guifg=fg gui=bold,underline,italic
hi htmlItalic guibg=bg guifg=fg gui=italic
hi htmlUnderline guibg=bg guifg=fg gui=underline
hi htmlUnderlineItalic guibg=bg guifg=fg gui=underline,italic

hi! default link bbcodeBold htmlBold
hi! default link bbcodeBoldItalic htmlBoldItalic
hi! default link bbcodeBoldItalicUnderline htmlBoldUnderlineItalic
hi! default link bbcodeBoldUnderline htmlBoldUnderline
hi! default link bbcodeItalic htmlItalic
hi! default link bbcodeItalicUnderline htmlUnderlineItalic
hi! default link bbcodeUnderline htmlUnderline
