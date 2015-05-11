#!/usr/bin/env ruby
s01 = "Если a=mb, то b=ma"
s02 = "Если a=mb и b=mc, то a=mc"
s03 = "Если a,b∈ℕ, то a∣b тогда и только тогда, когда a=b0"
s04 = "Если a,b∈ℕ, то a∣b тогда и только тогда, когда b=a0"
s05 = "Если a,b∈ℕ, то a∣b тогда и только тогда, когда a=2b"
s06 = "Если a∈ℕ и m∈ℕ∩[2,+∞), то найдётся такое число r∈{0,1,2,…,m−1}, что r=ma"
s07 = "Если a=b, то a=mb для любого m"
s08 = "Если a≠b, то можно указать m, такое, что a≠mb"
s09 = "Сказать, что натуральное число a нечётное — равносильно тому, чтобы написать a=21"
s10 = ""
s11 = "Всегда {x+1}={x}."
s12 = "Всегда ⌈x⌉⩽x."
s13 = "Всегда ⌊x⌋⩾x."

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

a = [ s01, s02, s03, s04 ,s05, s06, s07, s08, s09 ];
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
