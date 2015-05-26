#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 7$
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

commands1 =
%Q(
  set terminal png size 1024, 480
  set output "step_7_1.png"
  set style line 1 lt -1 lw 1
  set style line 2 lt -1 lw 2
  set style arrow 2 head filled size screen 0.015,15,20 ls 2
  set arrow from 0,1.26e+32 to   0,1.331e+32 as 2
  set arrow from 0,1.26e+32 to 102,1.26e+32 as 2
  set y2range [1.26e+32:1.321e+32]
  set grid
  plot '-' using 1:2 axes x1y2 notitle with lines
)

commands2 =
%Q(
  set terminal png size 1024, 480
  set output "step_7_2.png"
  set style line 1 lt -1 lw 1
  set style line 2 lt -1 lw 2
  set style arrow 2 head filled size screen 0.015,15,20 ls 2
  set arrow from 0,0.99 to 0,1.051 as 2
  set arrow from 0,0.99 to 102,0.99 as 2
  set y2range [0.99:1.05]
  set grid
  plot '-' using 1:2 axes x1y2 notitle with lines
)

commands3 =
%Q(
  set terminal png size 1024, 480
  set output "step_7_3.png"
  set style line 1 lt -1 lw 1
  set style line 2 lt -1 lw 2
  set style arrow 2 head filled size screen 0.015,15,20 ls 2
  set arrow from 0,0.9 to 0,1.61 as 2
  set arrow from 0,0.9 to 202,0.9 as 2
  set y2range [0.9:1.6]
  set grid
  plot '-' using 1:2 axes x1y2 notitle with lines
)

s = 0.0
k = 1
n = 100
r = Range.new(k, n)
a = n.to_f*2.0**n
printf("%8e\n", a)
while r.include? k do
  e = 2.0**(n.to_f/k)*C(k, n)
  s += e
  d = s/a
  printf("%d %8e %8e %8e\n", k, e, s, d)
  commands1 = commands1 + sprintf("%d %e\n", k, s)
  commands2 = commands2 + sprintf("%d %e\n", k, d)
  k += 1
end
gnuplot(commands1)
gnuplot(commands2)

n = 10
while (1..200).include? n
  s = 0.0
  k = 1
  a = n.to_f*2.0**n
  while r.include? k do
    e = 2.0**(n.to_f/k)*C(k, n)
    s += e
    k += 1
  end
  d = s/a
  printf("%d %8e %8e\n", n, s, a)
  commands3 = commands3 + sprintf("%d %e\n", n, d)
  n += 1
end
gnuplot(commands3)
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
