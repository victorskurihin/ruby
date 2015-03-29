#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 1$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Сколько разных слов можно получить, переставляя буквы слова «математика».
##
# допустим не 10!))) буквы же повторяются!
# м - 2 раза
# а - 3 раза
# т - 2 раза
# е - 1 раз
# и - 1
# к - 1 раз
# P(n1, n2, n3, ..., nk) = n!/(n1!n2!n3!...nk!), при чем n1 + n2 + n3 + ... + nk = n
# P(2,3,2,1,1,1) = 10!/(2!3!2!1!1!1!) = 151200
# то есть у автора вопроса - правильный ответ
################################################################################

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
  alias factorial fact
end

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

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
