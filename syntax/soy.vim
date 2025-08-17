if exists('b:current_syntax')
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

" Comments
syn match soyComment /\/\/.*$/
syn region soyComment start=/\/\*/ end=/\*\// contains=soyDocComment,soySpecialComment
syn region soyDocComment start=/\/\*\*/ end=/\*\// contains=soySpecialComment
syn match soySpecialComment /@\(param\?\|return\|throws\|inject\)/ contained

" Soy blocks
syn region soyBlock start="{" end="}" contains=soyKeyword,soyConstant,soyIdentifier,soyString,soyNumber,soyOperator,soyFunction

" Keywords
syn keyword soyKeyword contained template deltemplate call delcall namespace
syn keyword soyKeyword contained param let if elseif else switch case default
syn keyword soyKeyword contained for foreach ifempty literal msg fallbackmsg
syn keyword soyKeyword contained select plural print css xid private autoescape
syn keyword soyKeyword contained kind requirecss stricthtml state log
syn keyword soyConstant contained null true false

" Identifier
syntax match soyIdentifier /\$[a-zA-Z0-9._]*\>/ contained

" Strings and Numbers
syn region soyString contained start='"' skip='\\"' end='"'
syn region soyString contained start="'" skip="\\'" end="'"
syn match soyNumber contained "\<-?\d\+\(\.\d\+\)\{0,1\}\([eE][+-]?\d\+\)\?\>"

" Operators and Functions
syn keyword soyOperator contained and or not
syn keyword soyFunction contained isFirst isLast index length keys hasData
syn keyword soyFunction contained ceiling floor max min randomInt round
syn keyword soyFunction contained augmentMap bidiGlobalDir bidiStartEdge bidiEndEdge
syn keyword soyFunction contained changeNewlineToBr insertWordBreaks truncate
syn keyword soyFunction contained map list

" Highlighting
highlight def link soyBlock Special
highlight def link soyKeyword Keyword
highlight def link soyConstant Constant
highlight def link soyIdentifier Identifier
highlight def link soyString String
highlight def link soyNumber Number
highlight def link soyComment Comment
highlight def link soyDocComment SpecialComment
highlight def link soySpecialComment SpecialComment
highlight def link soyOperator Operator
highlight def link soyFunction Function

let b:current_syntax = "soy"
