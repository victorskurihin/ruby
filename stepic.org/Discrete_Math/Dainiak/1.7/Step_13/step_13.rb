#!/usr/bin/env ruby

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

def C(k ,n)
  n.fact/(k.fact*(n-k).fact)
end

def CC(k ,n)
  C(k, n+k-1)
end
