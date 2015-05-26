#!/usr/bin/env ruby
s01 = "Если p′,p″∈ℙ, a∈ℕ, и p′∣a и p″∣a, то тогда p′p″∣a"
s02 = "Если p′,p″∈ℙ, a∈ℕ, p′≠p″ и если p′∣a и p″∣a, то тогда p′p″∣a"
s03 = "Если a,b∈ℕ, p∈ℙ, и если p∤a и p∤b, то тогда p∤ab"
s04 = "Если a,b∈ℕ, p∈ℙ, и если a≠b и p∤a и p∤b, то тогда p∤ab"
s05 = "Если a,b∈ℕ, p∈ℙ, и если p∣a и p∣b, то тогда p∣ab"
s06 = "Если a,b,p∈ℕ и если p∤a и p∤b, то тогда p∤ab"
s07 = "Если a,b,p∈ℕ и если p∣∣a и p∣∣b, то тогда p∣∣ab"
s08 = ""
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

a = [ s01, s02, s03, s04 ,s05, s06, s07 ];
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
