hi clear

set background=light
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
 syntax reset
    endif
endif
let g:colors_name="thorstel_blackwhite"

hi Normal       guifg=#000000 guibg=#F8F8FF

" Cursor
hi Cursor       guibg=#444454 guifg=#F8F8FF
hi CursorLine   guibg=#D8D8DD
hi CursorColumn guibg=#E8E8EE
hi ColorColumn  guibg=#ECECEC

" Diff
hi DiffAdd      guifg=#003300 guibg=#DDFFDD gui=none
hi DiffChange                 guibg=#ececec gui=none
hi DiffText     guifg=#000033 guibg=#DDDDFF gui=none
hi DiffDelete   guifg=#DDCCCC guibg=#FFDDDD gui=none

" Folding, Line Numbering, Status Lines
hi Folded       guibg=#ECECEC guifg=#808080 gui=bold
hi vimFold      guibg=#ECECEC guifg=#808080 gui=bold
hi FoldColumn   guibg=#ECECEC guifg=#808080 gui=bold
hi LineNr       guifg=#808080 guibg=#ECECEC gui=bold
hi NonText      guifg=#808080 guibg=#ECECEC
hi Folded       guifg=#808080 guibg=#ECECEC gui=bold
hi FoldeColumn  guifg=#808080 guibg=#ECECEC gui=bold
hi VertSplit    guibg=#bbbbbb guifg=#bbbbbb gui=none
hi StatusLine   guibg=#bbbbbb guifg=#404040 gui=bold
hi StatusLineNC guibg=#d4d4d4 guifg=#404040 gui=italic

" Misc
hi ModeMsg      guifg=#990000
hi MoreMsg      guifg=#990000
hi Title        guifg=#ef5939
hi WarningMsg   guifg=#ef5939
hi SpecialKey   guifg=#CCCCBB gui=italic
hi MatchParen   guibg=#cdcdfd guifg=#000000
hi Underlined   guifg=#000000 gui=underline
hi Directory    guifg=#990000

" Search, Visual, etc
hi Visual       guifg=#FFFFFF guibg=#3465a4 gui=none
hi VisualNOS    guifg=#FFFFFF guibg=#204a87 gui=none
hi IncSearch    guibg=#cdcdfd guifg=#000000 gui=italic
hi Search       guibg=#cdcdfd guifg=#000000 gui=italic

" Syntax
hi Ignore       guifg=#808080
hi Identifier   guifg=#000000 gui=italic
hi PreProc      guifg=#909090 gui=bold
hi Comment      guifg=#909090
hi Constant     guifg=#606060 gui=italic
hi String       guifg=#606060
hi Function     guifg=#000000 gui=italic
hi Statement    guifg=#000000 gui=bold
hi Type         guifg=#606060 gui=bold
hi Number       guifg=#606060
hi Todo         guifg=#FF0000 gui=bold guibg=#F8F8FF
hi Special      guifg=#303030 gui=bold
hi rubySymbol   guifg=#000000
hi Error        guibg=#f8f8ff guifg=#ff1100 gui=undercurl
hi Label        guifg=#000000 gui=bold
hi StorageClass guifg=#000000 gui=bold
hi Structure    guifg=#000000 gui=bold
hi TypeDef      guifg=#000000 gui=bold

" Completion
hi WildMenu     guifg=#7fbdff guibg=#425c78 gui=none
hi Pmenu        guibg=#808080 guifg=#ffffff gui=bold
hi PmenuSel     guibg=#cdcdfd guifg=#000000 gui=italic
hi PmenuSbar    guibg=#000000 guifg=#444444
hi PmenuThumb   guibg=#aaaaaa guifg=#aaaaaa

" Spelling
hi spellBad     guisp=#fcaf3e
hi spellCap     guisp=#73d216
hi spellRare    guisp=#fcaf3e
hi spellLocal   guisp=#729fcf

" Tabs
hi TabLine      guifg=#404040 gui=none guibg=#dddddd
hi TabLineFill  guifg=#404040 gui=none guibg=#dddddd
hi TabLineSel   guifg=#404040 gui=bold

" Aliases
hi link cppSTL         Function
hi link cppSTLType     Type
hi link Character      Number
hi link htmlTag        htmlEndTag
hi link htmlTagName    htmlTag
hi link htmlLink       Underlined
hi link pythonFunction Identifier
hi link Question       Type
hi link CursorIM       Cursor
hi link VisualNOS      Visual
hi link xmlTag         Identifier
hi link xmlTagName     Identifier
hi link shDeref        Identifier
hi link shVariable     Function
hi link rubySharpBang  Special
hi link perlSharpBang  Special
hi link schemeFunc     Statement
