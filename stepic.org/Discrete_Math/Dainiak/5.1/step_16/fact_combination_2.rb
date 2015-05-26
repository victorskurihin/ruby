#!/usr/bin/env ruby
s01 = "1 В отрезке натуральных чисел от n!+2 до n!+n всегда есть хотя бы одно простое число"
s02 = "2 Если a — простое число и если p — произвольное натуральное, то pa=ap"
s03 = "3 Остаток при делении отрицательного целого числа на натуральное — всегда отрицательный"
s04 = "4 Пусть a,b,m∈ℕ и a>b и a=mb. Тогда (a−b)⩾1"
s05 = "5 Пусть a,b,m∈ℕ и a>b и a=mb. Тогда (a−b)⩾m"
s06 = "6 Пусть a,b,m∈ℕ и a>b и a≠mb. Тогда (a−b)⩾1"
s07 = "7 Пусть a,b,m∈ℕ и a>b и a≠mb. Тогда (a−b)⩾m"
s08 = "8 Пусть p∈ℙ и a,b∈ℕ. Если p∤a и p∤b, то p∤ab"
s09 = "9 Пусть p∈ℙ и a,b∈ℕ. Если p∣a и p∣b, то p∣ab"
s10 = ""
s11 = ""
s12 = ""
s13 = ""

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

a = [ s01, s02, s03, s04 ,s05, s06, s07, s08, s09 ];
i = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ];
n = a.size

puts "n  = %i" % n
puts "n! = %i" % n.fact

b = 1.upto(a.size).flat_map do |x|
  a.combination(x).to_a
end

c = 0
b.each do |ae|
  printf("%4d ", c)
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
