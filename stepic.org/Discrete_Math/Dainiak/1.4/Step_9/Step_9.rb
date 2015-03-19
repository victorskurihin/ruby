#!/usr/bin/env ruby
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
(1..20).each do |n|
  (1..20).each { |m|
    t1f = Float(0)
    t1f = n.to_f / m.to_f
    t1i = t1f.ceil.to_i
    t2f = Float(0)
    t2f = (n.to_f + m.to_f - 1) / m.to_f
    t2i = t2f.floor.to_i
    printf("n = %2d, m = %2d, t1f = %5.2f, t1 = %2d <=> t2 = %2d, t2f = %5.2f\n",
           n, m, t1f, t1i, t2i, t2f)
  }
end


__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
