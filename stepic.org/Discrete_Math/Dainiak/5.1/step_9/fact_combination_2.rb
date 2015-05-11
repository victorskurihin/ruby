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
s11 = ""
s12 = ""
s13 = ""

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

a = [ "1 "+s01,"2 "+s02,"3 "+s03,"4 "+s04 ,"5 "+s05,"6 "+s06,"7 "+s07,"8 "+s08,"9 "+s09];
i = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ];
n = a.size

puts "n  = %i" % n
puts "n! = %i" % n.fact

b = 1.upto(a.size).flat_map do |x|
  a.combination(x).to_a
end

c = 0
b.each do |ae|
  printf("?%4d ", c)
  c += 1
  ae.each { |e|
    printf("%s", e[0])
  }
  puts
  ae.each { |e|
    puts e
  }
  puts
end
