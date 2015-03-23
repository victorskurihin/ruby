#!/usr/bin/env ruby
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 3$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
(1..29).each { |k|
  n = k + 1
  while n < 30 do
    i = 0
    sum = 0
    while i <= k - 1 do
      tf = Float(0)
      tf = (n.to_f + i.to_f) / k.to_f
      ti = tf.floor.to_i
      sum += ti
      printf("k = %d, n = %d, i = %d, tf = %f, ti = %d, sum = %d\n", k, n, i, tf, ti, sum)
      i += 1
    end
    printf("k = %d, n = %d, sum = %d\n", k, n, sum)
    n += 1
  end
}


__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
