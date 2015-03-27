#!/usr/bin/env ruby

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
