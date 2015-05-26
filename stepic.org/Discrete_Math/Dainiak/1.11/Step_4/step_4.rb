#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 9$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Пусть α(n) — количество слов длины n из нулей и единиц, в которых три нуля не
# встречаются подряд. Пусть β(n) — количество слов с таким же свойством, которые
# вдобавок не заканчиваются на два нуля. Вставьте вместо букв A,B,C нужные
# выражения, так, чтобы получились верные равенства: 
# α(n) = α(n) + A(B)
# β(n) = α(B) + α(C) 
#

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

# k-размещений с повторениями: Ā(k, n) = n**k
# <=> n-размещений из k Ā(n, k) = Āⁿₖ = kⁿ
# k-размещений с без повторений: A(k, n) = n!/(n-k)!
def A(k, n)
  return nil if n < 0 or k < 0 or n < k
  n.fact/(n-k).fact
end

# k-сочетаний без повторений: C(k, n) = n!/((n-k)!∙k!)
def C(k, n)
  return nil if n < 0 or k < 0 or n < k
  n.fact/((n-k).fact*k.fact)
end

def CC(k ,n)
  C(k, n+k-1)
end

# полиномиальный коэффициет:
def P(n, *k)
  return nil if n < 0
  pp = 1
  k.each {|e| pp = pp*e.fact }
  n.fact/pp
end

def ab(n)
  r = Range.new(0, 2**n - 1)
  f = sprintf("%%0%db", n)
  a = 0; b = 0
  r.each { |i|
    s = sprintf(f, i)
    if s !~ /000/
      a += 1 
      if s !~ /00$/
        b += 1
      end
    end
    # printf("%s => %d\n", s, i);
  }
  printf("α(%d) = %d \nβ(%d) = %d \n", n, a, n, b)
end

n = 8
printf("n = %d\n", n)
ab(n)

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
