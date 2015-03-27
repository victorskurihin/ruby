#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 1$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Найдите матрицу А оператора, который сначала растягивает вектор вдоль оси
# Ox в два раза, а затем поворачивает его против часовой стрелки на 45
# градусов. 
#
# На рисунке изображена синяя окружность, которая под действием описанного
# оператора переходит в красный овал.
#
# Для этого найдите матрицы каждого из отдельных преобразований. В качестве
# ответа укажите матрицу, равную сумме матриц операторов поворота, растяжения
# и найденной матрицы А. При вводе ответа числа округляйте до третьего
# знака после запятой.
#
# a=r*z
# p a+z+r
#
class Numeric
  def degrees
    self * Math::PI / 180 
  end
  def undegrees
    self / Math::PI * 180 
  end
end
def distance(a, b)
  r = Rational(0, 1)
  a.each_index { |i|
    t = Rational(a[i] - b[i])
    r = r + t*t;
  }
  Math.sqrt(r)
end
class Array
  def applyo(a)
    v = []
    a.each_index { |i|
      c = ""
      r  = 0
      # printf(" v%d =", i)
      a[i].each_index do |j|
        # printf("%s a%d%d*%d |", c, i, j, self[j])
        r = r + a[i][j]*self[j]
        c = " +"
      end
      # puts
      v[i] = r
    }
    v.each_index { |i|
      self[i] = v[i]
    }
  end
  def +(b)
    if not b.kind_of? Array
      return nil
    end
    if self.size != b.size
      return nil
    end
    r = self.map{self[0].map{0}}
    p r
    self.each_index { |i|
      if not self[i].kind_of? Array or not b[i].kind_of? Array
        return nil
      end
      if self[i].size != b[i].size
        return nil
      end
      #r = self[i].map{0}
      self[i].each_index do |j|
        r[i][j] = self[i][j] + b[i][j]
      end
    }
    r
  end
  def *(x)
    if not x.kind_of? Array
      return nil
    end
    a = nil
    b = nil
    r = [[]]
    min, max = 0, 0
    if self.size <= x.size
      min, max = self.size, x.size
      a, b = self, x
    else
      min, max = x.size, self.size
      a, b = x, self
    end
    i = 0
    while i < min
      j = 0
      v = b[i].map{0}
      while j < min
        k = 0
        c = ""
        while k < max
          v[j] = v[j] + a[i][k]*b[k][j]
          #printf("%s v%d = v%d + a%d%d*b%d%d",
          #       c, j, j, i, k, k, j)
          c = " +"
          k += 1
        end
        #puts
        j += 1
      end
      r[i] = v
      i += 1
    end
    r
  end
  def scalar_product(v)
    r = Rational(0, 1)
    v.each_index { |i|
      r = r + self[i]*v[i]
    }
    r
  end
  def modulus_vector
    r = Rational(0, 1)
    self.each_index { |i|
      r = r + self[i]*self[i]
    }
    Math.sqrt(r)
  end
  def proj!(v)
    r1 = scalar_product(v)
    r2 = scalar_product(self)
    self.each_index { |i|
      self[i] = self[i]*r1/r2
    }
  end
  def proj(v)
    r = []
    r1 = scalar_product(v)
    r2 = scalar_product(self)
    self.each_index { |i|
      r[i] = self[i]*r1/r2
    }
    r
  end
end
alpha45 = Math.atan2(1,1)
r = [[Math.cos(alpha45),-Math.sin(alpha45)],
     [Math.sin(alpha45), Math.cos(alpha45)]]
z = [[2, 0],[0, 1]]
a=r*z
p a+z+r
z0 = [0, 0]
e1 = [1, 0]
e2 = [0, 1]
v1 = [1, 1]
printf("e1   = %p\n", e1)
printf("e1*Z = %p\n", e1.applyo(z))
printf("v1   = %p\n", v1)
printf("v1*Z = %p\n", v1.applyo(z))
__END__
