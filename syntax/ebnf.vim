" Vim syntax file
" Language:     EBNF
" Maintainer:   Hans Fugal
"               Aman Verma
" Last Change:  2019-03-01
" Canonical source repository is <https://github.com/a-vrma/ebnf-vim>.
" With thanks to Michael Brailsford for the BNF syntax file.

" Quit when a syntax file was already loaded
if exists('b:current_syntax')
    finish
endif

syn match ebnfMetaIdentifier /[A-Za-z]/ skipwhite skipempty nextgroup=ebnfSeperator

syn match ebnfSeperator '=' contained nextgroup=ebnfProduction skipwhite skipempty

syn region ebnfProduction start=/\zs[^\.;]/ end=/[\.;]/me=e-1 contained contains=ebnfSpecial,ebnfDelimiter,ebnfTerminal,ebnfSpecialSequence,ebnfComment nextgroup=ebnfEndProduction skipwhite skipempty
syn match ebnfDelimiter #[,(|)\]}\[{/!]\|\(\*)\)\|\((\*\)\|\(/)\)\|\(:)\)\|\((/\)\|\((:\)# contained
syn match ebnfSpecial /[\-\*]/ contained
syn region ebnfSpecialSequence matchgroup=Delimiter start=/?/ end=/?/ contained
syn match ebnfEndProduction /[\.;]/ contained 
syn region ebnfTerminal matchgroup=delimiter start=/"/ end=/"/ contained
syn region ebnfTerminal matchgroup=delimiter start=/'/ end=/'/ contained
syn region ebnfComment start='(\*' end='\*)'


hi link ebnfComment Comment
hi link ebnfMetaIdentifier Identifier
hi link ebnfSeperator ebnfSpecial
hi link ebnfEndProduction ebnfDelimiter
hi link ebnfDelimiter Delimiter
hi link ebnfSpecial Special
hi link ebnfSpecialSequence Statement
hi link ebnfTerminal Constant

let b:current_syntax = 'ebnf'

" vim: et ts=4
