function! textobj#value#default#parse(line) abort
  " key = value
  if matchstr(a:line, '.\+\s*=\s*.') != ''
    let head = matchstrpos(a:line, '\%(=\s*\)\@<=[^= ]')[1] + 1
    let tail = textobj#value#get_tail(a:line, head)
    return [head, tail]
  endif
  return []
endfunction
