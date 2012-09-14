syn match scalaUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=scalaType,scalaDelimiter

syn match scalaDelimiter    "[();\\]"
syn match scalaBraces display "[{}]"

syn match scalaOperator "\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match scalaOperator "<<\|>>\|&&\|||\|++\|--\|->"
syn match scalaOperator "[.!~*&%<>^|=,+-]"
syn match scalaOperator "/[^/*=]"me=e-1
syn match scalaOperator "/$"
syn match scalaOperator "&&\|||"
syn match scalaOperator "[][]"

hi def link scalaBraces Delimiter
hi def link scalaDelimiter Delimiter

hi link scalaOperator Operator
hi def link scalaUserFunction Function
