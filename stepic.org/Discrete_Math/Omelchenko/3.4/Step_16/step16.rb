#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 1$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
#
count = 0
b = 100000
e = 999999
r = Range.new(b, e)
r.each do |n|
  sum = 0
  n.to_s.each_char { |nn|
    sum += nn.to_i
  }
  if sum <= 47
    count += 1
  end
end
puts count
__END__
