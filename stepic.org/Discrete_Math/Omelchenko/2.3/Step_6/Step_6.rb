#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Найдите матрицу оператора проекции на линию, проходящую через точку (3, 1)
# и начало координат.
################################################################################
class Numeric
  def degrees
    self * Math::PI / 180
  end
  def undegrees
    self * 180 / Math::PI
  end
end
class Array
  def apply(a)
    res = []
    self.each_index { |i|
      c = ""
      v = 0
      #printf("v[%d] = ", i, v)
      a[i].each_index do |j|
        #printf("%s a[%d][%d]*v[%d] = %8p*%-8p", c, i, j, j, a[i][j], self[j]);
        v = v + a[i][j]*self[j]
        c = "  + "
      end
      res[i] = v
      #puts
    }
    self.each_index { |i|
      self[i] = res[i]
    }
  end
  def proj(v)
    #((v*s)/(s*s))*s
  end
  def multoscalar(scalar)
    self.each_index { |i|
      self[i] = scalar*self[i]
    }
  end
end
def scalar_product(a, b)
  r = Rational(0,1)
  a.each_index { |i|
    r = r + a[i]*b[i]
  }
  return r
end
#a = [[0, 1], [-1, 0]]
a = [[Rational(9,10), Rational(3,10)],
     [Rational(3,10), Rational(1,10)]]
a.each_index do |i|
  a[i].each_index { |j|
    printf("a%d%d = %3p | ", i, j, a[i][j]);
  }
  puts
end
puts
e1 = [1, 0]
p e1
e1.apply(a)
p e1
e2 = [0, 1]
p e2
e2.apply(a)
p e2
v1 = [3, 1]
p v1
v1.apply(a)
p v1
v2 = [1, 3]
p v2
v2.apply(a)
p v2
puts
# http://en.wikibooks.org/wiki/Linear_Algebra/Orthogonal_Projection_Onto_a_Line
a1 = [Rational(2,1), Rational(3,1)]
b1 = [Rational(1,1), Rational(2,1)]
p scalar_product(a1, b1)
p scalar_product(b1, b1)
scalar = scalar_product(a1, b1)/scalar_product(b1, b1)
p b1.multoscalar(scalar)
###############################################################################
puts
puts
e1 = [Rational(1,1), Rational(0,1)]
b0 = [Rational(3,1), Rational(1,1)]
scalar = scalar_product(e1, b0)/scalar_product(b0, b0)
printf("Orthogonally project the vector e1 onto vector b0: %p\n", b0.multoscalar(scalar))
e2 = [Rational(0,1), Rational(1,1)]
scalar = scalar_product(e2, b0)/scalar_product(b0, b0)
printf("Orthogonally project the vector e2 onto vector b0: %p\n", b0.multoscalar(scalar))
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
