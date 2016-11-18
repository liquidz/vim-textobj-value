function! textobj#value#markdown#parse(line) abort
  if matchstr(a:line, '^#\+') != ''
    " header
    let head = matchstrpos(a:line, '\v[^# ]')[1] + 1
    return [head, textobj#value#get_tail(a:line, head)]
  elseif matchstr(a:line, '\s*\* ') != ''
    " list
    let head = matchstrpos(a:line, '\v[^* ]')[1] + 1
    return [head, textobj#value#get_tail(a:line, head)]
  endif
  
  return []
endfunction
