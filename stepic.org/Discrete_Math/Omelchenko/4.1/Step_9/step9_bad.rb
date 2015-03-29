#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 4$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Cколько существует восьмизначных чисел в пятеричной системе счисления,
# в которых все цифры различны?
#

def fcmp(f)
  f.each { |e1|
    f.each do |e2|
      if e1 == e2
        return false
      end
    end
  }
  return true
end

count = 0
(78125...390625).each {|i|
  f = i.to_s(5)
  if f[0] != f[1] and f[1] != f[2] and f[2] != f[3] and f[3] != f[4] and f[4] != f[5] and f[5] != f[6] and f[6] != f[7] and f[0] != f[7]
    count += 1
  end
}
p count
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
