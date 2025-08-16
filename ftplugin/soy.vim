if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

setlocal commentstring={/*\ %s\ */}
setlocal comments=s1:{/*,mb:*,ex:*/}

setlocal autoindent
setlocal indentexpr=HtmlIndent()
setlocal indentkeys=o,O,*<Return>,<>>,{,}

if exists("loaded_matchit")
  let b:match_ignorecase = 1
  let b:match_words = '{template\>:{/template\>,'
  let b:match_words .= '{if\>:{elseif\>:{else\>:{/if\>,'
  let b:match_words .= '{switch\>:{case\>:{default\>:{/switch\>,'
  let b:match_words .= '{for\>:{/for\>,'
  let b:match_words .= '{foreach\>:{ifempty\>:{/foreach\>,'
  let b:match_words .= '{msg\>:{/msg\>,'
  let b:match_words .= '{let\>:{/let\>,'
  let b:match_words .= '{literal\>:{/literal\>'
endif
