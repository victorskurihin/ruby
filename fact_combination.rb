#!/usr/bin/env ruby
s1 = "C∈A"
s2 = "A⊇B"
s3 = "D⊂A"
s4 = "B∉A"
s5 = "B∈A"
s6 = "D∈B"
s7 = "C⊆A"
s8 = "A=B"
s9 = "C∈B"
s10 = "A⊆B"


class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

a = [s1, s2, s3, s4 ,s5, s6, s7, s8, s9, s10 ];
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
