#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 9$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
  alias factorial fact
end

class Float
  def fact
    Math.sqrt(2*Math::PI*self)*(self/Math::E)**self
  end
  alias factorial fact
  def to_rad
    self*Math::PI/180
  end
  def to_gradus
    (self*180).to_f/Math::PI
  end
end
# extremum 170.6.fact

# убывающая факториальная степень P(k, n) = (n)k = n∙(n-1)∙...∙(n-k+1)
# P(k, n) = A(k, n)
def P(k, n)
  b = n - k + 1
  (b..n).reduce(:*) || 1
end

# <=> n-размещений из k Ā(n, k) = Āⁿₖ = kⁿ
# k-размещений с без повторений: A(k, n) = n!/(n-k)!
def A(k, n)
  return 0 if k > n or k < 0
  return nil if n < 0 or k < 0 or n < k
  n.fact/(n-k).fact
end

# k-размещений с повторениями: Ā(k, n) = n**k
def AA(k, n)
  return n**k
end

# k-сочетаний без повторений: C(k, n) = n!/((n-k)!∙k!)
def C(k, n)
  return 0 if k > n or k < 0
  return nil if n < 0
  n.fact/((n-k).fact*k.fact)
end
alias binomial C

# k-сочетаний c повторениями: CC(k, n) = C(k, n+k-1)
def CC(k ,n)
  C(k, n+k-1)
end

# сюрективное отображение n-элементного м-ва в k-элементное м-во
def SS(n, k)
  r = 0
  (0..(k)).each { |i|
    r = r + (-1)**(k-i)*C(i, k)*i**n
  }
  r
end

# полиномиальный коэффициет:
# перестановки с повторениями
# C(k, n) == PK(n, k, n-k)
def PK(n, *k)
  return nil if n < 0
  pp = 1
  k.each {|e| pp = pp*e.fact }
  n.fact/pp
end

def PKf(n, *k)
  return nil if n < 0
  pp = 1
  k.each {|e| pp = pp*e.fact }
  n.fact.to_f/pp.to_f
end

def fib(n)
  f = Math.sqrt(5)
  t = 2.to_f
  r = (1.0/f)*((1 + f)/t)**n - (1.0/f)*((1 - f)/t)**n
  if n.kind_of? Fixnum and n.abs < 1474
    return r.round.to_i
  else
    return r
  end
end

def luc(n)
  f = Math.sqrt(5)
  t = 2.to_f
  r = ((1 + f)/t)**n + ((1 - f)/t)**n
  if n.kind_of? Fixnum and n.abs < 1474
    return r.round.to_i
  else
    return r
  end
end

def gnuplot(commands)
  IO.popen("gnuplot", "w") {|io| io.puts commands}
end

file1 = 'step_8_1.txt'
file3 = 'step_8_3.txt'

commands1 = <<"EOF"
  set terminal png size 1024, 480
  set output "step_8_1.png"
  set style line 1 lt -1 lw 1
  set style line 2 lt -1 lw 2
  set style arrow 2 head filled size screen 0.015,15,20 ls 2
  set arrow from 17,-2.3e+10 to 17,2.6001e+12 as 2
  set arrow from 17,-2.3e+10 to 20.03,-2.3e+10 as 2
  set xtics 17, 1
  set y2range [-500000:3.0e+12]
  set key left top vertical Left spacing 1.5
  set grid
  set autoscale fix
  plot '#{file1}' using 1:2                 title " " pt 5, \
       '#{file1}' using 1:2 smooth csplines title " " with lines lt -1
EOF

# plot '-' using 1:2 axes x1y2 title "1" with lines, '-' using 3:4 smooth bezier title "2" lt -1
commands2 =
%Q(
  set terminal png size 1024, 480
  set output "step_8_2.png"
  set grid
  plot '-' using 1:2 axes x1y2 notitle with lines
)

commands3 =
%Q(
  set terminal png size 1024, 480
  set output "step_8_3.png"
  set style line 1 lt -1 lw 1
  set style line 2 lt -1 lw 2
  set style arrow 2 head filled size screen 0.015,15,20 ls 2
  set arrow from 1,1 to 1,2.43e+0 as 2
  set arrow from 1,1 to 20.03,1 as 2
  #set ytics 1, 0.1
  set xtics 1, 1
  set y2range [0:2.41e+0]
  set autoscale fix
  set grid
  plot '#{file3}' using 1:2                 title " " pt 5, \
       '#{file3}' using 1:2 smooth csplines title " " with lines lt -1
)
command11 = ""
s = 0.0
k = 1
n = 20
r = Range.new(k, n)
a = (Math.sqrt(2*Math::PI*n)*n**n)/((Math::E*2)**n)
# printf("%8e\n", a)
File.open(file1, 'w') { |file|
  while r.include? k do
    e = (k.fact).to_f/(2.0**k)
    s += e
    d = s/a
    #printf("%d %8e %8e %8e\n", k, e, s, d)
    printf("%d %e %d %e\n", k, s, k, s) if k > 16
    commands1 = commands1 + sprintf("%d %e %d %e\n", k, s, k, s) if k > 16
    #command11 = command11 + sprintf("%d %e %d %e\n", k, s, k, s) if k > 16
    commands2 = commands2 + sprintf("%d %e\n", k, d) if k > 10
    k += 1
  end
  file.write(commands1) 
}
gnuplot(commands1)
gnuplot(commands2)

k = 1
n = 20
r = Range.new(k, n)
a = (Math.sqrt(2*Math::PI*n)*n**n)/((Math::E*2)**n)
# printf("%8e\n", a)
n = 1.0
File.open(file3, 'w') { |file|
  commands3 = commands3 + sprintf("%.1f %e\n", 1, 1.0)
  while (1.0..20.1).include? n
    s = 0.0
    k = 1
    a = (Math.sqrt(2*Math::PI*n)*n**n)/((Math::E*2.0)**n)
    while k < (n+1) do
      e = (k.fact).to_f/(2.0**k)
      s += e
      k += 1
    end
    d = s/a
    printf("%.1f %8e %8e %8e\n", n, s, a, d)
    commands3 = commands3 + sprintf("%.1f %e\n", n, d)
    n += 1
  end
  file.write(commands3) 
}
gnuplot(commands3)
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
#
max 0.5 2.5 4.5
min 1.5 3.5
