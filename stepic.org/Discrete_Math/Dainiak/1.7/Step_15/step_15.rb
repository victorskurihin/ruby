#!/usr/bin/env ruby
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 3$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
  alias factorial fact
end

# k-размещений с повторениями: Ā(k, n) = n**k
# <=> n-размещений из k Ā(n, k) = Āⁿₖ = kⁿ
# k-размещений с без повторений: A(k, n) = n!/(n-k)!
# k = floor(n/3), n = 2n : (2*n)!/(2*n - floor(n/3))!
# k = k , n = p : (p!/(p! - k!))
# k = n - k , n = q : (q!/(q! - (n - k)!))
# (p!/(p! - k!))*(q!/(q! - (n - k)!))
#
# n = p, k = k
# binomial(n, k) => binomial(p, k)
# n = q, k = n - k
# binomial(n, k) => binomial(1, n-k)
# binomial(p, k)*binomial(1, n-k)
# n = 11, k = 3
# k*(n!/(n-k)!)
# k*binomial(n, k)
# 9*10**(к-1)-8**(к-1)
# 9*10**(k-1)-8**(k-1)
# binomial(n*n,1)*binomial(n*n-2*n-1,1)
# n**2*
#
# n = b, k = a - 2*b
# CC(a - 2*b, b) = C(a - 2*b, b + a - 2*b - 1)
# C(a - 2*b, a - b - 1)= binomial(a - b - 1, a - 2*b)

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

def S(k ,n)
  C(k, n+k-1)
end

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
