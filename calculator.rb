#!/usr/bin/env ruby

require_relative "rpn"

rpn = RPN.new

while true
  print "> "
  rpn << gets&.chomp

  puts rpn.value
end
