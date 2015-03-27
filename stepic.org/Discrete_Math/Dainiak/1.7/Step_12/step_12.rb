#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 1$
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

p C(11, 1001)
p C(10, 1000)
p C(11, 1001)/C(10, 1000)
