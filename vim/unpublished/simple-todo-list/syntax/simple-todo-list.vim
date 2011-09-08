" Vim syntax file
" Language:   Simple Todos
" Maintainer: Jim Garvin <jim@thegarvin.com>
" Filenames:  *.todo.txt

if exists("b:current_syntax")
  finish
endif

syn region simpleTodoTitle start=/^[A-Z ]\+$/ end=/^---\+$/
hi def link simpleTodoTitle Special

let b:current_syntax = "simple-todo"
