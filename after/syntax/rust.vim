syn match rustDelimiter "[{(;)}]"
syn match rustOperator  "[],.[]"

hi def link rustDelimiter Delimiter
hi def link rustOperator  Operator
