syn keyword javaType String

syn match jUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=javaType,jDelimiter,javaTypedef

syn match jDelimiter    "[();\\]"
syn match jBraces display "[{}]"

syn match javaOperator "\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match javaOperator "<<\|>>\|&&\|||\|++\|--\|->"
syn match javaOperator "[.!~*&%<>^|=,+-]"
syn match javaOperator "/[^/*=]"me=e-1
syn match javaOperator "/$"
syn match javaOperator "&&\|||"
syn match javaOperator "[][]"

hi def link jBraces Delimiter
hi def link jDelimiter Delimiter
hi def link jUserFunction Function
