if exists('g:loaded_textobj_value')
  finish
endif

call textobj#user#plugin('value', {
    \   '-': {
    \     'select-i': 'iv',
    \     'select-i-function': 'textobj#value#select_i',
    \   }
    \ })

let g:loaded_textobj_value = 1
