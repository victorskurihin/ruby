#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 4$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Сколько существует шестизначных чисел, сумма цифр которых не превосходит 47?
#

#n = 42
#f = sprintf("%%0%db", n)
count = 0
b = 0
e = 999999
r = Range.new(b, e)
p = ""
r.each do |n|
  str_bit_num = sprintf("%d", n)
  if not str_bit_num =~ /0|1|2|3|4|5|6|7/
    count += 1
  end
end
puts count

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
