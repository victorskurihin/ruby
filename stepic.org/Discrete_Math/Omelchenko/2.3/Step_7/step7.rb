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
  def *(a)
    if not a.kind_of? Array
      return nil
    end
    r = [[]]
    a.each_index do |l|
      v = a[l].map{Rational(0,1)}
      a.each_index {|i|
        a[i].each_index do |j|
          #v[l] = v[l] + self[i][j]*a[j][i]
          printf("v%d = v%d + s%d%d*a%d%d\n", i, i, i, j, j, i)
        end
        #p v
        r[l] = v
        #p r
      }
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
def testo(o)
  z0 = [Rational(0, 1), Rational(0, 1)]
  e1 = [Rational(1, 1), Rational(0, 1)]
  e2 = [Rational(0, 1), Rational(1, 1)]
  v1 = [Rational(2, 1), Rational(1, 1)]
  v2 = [Rational(-1, 1), Rational(2, 1)]
  v3 = [Rational(1, 1), Rational(-2, 1)]
  v4 = [Rational(10, 1), Rational(5, 1)]
  printf "z0 = "
  p z0
  z0.applyo(o)
  p z0
  printf "e1 = "
  p e1
  e1.applyo(o)
  printf "e1 = "
  p e1
  puts
  printf "e2 = "
  p e2
  e2.applyo(o)
  printf "e2 = "
  p e2
  puts
  printf "v1 = "
  p v1
  v1.applyo(o)
  printf "v1 = "
  p v1
  puts
  printf "v2 = "
  p v2
  v2.applyo(o)
  printf "v2 = "
  p v2
  puts
  printf "v3 = "
  p v3
  v3.applyo(o)
  printf "v3 = "
  p v3
  printf "v4 = "
  p v4
  v4.applyo(o)
  printf "v4 = "
  p v4
end
vo = [[ Rational(1, 1),  Rational(0, 1)  ],
      [ Rational(0, 1),  Rational(-1, 1) ]]
go = [[ Rational(-1, 1), Rational(0, 1)  ],
      [ Rational(0, 1),  Rational(1, 1)  ]]
mo = [[ Rational(6, 10), Rational(8, 10)  ],
      [ Rational(8, 10), Rational(-6, 10) ]]
puts
puts
testo(mo)
puts
puts
#p distance(e1, e2)
#v1 = [Rational(2, 1), Rational(3, 1)]
#v2 = [Rational(1, 1), Rational(2, 1)]
#p v1.proj(v2)
z0 = [Rational(0, 1), Rational(0, 1)]
e1 = [Rational(1, 1), Rational(0, 1)]
e2 = [Rational(0, 1), Rational(1, 1)]
v1 = [Rational(2, 1), Rational(1, 1)]
__END__
