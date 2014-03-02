#!/usr/bin/env zsh

# Based on Geoffrey Grosenbach's peepcode zsh theme from
# https://github.com/topfunky/zsh-simple
#

git_repo_path() {
  git rev-parse --git-dir 2>/dev/null
}

git_commit_id() {
  git rev-parse --short HEAD 2>/dev/null
}

git_mode() {
  if [[ -e "$repo_path/BISECT_LOG" ]]; then
    echo "+bisect"
  elif [[ -e "$repo_path/MERGE_HEAD" ]]; then
    echo "+merge"
  elif [[ -e "$repo_path/rebase" || -e "$repo_path/rebase-apply" || -e "$repo_path/rebase-merge" || -e "$repo_path/../.dotest" ]]; then
    echo "+rebase"
  fi
}

git_dirty_color() {
  if [[ "$repo_path" != '.' && `git ls-files -m` != "" ]]; then
    color="grey"
  else
    color="yellow"
  fi
  echo $color
  # echo "%{$fg_bold[$color]%}"
}

git_prompt() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    local repo_path=$(git_repo_path)

    echo " $(git_dirty_color)$cb %{$fg[white]%}$(git_commit_id)%{$reset_color%}"
  fi
}

# Displays the exec time of the last command if set threshold was exceeded
#
cmd_exec_time() {
    local stop=`date +%s`
    local start=${cmd_timestamp:-$stop}
    let local elapsed=$stop-$start
    [ $elapsed -gt 5 ] && echo ${elapsed}s
}

# Get the intial timestamp for cmd_exec_time
#
preexec() {
    cmd_timestamp=`date +%s`
}

precmd() {
  TIMEOUT="%F{yellow}$(cmd_exec_time)%f"
}

input_character() {
  input_char="%(!.#.»)%{$reset_color%}"
  color="%{$fg[$1]%}"
  echo "${color}${input_char}"
}
local input_indicator="%(?,$(input_character green),$(input_character red)%{$reset_color%})"

PROMPT='%~ ${TIMEOUT}
${input_indicator}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(git_prompt)%{$reset_color%}'
