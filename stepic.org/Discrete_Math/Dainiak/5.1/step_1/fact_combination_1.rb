#!/usr/bin/env ruby
s1 = "13 — простое число"
s2 = "1001 — составное число."
s3 = "Если простые числа упорядочить по возрастанию, то в этой шеренге k-е по счёту простое число будет асимптотически равно klog2k."
s4 = "Для любого достаточно большого n в интервале [n,n+2015] есть простое число."
s5 = "Для любого достаточно большого n в интервале [3n,3n+n3/4] есть простое число."
s6 = "Известны формулы, которые генерируют простые числа, но на практике эти формулы не применишь."
s7 = "1313 — простое число."
s8 = "1001 — составное число."
s9 = ""
s10 = ""


class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

a = [ s1, s2, s3, s4 ,s5, s6, s7, s8 ];
n = a.size

puts "n  = %i" % n
puts "n! = %i" % n.fact

b = 1.upto(a.size).flat_map do |x|
  a.combination(x).to_a
end

i = 1
b.each do |ae|
  printf("%d ", i)
  ae.each { |e|
    printf(" %s ", e.to_s)
  }
  i += 1
  puts " "
end
