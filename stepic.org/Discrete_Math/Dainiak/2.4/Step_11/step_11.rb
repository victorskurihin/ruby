#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Пусть n ⩾ 4. Сколько различных графов G на множестве вершин {1,2,…,n}, таких,
# что одновременно выполнены условия:
#
#    G связен,
#    в G нет мостов,
#    в G есть ровно одна точка сочленения,
#    (n−1) вершин графа G имеют степень не больше двойки,
#    одна вершина графа G имеет степень не больше 4.
#
# Перед отправкой проверьте работоспособность своей формулы при n=4, n=5 и n=6.
# (ceiling(1-5/n)*(n-2*floor(n/2))+n-4)/8*factorial(n)

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
  alias factorial fact
end

def f1(n)
  return (1.to_f - 5.to_f/n).ceil * (n - 2*(n.to_f/2).floor)
end

def f2(n)
  return (n - 4).to_f/8
end

def f3(n)
  one=1.to_f
  nf = n.to_f
  return (nf/8 + one/8*(n-2*(nf/2).floor)*((-5.to_f/nf).ceil+1) - one/2)*n.fact
end

def f4(n)
  return (f2(n)*n.fact).to_i
end

4.upto(11) { |n|
  #printf("f1(%2d) = %11.2f\n", n, f1(n))
  printf("f2(%2d) = %11.2f = %p\n", n, f2(n), Rational(f2(n)))
  printf("f4(%2d) = %11d\n", n, f4(n))
  #printf("f3(%2d) = %11.2f\n", n, f3(n))
  #printf("fx(%2d) = %11.2f\n", n, f2(n)*n.fact)
}
n = 100
printf("f(%2d) = %d\n", n, f2(n)*n.fact)


__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
