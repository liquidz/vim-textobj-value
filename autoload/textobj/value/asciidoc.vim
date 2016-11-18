function! textobj#value#asciidoc#parse(line) abort
  if matchstr(a:line, '^=\+') != ''
    " header
    let head = matchstrpos(a:line, '\v[^= ]')[1] + 1
    let tail = textobj#value#get_tail(a:line, head)
    return [head, tail]
  elseif matchstr(a:line, '^*\+ ') != ''
    " list
    let head = matchstrpos(a:line, '\v[^* ]')[1] + 1
    let tail = textobj#value#get_tail(a:line, head)
    return [head, tail]
  endif
  
  return []
endfunction
