" Simple Todo List filetype plugin
" Language:   Simple Todo List
" Maintainer: Jim Garvin <jim@thegarvin.com>

if (exists("b:loaded_simpletodolugin"))
  finish
endif

function! ToggleTodoItem()
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
    normal! dd
    call search("TODO LIST", "b")
    normal! jp

  elseif first_char == notdone_icon
    " Mark as done
    let date_command = "date ".shellescape("+%h %d, %Y %l:%M%p")
    let timestamp = substitute(system(date_command), "\n", "", "")
    execute "normal! xi".done_icon." [".timestamp."]"
    normal! dd
    call search("DONE LOG")
    normal! jp

  else
    execute "normal! i".notdone_icon." "
  end

  call setpos('.', save_cursor)
endfunction

nnoremap <buffer> <silent> <Leader>d :call ToggleTodoItem()<CR>

let b:loaded_simpletodolugin = 1
