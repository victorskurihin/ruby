#!/usr/bin/env ruby

a =  500.0
b = 1000.0

x = [a, b]

def f1(x, n)
  x1 = x[x.size - 2]
  x2 = x[x.size - 1]
  x << (x1 + x2).to_f/2
  x.delete_at(0) if x.size > 1000
  return x[x.size - 1]
end

def f2(a,b)
  return a+(b-a).to_f*2.to_f/3
end


3.upto(9_999) {|n|
  p f1(x, n)
  p f2(a, b)
}
p x.size
