#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Сколько существует шестизначных чисел, сумма цифр которых не превосходит 47?
#

n = 42
f = sprintf("%%0%db", n)
count = 0
b = 0
e = 2**n-1
r = Range.new(b, e)
p = ""
r.each do |n|
  str_bit_num = sprintf(f, n)
  if 7 == str_bit_num.count("1") 
    if not str_bit_num =~ /(11)/
      # printf(f + "\n", n)
      count += 1
    end
  end
end
puts count

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
