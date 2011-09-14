" Simple Todo List filetype plugin
" Language:   Simple Todo List
" Maintainer: Jim Garvin <jim@thegarvin.com>

if (exists("b:loaded_simpletodolugin"))
  finish
endif

function! ToggleTodoLogged()
  let done_icon    = "✔"
  let notdone_icon = "❒"
  let save_cursor  = getpos(".")

  " FML this didn't work for multibyte char
  " let first_char = getline('.')[col('.')-1]
  normal! ^
  normal! "lyl
  let first_char = @l

  if first_char == done_icon
    " Move to log
    normal! dd
    call search("DONE LOG")
    normal! jp

  elseif first_char == notdone_icon
    " Move to todo list
    normal! dd
    call search("TODO LIST", "b")
    normal! jp

  else
    " do nothing
  end

  call setpos('.', save_cursor)
endfunction

function! ToggleTodoDone()
  let done_icon    = "✔"
  let notdone_icon = "❒"
  let save_cursor  = getpos(".")

  " FML this didn't work for multibyte char
  " let first_char = getline('.')[col('.')-1]
  normal! ^
  normal! "lyl
  let first_char = @l

  if first_char == done_icon
    " Mark as not done
    s/ \[.*\]//
    execute "normal! xi".notdone_icon

  elseif first_char == notdone_icon
    " Mark as done
    let date_command = "date ".shellescape("+%h %d, %Y %l:%M%p")
    let timestamp = substitute(system(date_command), "\n", "", "")
    execute "normal! xi".done_icon." [".timestamp."]"

  else
    execute "normal! i".notdone_icon." "
  end

  call setpos('.', save_cursor)
endfunction

function! ToggleTodoDoneAndLogged()
  call ToggleTodoDone()
  call ToggleTodoLogged()
endfunction

nnoremap <buffer> <silent> <Leader>m :call ToggleTodoDone()<CR>
nnoremap <buffer> <silent> <Leader>l :call ToggleTodoLogged()<CR>
nnoremap <buffer> <silent> <Leader>d :call ToggleTodoDoneAndLogged()<CR>

let b:loaded_simpletodolugin = 1
