#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.2$
# $Revision: 11$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
  alias factorial fact

  # calculates binomial coefficient of self choose k
  # not recommended for large numbers as binomial coefficients get large quickly... e.g. 100 choose 50 is 100891344545564193334812497256
  def choose(k)
    return 0 if (k > self)
    n = self
    r = 1
    1.upto(k) do |d|
      r *= n
      r /= d
      n -= 1
    end
    return r
  end
end

class Float
  def fact
    Math.sqrt(2*Math::PI*self)*(self/Math::E)**self
  end
  alias factorial fact
  def to_rad
    self*Math::PI/180
  end
  def to_gradus
    (self*180).to_f/Math::PI
  end
end
# extremum 170.6.fact

class Array
  # when called without a block, returns an array with each combination.
  # when called with a block, yields each combination to the block.
  def each_choose(k, &block)
    raise ArgumentError, "The combination size (#{k}) must be <= the array size (#{size}).", caller if k > size
    raise ArgumentError, "The combination size (#{k}) cannot be negative.", caller if k < 0
    if block == nil
      results = []
      size.choose(k).times { |i| results << choose_index(k, i) }
      return results
    end
    size.choose(k).times { |i| yield choose_index(k, i) }
  end

  # returns the combination at index i of self.each_choose(k)
  def choose_index(n, i)
    results = []
    size.times do |x|
      break if n == 0
      threshold = (size - x - 1).choose(n - 1)
      if i < threshold
        results << self[x]
        n -= 1
      else
        i = i - threshold
      end
    end
    return results
  end
end

# (n)ₖ
# убывающая факториальная степень P(k, n) = (n)k = n∙(n-1)∙...∙(n-k+1)
# P(k, n) = A(k, n)
def P(k, n)
  b = n - k + 1
  (b..n).reduce(:*) || 1
end
# (0...n).to_a.permutation(k){|c| p c}
# k-размещений с без повторений: A(k, n) = n!/(n-k)!
def A(k, n)
  return 0 if k > n or k < 0
  return nil if n < 0 or k < 0 or n < k
  n.fact/(n-k).fact
end

# (0...n).to_a.repeated_permutation(k){|c| p c}
# k-размещений с повторениями: Ā(k, n) = n**k
# <=> n-размещений из k Ā(n, k) = Āⁿₖ = kⁿ
def AA(k, n)
  return n**k
end

# (0...n).to_a.combination(k){|c| p c}
# Биномиальный коэффициент
# k-сочетаний без повторений: C(k, n) = n!/((n-k)!∙k!)
def C(k, n)
  return 0 if k > n or k < 0
  return nil if n < 0
  n.fact/((n-k).fact*k.fact)
end
alias binomial C

def negatC(k, n)
  return (-1)**k*C(k, n+k-1)
end

# Computing Binomial Coefficients using Recursion
# nCr = (n-1)*C(r) + (n-1)*C(r-1)
def nCr(n, r)
    return 1 if n == r
    return n if r == 1
    return 1 if n == 0
    nCr(n-1,r) + nCr(n-1,r-1)
end

# def binomial(n, k):
#     if k == 0:
#         return 1
#     elif 2*k > n:
#         return binomial(n,n-k)
#     else:
#         e = n-k+1
#         for i in range(2,k+1):
#             e *= (n-k+i)
#             e /= i
#         return e
def binomialC(n, k)
    return (-1)**k*binomialR((-1)*n+k-1, k) if n < 0
    return 0 if n < k
    return binomialR(n, k)
end
def binomialR(n, k)
    if 0 == k
        return 1
    elsif 2 * k > n
        return binomialR(n, n - k)
    else
        e = n - k + 1
        2.upto(k) { |i|
            e *= (n - k + i)
            e /= i
        }
        return e
    end
end
def negatBinomialC(n, k)
  return (-1)**k*binomialR((-1)*n+k-1, k)
end

def catalan(n)
    return binomialC(2*n, n)/(n + 1)
end

# (0...n).to_a.repeated_permutation(k){|c| p c}
# k-сочетаний c повторениями: ((n k))
# CC(k, n) = C(k, n+k-1)
# CC(k, n) = P(k, n)/k.fact
# CC(k ,n) = PK(n - 1 + k, k, n - 1)
# CC(k, n) = ((n k)) = (-1) = (n+k-1)!/(k!∙(n-1)!)
def CC(k ,n)
  C(k, n+k-1)
end

# кол-во упорядоченных k-разбиений n-элементного м-ва
# сюрективное отображение n-элементного м-ва в k-элементное м-во
def SS(n, k)
  r = 0
  (0..(k)).each { |i|
    r = r + (-1)**(k-i)*C(i, k)*i**n
  }
  r
end

# кол-во неупорядоченных разбиений n-эл-ного множества на k непустых подмн-в.
# числа Стирлинга второго рода
def Stirling2(n, k)
  r = 0
  (0..(k)).each { |i|
    r = r + (-1)**(k-i)*C(i, k)*i**n
  }
  r/k.fact
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

A=1.3063778838630806904686144926026057129167845851567136443680537599664340537668


def mills_prime_repr_func(k)
  (A**(3**k)).floor
end
alias prime mills_prime_repr_func

def mersenne_numbers(n)
  2**n-1
end

# равенство по модулю
# «числа a и b равны по модулю m», если остаток при делении a на m равен
# остатку при делении b на m, то есть, если
# a mod m =b mod m.
def mod_eql(a, b, m)
  (a % m) == (b % m)
end

def product_vector(a, b)
  result = 0
  a.each_index {|i| 
    result += a[i] * b[i]
  }
  return result
end

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
