function! textobj#value#default#parse(line) abort
  if matchstr(a:line, '.\+\s*=\s*.') != ''
    " key = value
    let head = matchstrpos(a:line, '\%(=\s*\)\@<=[^= ]')[1] + 1
    return [head, textobj#value#get_tail(a:line, head)]
  elseif matchstr(a:line, '.\+\s*:\s*.') != ''
    " key: value
    let head = matchstrpos(a:line, '\%(:\s*\)\@<=[^: ]')[1] + 1
    return [head, textobj#value#get_tail(a:line, head)]
  endif

  return []
endfunction
