#!/usr/bin/env ruby
# Найдите матрицу оператора отражения относительно прямой x-2y = 0.
# v0 = [2, 1]
# z0 = [0, 0]
# v1 = [-1, 2]
# v2 = [1, -2]
# A - ?
# A*z0 = z0
# A*v0 = v0
# A*v1 = v2
# A*v2 = v1
# a00*2 + a01*1 a10*0 + a11*0 = 2
# a00*0 + a01*0 a10*2 + a11*1 = 1
# a00*2 + a01*1 a10*0 + a11*0 = 1
# a00*0 + a01*0 a10*2 + a11*1 = -2
# a00 = 0.6
# a01 = 0.8
# a10 = 0.8
# a11 = -0.6
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
a = [[1,2],[3,4]]
b = [[5,6],[7,8]]
p a+b
p a*b
a = [[0,1,2],[10,11,12]]
b = [[800,1800],[10800,11800],[20800,21800]]
p a*b
a = [[0,1,2],[10,11,12],[20,21,22]]
b = [[800,1800,2800],[10800,11800,12800],[20800,21800,22800]]
p a+b
p a*b
__END__
