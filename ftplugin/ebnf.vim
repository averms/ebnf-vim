if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = 'setlocal commentstring< comments<'

setlocal commentstring=(*%s*)
setlocal comments=s:(*,mb:*,ex:*)

" vim: et ts=4
