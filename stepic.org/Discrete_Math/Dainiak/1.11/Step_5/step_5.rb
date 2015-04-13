#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 9$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Пусть α(n) — количество слов длины n из нулей и единиц, в которых не
# встречается подслово «101». Самостоятельно придумайте рекуррентное
# соотношение для α(n). Для этого вначале может потребоваться ввести ещё
# вспомогательную последовательность β(n), как в предыдущем шаге. Но затем
# избавьтесь от β, перевыразив всё через α. После того, как Вы это сделаете,
# у Вас получится соотношение: 
#   α(n)=A*α(n−1)+B*α(n−2)+C*α(n−3),
# где A, B и C — некоторые небольшие константы. Укажите их. 

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
    if s !~ /101/
      a += 1 
    end
    # printf("%s => %d\n", s, i);
  }
  # printf("α(%d) = %d \nβ(%d) = %d \n", n, a, n, b)
  printf("α(%d) = %d \n", n, a)
end

n = 8
3.upto(9) {|n|
  printf("n = %d\n", n)
  ab(n)
}

def a1(n)
  t = 3.to_f
  (1.0/t)*(2.to_f**n)-(1.0/t)*((-1)**n)
end

def a2(n)
  -1*(-1)**n
end

0.upto(5) {|n|
  p a1(n)
  p a2(n)
}
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
#
#
from sympy import binomial as C

r = 15; s = 10; n = 9

sum(C(r,n-k)*C(s,k) for k in range(n+1)) == C(r+s,n)

Out[48]: True\

  binomial(r+s,n)

