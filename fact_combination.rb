#!/usr/bin/env ruby
s1 = "0"
s2 = "1"
s3 = "2"
s4 = "3"
s5 = "4"

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

a = [s1, s2, s3, s4 ,s5 ];
n = a.size

puts "n  = %i" % n
puts "n! = %i" % n.fact

b = 1.upto(a.size).flat_map do |x|
  a.combination(x).to_a
end

b.each do |ae|
  ae.each { |e|
    puts e
  }
  puts
end
