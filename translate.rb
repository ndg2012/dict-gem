#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'dict'

if ARGV.empty?
  puts "Please, enter the word to translate."
  exit
end

puts Dict::Translation.getResponse(ARGV[0])

if ARGV[0] == "status"
  print "Status API: "
  print Dict::Translation.status
elsif ARGV[1] == "time"
  if !ARGV[2].nil?
    Dict::Translation.getResponse(ARGV[0], ARGV[2])
  else
    Dict::Translation.getResponse(ARGV[0])
  end
else
  Dict::Translation.getResponse(ARGV[0])
end