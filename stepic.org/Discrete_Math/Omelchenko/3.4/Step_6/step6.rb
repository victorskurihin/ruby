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
triangle_pascal = [[1], [1, 1]]
n = 6
i = 0
while i < n
  j = 0
  if i > 1
    t = Array.new(i + 1, 0)
    triangle_pascal[i] = t
  end
  while j <= i
    if 0 == j
      triangle_pascal[i][j] = 1
    elsif i == j
      triangle_pascal[i][j] = 1
    elsif i > 1
      triangle_pascal[i][j] = triangle_pascal[i-1][j] +
                              triangle_pascal[i-1][j-1]
    end
    printf("%3d ", triangle_pascal[i][j])
    j += 1
  end
  puts
  i += 1
end
__END__
