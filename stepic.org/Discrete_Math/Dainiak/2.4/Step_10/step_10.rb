#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Пусть n⩾5. Сколько неизоморфных n-вершинных графов G, таких, что одновременно
# выполнены условия:
#                   δ(G)⩾1,
#                   Δ(G)=2,
#                   в G не более двух компонент связности.
#

def f1(n)
  c1=Rational(1, 2)
  c2=Rational(-11, 2)
  c3=Rational(2, 1)
  return ((-1)**n*c1 + c2 + c3*n).to_i
end
def f2(n)
  c1=Rational(25, 2)
  c2=Rational(-2, 1)
  c3=Rational(13, 2)
  return ((c1 + c2*n)*(-1)**n + c3).to_i
end

5.upto(10) { |n|
  printf("f(%2d) = %d\n", n, f1(n))
}
n = 200_000
printf("f(%2d) = %d\n", n, f1(n))


__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
