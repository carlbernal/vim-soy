if exists('b:current_syntax')
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syn region soyComment start='{/\*' end='\*/}' containedin=ALL
syn region soyDocComment start='{/\*\*' end='\*/}' containedin=ALL
syn region soyBlock start='{' end='}' contains=soyKeyword,soyVariable,soyString,soyNumber,soyOperator,soyBuiltin,soyAttribute transparent
syn keyword soyKeyword contained template deltemplate call delcall namespace
syn keyword soyKeyword contained param let if elseif else switch case default
syn keyword soyKeyword contained for foreach ifempty literal msg fallbackmsg
syn keyword soyKeyword contained select plural print css xid private autoescape
syn keyword soyKeyword contained kind requirecss stricthtml
syn match soyVariable contained '\$\w\+\(\.\w\+\)*'
syn match soyVariable contained '\$ij\.\w\+'
syn region soyString contained start='"' skip='\\"' end='"'
syn region soyString contained start="'" skip="\\'" end="'"
syn match soyNumber contained '\<\d\+\(\.\d\+\)\?\>'

syn keyword soyOperator contained and or not
syn keyword soyBuiltin contained isFirst isLast index length keys hasData
syn keyword soyBuiltin contained ceiling floor max min randomInt round
syn keyword soyBuiltin contained augmentMap bidiGlobalDir bidiStartEdge bidiEndEdge
syn keyword soyBuiltin contained changeNewlineToBr insertWordBreaks truncate

syn match soyAttribute contained '\w\+\s*:'

highlight default link soyBlock PreProc
highlight default link soyKeyword Keyword
highlight default link soyVariable Identifier
highlight default link soyString String
highlight default link soyNumber Number
highlight default link soyComment Comment
highlight default link soyDocComment SpecialComment
highlight default link soyOperator Operator
highlight default link soyBuiltin Function
highlight default link soyAttribute Type

let b:current_syntax = 'soy'
