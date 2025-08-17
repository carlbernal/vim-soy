if exists('b:current_syntax')
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

" Override HTML syntax to include Soy variables in HTML content
syn cluster htmlPreproc add=soyIdentifier,soyBlock
syn clear htmlError

syn match soyComment /\/\/.*$/ contains=soySpecialComment
syn region soyComment start=/\/\*/ end=/\*\//
syn region soyDocComment start=/\/\*\*/ end=/\*\//

" Keywords
syn keyword soyKeyword template deltemplate call delcall namespace
syn keyword soyKeyword param let if elseif else switch case default
syn keyword soyKeyword for foreach ifempty literal msg fallbackmsg
syn keyword soyKeyword select plural print css xid private autoescape
syn keyword soyKeyword kind requirecss stricthtml state log export
syn keyword soyKeyword variant experiments sp

" Constants
syn keyword soyConstant null true false

" Template names and identifiers
syn match soyTemplateName contained /\.[a-zA-Z][a-zA-Z0-9._]*/
syn match soyIdentifier /\$[a-zA-Z0-9._]\+\>/ containedin=htmlString,htmlTag,htmlEndTag,htmlValue

" Variables in HTML content and attributes
syn match soyVarInHTML /{[^}]*\$[a-zA-Z0-9._]\+[^}]*}/ contained containedin=htmlString,htmlTag,htmlEndTag,htmlValue contains=soyIdentifier,soyDelimiter

" Strings and Numbers
syn region soyString start='"' skip='\\"' end='"'
syn region soyString start="'" skip="\\'" end="'"
syn match soyNumber "\<-\?\d\+\(\.\d\+\)\?\([eE][+-]\?\d\+\)\?\>"

" Operators and Functions
syn keyword soyOperator and or not in
syn match soyMathOp contained /[+\-*/%]/
syn match soyCompareOp contained /[<>=!]\+/
syn match soyAssignOp contained /:/
syn match soyTernaryOp contained /?/
syn keyword soyFunction isFirst isLast index length keys hasData
syn keyword soyFunction ceiling floor max min randomInt round
syn keyword soyFunction augmentMap bidiGlobalDir bidiStartEdge bidiEndEdge
syn keyword soyFunction changeNewlineToBr insertWordBreaks truncate
syn keyword soyFunction map list range strContains strIndexOf strSub
syn keyword soyFunction htmlToText

" Template blocks - handle multi-word template definitions
syn region soyTemplateBlock matchgroup=soyDelimiter start="{\s*template\s" end="}" contains=soyKeyword,soyTemplateName,soyString,soyIdentifier
syn region soyTemplateBlock matchgroup=soyDelimiter start="{\s*deltemplate\s" end="}" contains=soyKeyword,soyTemplateName,soyString,soyIdentifier

" Regular blocks - allow them to appear within HTML
syn cluster soyInside contains=soyKeyword,soyConstant,soyIdentifier,soyString,soyNumber,soyOperator,soyMathOp,soyCompareOp,soyAssignOp,soyTernaryOp,soyFunction,soyTemplateName
syn region soyBlock matchgroup=soyDelimiter start="{" end="}" contains=@soyInside containedin=htmlString,htmlTag,htmlEndTag,htmlValue

" End tags
syn match soyEndTag "{\s*/[a-zA-Z]\+\s*}"

" Highlighting
hi def link soyKeyword Keyword
hi def link soyConstant Constant
hi def link soyIdentifier Identifier
hi def link soyVarInHTML Identifier
hi def link soyTemplateName Type
hi def link soyString String
hi def link soyNumber Number
hi def link soyComment Comment
hi def link soyDocComment SpecialComment
hi def link soyOperator Operator
hi def link soyMathOp Operator
hi def link soyCompareOp Operator
hi def link soyAssignOp Operator
hi def link soyTernaryOp Operator
hi def link soyFunction Function
hi def link soyDelimiter Delimiter
hi def link soyEndTag Delimiter

let b:current_syntax = "soy"
