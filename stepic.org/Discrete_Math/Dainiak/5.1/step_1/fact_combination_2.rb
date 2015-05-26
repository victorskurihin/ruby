#!/usr/bin/env ruby
s01 = "13 — простое число"
s02 = "1001 — составное число."
s03 = "Если простые числа упорядочить по возрастанию, то в этой шеренге k-е по счёту простое число будет асимптотически равно klog2k."
s04 = "Для любого достаточно большого n в интервале [n,n+2015] есть простое число."
s05 = "Для любого достаточно большого n в интервале [3n,3n+n3/4] есть простое число."
s06 = "Известны формулы, которые генерируют простые числа, но на практике эти формулы не применишь."
s07 = "1313 — простое число."
s08 = "1001 — простое число."
s09 = "Всегда ⌈x+0.01⌉=⌈x⌉."
s10 = "Всегда ⌊x+0.01⌋=⌊x⌋."
s11 = "Всегда {x+1}={x}."
s12 = "Всегда ⌈x⌉⩽x."
s13 = "Всегда ⌊x⌋⩾x."

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

a = [ s01, s02, s03, s04 ,s05, s06, s07, s08 ];
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
