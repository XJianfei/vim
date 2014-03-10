"syn keyword xkey common
"hi def link xkey String
"
"

syn match xmacro "\<[0-9A-Z_]\+\>"
"syn match xoperation "[!~&^-+=]"
syn match xoperation display  "[-!<~^&>+*/%=]"
"syn match xBrackets "[()\[\]{}]"
syn match xStruct "struct\s\+\w\+"


hi def link xmacro Macro
hi def link xoperation Operator
hi def link xStruct cSpecial
"hi def link xBrackets Include
