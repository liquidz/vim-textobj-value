function! textobj#value#get_tail(line, pos) abort
  return matchstrpos(a:line, '\s*$', a:pos)[1]
endfunction

function! textobj#value#select_i()   
  if empty(getline('.'))
    return 0
  endif

  let line = getline('.')
  let ft = (&filetype == '') ? 'default' : &filetype

  try
    let res = call(printf('textobj#value#%s#parse', ft), [line])
  catch /.*/
    let res = []
  endtry
  
  if empty(res)
    let res = textobj#value#default#parse(line)
    if empty(res)
      return 0
    endif
  endif

  let pos = getpos('.')
  let head_pos = copy(pos)
  let tail_pos = copy(pos)
  let head_pos[2] = res[0]
  let tail_pos[2] = res[1]

  return ['v', head_pos, tail_pos]
endfunction
