syn match pyDelimiter "[(:)]"
syn match pyOperator  "[]{},<>!=+-/*%.[]"

hi def link pyDelimiter Delimiter
hi def link pyOperator  Operator
