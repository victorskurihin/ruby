#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 4$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

def C(k ,n)
  n.fact/(k.fact*(n-k).fact)
end

def A(k ,n)
  n.fact/(n-k).fact
end

def CC(k ,n)
  C(k, n+k-1)
end

def f0(n)
  k1 = 3.to_f/2.to_f
  p k1
  r = k1*n**2-k1*n+1
  r.to_i
end

def f1(n)
  r = C(1, n)*C(1, n-1)*C(1, n-2)
  r = r.to_f/3.fact
  r = r.to_i + C(1, n)*C(1, n-1) + n
  r.to_i
end

def f2(n)
  k1 = 1.to_f/6.to_f
  k2 = 1.to_f/2.to_f
  k3 = 1.to_f/3.to_f
  p k1
  r = k1*n**3 + k2*n**2 + k3*n
  r.to_i
end

# 6 => 10
# 5 => 6
# 4 => 3
# 3 => 1
# 2 => 0
# 1 => 0 
# n + n*(n-1) + C(2, n-1)
# n + n*(n-1) + binomial(n-1, 2)
n = 6
r1 = Range.new(1, n)
r2 = Range.new(1, n)
r3 = Range.new(1, n)

parl = 0
cube = 0
r1.each do |a|
  r2.each { |b|
    r3.each do |c|
        parl += 1
        printf("Ok  %d %d %d\n", a, b, c)
    end
  }
end
printf("n = %d; parl = %d; cube = %d\n", n, parl, cube)

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
