#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 7$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# http://www.problems.ru/view_problem_details_new.php?id=60343
# Сколько десятизначных чисел, в записи которых имеются хотя бы две одинаковые
# цифры?
# 
# Найдем количество десятизначных чисел, в которых все цифры разные. На первом
# месте в таком числе может стоять любая из 9 отличных от нуля цифр, на втором
# – любая из 9 цифр, отличных от первой, для третьей цифры остается уже 8
# вариантов и т. д. Всего получаем 9·9! чисел. Осталось вычесть это количество
# из количества 9·109 всех десятизначных чисел (см. решение задачи 60336).

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


p 9*10**9-9*9.fact

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
