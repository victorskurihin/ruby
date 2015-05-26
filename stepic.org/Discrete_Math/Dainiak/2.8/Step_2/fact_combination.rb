#!/usr/bin/env ruby
s1 = 'Диаметр полного графа на 2015 вершинах равен единице.'              #ok
s2 = 'Если из дерева удалить ребро, получится лес.'                       #ok
s3 = 'Графы Cm и Kn могут быть изоморфны при некоторых m,n. '             #ok
s4 = 'Для любого n⩾3 выполнено равенство χ(Cn)=χ′(Cn).'                   #ok
s5 = 'При n>2 неизоморфных графов на n вершинах строго меньше, чем различных графов на вершинах {1,2,…,n}.'
s6 = 'Если графы G и H изоморфны, то графы G⎯ и H⎯ тоже изоморфны. '      #??
s7 = 'В двоичной последовательности де Брёйна порядка n ровно (2n+n−1) символов.'
s8 = 'В унициклическом графе каждое ребро является мостом.'                #not
s9 = 'Диаметр полного графа на 2015 вершинах равен нулю.'                  #not
s10 = 'В непланарном графе рёбер всегда хотя бы втрое больше, чем вершин.' #not
# Диаметр графа всегда строго больше радиуса. 


class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

a = [s1, s2, s3, s4 ,s5, s6, s7];
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