#!/usr/bin/env ruby
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 5$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Чему равен полиномиальный коэффициент (   100  )
#                                       ( 98 1 1 )

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
p 100.fact/(98.fact*1*1)
p P(100, 98, 1, 1)

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
