#!/usr/bin/env ruby
#
#

def sum(n)
  s = 0
  i = 0
  while i < (1.0/n).to_i do
    i += 1
    s += i
  end
  return s
end

def f1(s, x)
  return x**2*s
end

from = 100

1.upto(from) { |n|
  x = 1.0/n
  s = sum(x)
  f = f1(s, x)
  printf("n: %d; x: %.2f; s: %d; f1: %.4f\n", n, x, s, f)
}
