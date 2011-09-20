" Vim syntax file
" Language:   Simple Todos
" Maintainer: Jim Garvin <jim@thegarvin.com>
" Filenames:  *.todo.txt

if exists("b:current_syntax")
  finish
endif

syntax sync fromstart
set foldmethod=syntax

syn region simpleTodoTitle   start=/^[A-Z ]\+$/ end=/^---\+$/
syn region simpleTodoSection start=/^\(---\+\n\)\@<=./ end=/\ze\n\n[A-Z ]\+\n---\+$/ fold containedin=simpleTodoTitle

hi def link simpleTodoTitle Special

let b:current_syntax = "simple-todo"
