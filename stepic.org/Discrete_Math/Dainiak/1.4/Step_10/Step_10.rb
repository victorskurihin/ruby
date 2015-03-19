#!/usr/bin/env ruby
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
d = [0.1, 0.5, 0.9]
(1..10).each do |x|
  (1..10).each { |y|
    d.each do |eps1|
      xf = x.to_f + eps1
      d.each { |eps2|
        yf = y.to_f + eps2
        l = xf.floor.to_i + yf.floor.to_i + (xf + yf).floor.to_i
        r = (2*xf).floor.to_i + (2*yf).floor.to_i
        printf("xf = %5.2f, yf = %5.2f, l = %2d <=> r = %2d => %p\n", xf, yf, l, r, l <= r)
      }
    end
  }
end

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
