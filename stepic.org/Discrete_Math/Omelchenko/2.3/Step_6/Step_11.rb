#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################

v = [3, 3]
def v.apply(a)
  a.each_index do |i|
    c = ""
    printf("v[%d] =", i);
    a[i].each_index { |j|
      # p a[i][j]*self[j]
      printf("%s a[%d][%d] = %8p", c, i, j, a[j][i]);
      c = " +"
    }
    puts
  end
end
a = [[0, Rational(-1,3)], [Rational(1,3), 0]]
a.each_index do |i|
  a[i].each_index { |j|
    printf("a[%d][%d] = %8p", i, j, a[i][j]);
  }
  puts
end
puts
v.apply(a)

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
