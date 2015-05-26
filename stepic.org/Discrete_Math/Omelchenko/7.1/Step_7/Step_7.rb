#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 4$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Вычислить вероятность того, что при игре в лотерею "пять из тридцати шести"
# в произвольном наборе из пяти чисел хотя бы одно будет правильным.

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

p (C(1,5)*C(4,31)).to_f/C(5,36) + # только одно
  (C(2,5)*C(3,31)).to_f/C(5,36) + # два
  (C(3,5)*C(2,31)).to_f/C(5,36) + # три
  (C(4,5)*C(1,31)).to_f/C(5,36) + # четыре
  1.0/C(5,36) # все пять

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF