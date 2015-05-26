#!/usr/bin/env ruby
# Для ε=1, ε=0,1 и ε=0,001 найдите соответствующие номера n, начиная
# с которых будет выполняться неравенство 5/sqrt(n) < ε
# В ответе приведите числа, разделенные пробелами.

def f1(n)
  return 5.0/Math.sqrt(n.to_f)
  #return (2*n−1)/(4*n+5)
end

1.upto(99999999) {|n|
  e = 0.001
  if f1(n) < e
    p n
    exit
  end
}