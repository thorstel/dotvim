syn match pyDelimiter "[(:)]"
syn match pyOperator  "[]{},<>!=+-/*%.[]"

syn match Error ";$"

hi def link pyDelimiter Delimiter
hi def link pyOperator  Operator
