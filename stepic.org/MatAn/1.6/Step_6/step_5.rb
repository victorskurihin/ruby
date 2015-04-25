#!/usr/bin/env ruby

a =  500.0
b = 1000.0

x = [a, b]

def f1(n, x)
  return n.to_f*Math.log(2)*x.to_f**(n-1)*Math.log(x)
end

def f2(a,b)
  return a+(b-a).to_f*2.to_f/3
end

def f3(n)
  return (((-1)**n)*(n-1).to_f/(n+1) + Math.sin((3*2*Math.atan2(1,0)*n).to_f/4)**2)
end


2.upto(99) {|n|
  p f1(n ,2.0/3)
}
