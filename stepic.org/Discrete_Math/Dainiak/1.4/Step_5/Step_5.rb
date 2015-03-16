#!/usr/bin/env ruby
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 1$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
A = 1
B = 0
C = 0
D = -1
(1..99).each do |n|
  af = Float(n)
  af = (af/2).floor
  a = af
  bf = Float(n)
  bf = (bf/2).ceil
  b = bf
  cf = Float(n)
  cf = (cf/3).floor
  c = cf
  df = Float(n)
  df = (df/3).ceil
  d = df
  r = 0
  #x2 = a - c
  x2 =  a - d + 1
  (0..99).each { |x|
    if 2*x <= n && 3*x >= n then
      r += 1
      printf("n = %d, x = %d\n", n, x)
    end
  }
  printf("n = %2d, r = %2d, a = %2d, b =%2d, c = %2d, d = %2d, x2 = %2d, r - x = %d\n", n, r, a, b, c, d, x2, r - x2)
end


__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
