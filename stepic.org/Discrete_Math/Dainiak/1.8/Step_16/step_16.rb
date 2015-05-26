#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 3$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Найдите, сколькими способами из колоды в 36 карт можно вытащить пять карт
# (без учёта порядка), чтобы среди вытащенных карт были ровно два короля и
# не более одной дамы, причём, если дама есть, то её масть отличается от мастей
# обоих королей.
################################################################################
# Никак не могу понять, как подступиться к комбинациям с дамами.
# Если рассматривать вариант без дам то выходят сочетания по 3 из 28 карт.
# Если учитывать одну даму то сочетания по 3 из 29. Но как учесть вариант
# когда может быть ни одной дамы или только одна, не пойму.
##
# так я написал про свои мысли по этому поводу в комментарии. Я не пойму как их
# скомбинировать. Королей мы можем выбрать C(2, 4) способами, три карты без дам
# C(3, 28) способами, и три карты без одной из дам или с одной C(3, 29) 
# способами (но в этом случае не понятно как учесть что эта дама может быть
# одной из двух).
################################################################################
# вариант без дам верный, "отложите" его. Теперь, забыв вариант без дам,
# независимо подсчитайте вариант с 1 дамой. Так же резервируем 2 слота под
# королей, один слот под даму (одной из двух мастей) и два слота под любые
# карты, не содержащие королей и дам.
# В ходе расчётов пригодится правило умножения и правило сложения.

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

p C(2,4)*C(3,28)+C(2,4)*C(1,2)*C(2,28)

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
