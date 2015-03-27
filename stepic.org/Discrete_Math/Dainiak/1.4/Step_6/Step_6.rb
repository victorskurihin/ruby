#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 1$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
(1..99).each do |n|
  af = Float(n)
  af = (af/2).floor
  a = af
  bf = Float(n)
  bf = (bf/2).ceil
  b = bf
  y = a + b
  printf("n = %2d, y(n) = a + b = %2d, n - 1 = %d\n", n, y, (n + 1))
end


__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
