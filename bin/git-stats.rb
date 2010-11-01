#!/usr/bin/env ruby

Authors = []
Format = "%20s %13s %12s %12s %10s\n"
printf(Format, *%w(Author files-changed insertions deletions net))

open("| git shortlog -s -n").each do |line|
  Authors << line.sub(/^\s*\d+\s*/, '').chomp
end

Authors.each do |name|
  files_changed = insertions = deletions = 0
  open("| git log --shortstat --no-merges --author='#{name}' | grep 'files changed'").each do |line|
    matchdata = line.match(/(\d+) files changed, (\d+) insertions.* (\d+) deletions/)
    files_changed += matchdata[1].to_i
    insertions    += matchdata[2].to_i
    deletions     += matchdata[3].to_i
  end

  printf(Format, name, files_changed, insertions, "-#{deletions}", insertions - deletions) unless files_changed == 0
end

