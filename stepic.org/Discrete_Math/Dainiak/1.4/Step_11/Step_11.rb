#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 1$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
def log2(x)
  return Math.log(x, 2)
end

(1024..1124).each do |k|
  #t1f = Float(0)
  #t1f = x.to_f
  #t1i = t1f.ceil.to_i
  #t2f = Float(0)
  #t2f = (n.to_f + m.to_f - 1) / m.to_f
  #t2i = t2f.floor.to_i
  #printf("n = %2d, m = %2d, t1f = %5.2f, t1 = %2d <=> t2 = %2d, t2f = %5.2f\n",
  #       n, m, t1f, t1i, t2i, t2f)
  # printf("xf = %5.2f, yf = %5.2f, l = %2d <=> r = %2d => %p\n", xf, yf, l, r, l <= r)
  lkf = (2*k-1).to_f
  lf = log2(lkf)
  rf = log2(k.to_f)
  l = lf.to_f.ceil.to_i
  r = rf.to_f.ceil.to_i
  printf("k = %2d, lf = %5.2f, rf = %5.2f, l = %2d <=> r = %2d\n", k, lf, rf, l, r)
end

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
