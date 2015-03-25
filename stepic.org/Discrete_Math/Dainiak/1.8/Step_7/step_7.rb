#!/usr/bin/env ruby
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 5$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Сколькими способами можно разложить a одинаковых шаров по b различным ящикам,
# так, чтобы в каждом ящике было хотя бы по два шара?
# (Предполагается, что a >= 2*b.)
# Подсказка: вспомните, как считали сочетания с повторениями.
#
# Перевернул задачу с ног на голову. Ящики - суть элементы, количество шаров в
# них - вес, либо для аналогии, сколько ящик повторится :). Порядок ящиков не
# важен, значит дело имеем с сочетанием. Мы знаем, что в ящике должно лежать
# минимум 2 шара, значит из общего количества шаров можем убрать 2⋅b шаров.
# При этом получается k-сочетание, где в каждом ящике может дополнительно
# лежать от 0 до k шаров, при этом k=a−2⋅b. Элементы в сочетании - ящики, при
# этом n=b. Выход, что всего комбинаций: 
# n = b, k = a - 2*b
# CC(a - 2*b, b) = C(a - 2*b, b + a - 2*b - 1)
# C(a - 2*b, a - b - 1)= binomial(a - b - 1, a - 2*b)

class Xs                # represent a string of 'x's
  include Comparable
  attr :length
  def initialize(n)
    @length = n
  end
  def succ
    Xs.new(@length + 1)
  end
  def <=>(other)
    @length <=> other.length
  end
  def to_s
    sprintf "%2d #{inspect}", @length
  end
  def inspect
    'x' * @length
  end
end

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

i = 0
k = 5
b = 10**(k-1)
e = 10**k-1
printf("b                             = %d\n", b)
printf("e                             = %d\n", e)
printf("k                             = %d\n", k)
printf("10**(k-1)                     = %d\n", 10**(k-1))
printf("10**(k-1)-9**(k-1)            = %d\n", 10**(k-1)-9**(k-1))
printf("10**k-9**k                    = %d\n", 10**k-9**k)
printf("10**k-9**k-(10**(k-1)-9**(k-1)) = %d\n", 10**k-9**k-(10**(k-1)-9**(k-1)))
r = Range.new(b, e)
r.each { |n|
  if n.to_s =~ /7/
    i += 1
  end
}
p i
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
