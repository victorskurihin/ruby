#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 4$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Из колоды в 36 карт наудачу вытаскиваются любые три. Найдите среди вытащенных
# трех карт распределение вероятностей случайной величины, равной количеству
# карт пиковой масти.
#
# В качестве ответа введите через пробел четыре числа, округленные до третьего
# знака после запятой: вероятность вытащить 0 карт пиковой масти, одну карту,
# две и три.


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

# |X| = 36, |Xп| = 9, |X / Xп| = 27
#
# P(Xx) = mx/n
# n = C(3, |X|) = C(3, 36)

# X0 = {x[i], x[j], x[k]} : x[i], x[j], x[k] in {X / Xп}
# P(X0) = m0/n : m0 = C(3, |X / Xп|) : P(X0) = C(3, 27)/C(3, 36)
px0 = (C(3,27).to_f/C(3,36)).round(3)
printf("P(X0) = C(3, 27)/C(3, 36)         = %.3f\n", px0)

# X1 = {x[i], x[j], x[k]} : x[i] in {Xп}, x[j], x[k] in {X / Xп}
# P(X1) = m1/n : m1 = C(1, |Xп|)*C(2, |X / Xп|) : P(X1) = C(1, 9)*C(2, 27)/C(3, 36)
px1 = (C(1,9)*C(2,27).to_f/C(3,36)).round(3)
printf("P(X1) = C(1, 9)*C(2, 27)/C(3, 36) = %.3f\n", px1)

# X2 = {x[i], x[j], x[k]} : x[i], x[j] in {Xп}, x[k] in {X / Xп}
# P(X2) = m2/n : m2 = C(2, |Xп|)*C(1, |X / Xп|) : P(X2) = C(2, 9)*C(1, 27)/C(3, 36)
px2 = (C(2,9)*C(1,27).to_f/C(3,36)).round(3)
printf("P(X2) = C(2, 9)*C(1, 27)/C(3, 36) = %.3f\n", px2)

# X3 = {x[i], x[j], x[k]} : x[i], x[j], x[k] in Xп
# P(X3) = m3/n : m3 = C(3, |Xп|) : P(X3) = /C(3, 36)
px3 = (C(3,9).to_f/C(3,36)).round(3)
printf("P(X3) = C(3, 9)/C(3, 36)          = %.3f\n", px3)

printf("P(X0) + P(X1) + P(X2) + P(X3)     = %.3f\n", px0+px1+px2+px3)
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
