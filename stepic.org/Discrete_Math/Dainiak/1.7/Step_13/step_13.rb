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

def CC(k ,n)
  C(k, n+k-1)
end
