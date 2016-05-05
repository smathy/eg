#!/usr/bin/env ruby

require_relative "lib/rpn"

rpn = RPN.new

while true
  print "> "
  rpn << gets&.chomp

  puts rpn.value
end
