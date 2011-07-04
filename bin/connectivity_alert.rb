#!/bin/env ruby

require 'open-uri'

loop do
  begin
     open("http://google.com")
     break
  rescue SocketError => e
    puts "nothing at #{Time.now}"
  end
  sleep 60
end

loop do
  `say we have connectivity!`
  sleep 2
end
