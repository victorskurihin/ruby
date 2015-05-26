#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Сколько диаметральных цепей в графе Km,n?
#

def f1(n, m)
  return ((n*m*(n + m - 2))/2)
end

2.upto(10) { |n|
  printf("f(%2d) = %d\n", n, f1(n, n))
}

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
