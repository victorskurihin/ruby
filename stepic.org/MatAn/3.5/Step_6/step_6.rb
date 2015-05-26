#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 3$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Оцените погрешность в формуле Тейлора с остатком в форме Лагранжа для функции
# f(x) = (1 + 2x)^(1/3) в точке x₀ = 0 при 0 ≤ x ≤ ½
#
# Не могу понять  как решить задачу.
# Нам сначала надо найти остаток в форме Лагранжа. Он находится по формуле:
# f^(n+1)(c)/(n+1)!*(x - x₀)^(n+1)
# при n = 2, x₀=0
# f^(2+1)(c)/(2+1)!*(x-0)^(2+1)=f^(3)(c)/(3)!*(x)^3

def f1(x)
  return (1 + 2*x)**(1/3)
end

def f2(x)
  return (1 + 2*x/3 - 4*x**2/9)
end

def r(x, c)
  return (80*x**3)/(6*27*(2*c+1)**(8/3))
end

x = 0.0
i1 = 0.001
r1 = Range.new(0.0, 0.5)
max = -2e308
min =  8e307
while r1.include? x
  c = 0.0
  r2 = Range.new(0.0, x)
  while r2.include? c
    r = r(x, c)
    max = r if max < r
    min = r if min > r
    c += i1
  end
  # d = f1(x) - f2(x)
  # max = d if max < d
  # min = d if min > d
  printf("x: %.2f; f1(x) - f2(x): %.5f; min: %.5f; max: %.5f\n", x, f1(x) - f2(x), min, max)
  x += i1
end


__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
