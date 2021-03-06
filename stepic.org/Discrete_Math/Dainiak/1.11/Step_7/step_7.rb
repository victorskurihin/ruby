#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 9$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Сколько различных слов, отличающихся от слова «антигравитация» лишь
# перестановкой букв, таких, что в этих словах не встречаются две гласные
# подряд?
#
# Можно посчитать сначала количество «шаблонов слов», т.е. способов
# прочередовать гласные буквы с согласными, а затем посчитать, сколькими
# способами каждый такой шаблон можно превратить в конкретное слово.
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

# полиномиальный коэффициет:
# перестановки с повторениями
# C(k, n) == PK(n, k, n-k)
def PK(n, *k)
  return nil if n < 0
  pp = 1
  k.each {|e| pp = pp*e.fact }
  n.fact/pp
end

# Решение:
# В слове антигравитация 14 букв:
# а => 3 раза
# н => 1
# т => 2
# и => 3
# г => 1
# р => 1
# в => 1
# ц => 1
# я => 1
# размещения удовл. условию 8
# ГСГСГСГСГСГСГС
# ГСГСГСГСГСГССГ
# ГСГСГСГСГССГСГ
# ГСГСГСГССГСГСГ
# ГСГСГССГСГСГСГ
# ГСГССГСГСГСГСГ
# ГССГСГСГСГСГСГ
# CГСГСГСГСГСГСГ
p PK(7, 3, 3, 1)*PK(7,1,2,1,1,1,1)*8

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
