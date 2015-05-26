#!/usr/bin/env ruby
s1 = "Pr(AB) <= max{Pr(A), Pr(B)}"
s2 = "Если B∩C = 0, то Pr(A∩(B∪C)) <= Pr(AB)+Pr(AC)"
s3 = "Pr(A∪B) >= Pr(A)+Pr(B)"
s4 = "Pr(A∪B) = Pr(A)+Pr(B)"
s5 = "Pr(AB) >= min{Pr(A), Pr(B)}"
s6 = "Pr(A∪B) = Pr(A)+Pr(B)−Pr(AB)"
s7 = "Если B∩C = 0, то Pr(A∩(B∪C))=Pr(AB)+Pr(AC)"
s8 = "Pr(A∪B) <= Pr(A)+Pr(B)"
s9 = "Pr(AB) <= min{Pr(A), Pr(B)}"

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

a = [ s1, s2, s3, s4 ,s5, s6, s7, s8, s9 ];
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
