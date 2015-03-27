#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

def C(k ,n)
  n.fact/(k.fact*(n-k).fact)
end

def A(k ,n)
  n.fact/(n-k).fact
end

def CC(k ,n)
  C(k, n+k-1)
end

n = 2
r1 = Range.new(1, n)
r2 = Range.new(1, n)
r3 = Range.new(1, n)

parl = 0
cube = 0
r1.each do |a|
  r2.each { |b|
    r3.each do |c|
        parl += 1
        printf("Ok  %d %d %d\n", a, b, c)
    end
  }
end
printf("n = %d; parl = %d; cube = %d\n", n, parl, cube)

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
