#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 4$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Сколько существует шестизначных чисел, все цифры которых имеют одинаковую
# четность?

a = [0 , 0]
b = 100000
e = 999999
r = Range.new(b, e)
p = ""
r.each do |n|
  str_bit_num = sprintf("%d", n)
  n1 = str_bit_num[0].to_i % 2
  n2 = str_bit_num[1].to_i % 2
  n3 = str_bit_num[2].to_i % 2
  n4 = str_bit_num[3].to_i % 2
  n5 = str_bit_num[4].to_i % 2
  n6 = str_bit_num[5].to_i % 2
  if n1 == n2 and n2 == n3 and n3 == n4 and n4 == n5 and n5 == n6
    if 0 == n1
      a[0] += 1
    else
      a[1] += 1
    end
  end
end
puts a

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
