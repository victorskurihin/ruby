#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 3$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Cколько существует восьмизначных чисел в пятеричной системе счисления,
# в которых все цифры различны?
#

def fcmp(f)
  i = 0
  while i < 6
    j = 0
    while j < 6
      if i != j and f[i] == f[j]
        return true
      end
      j += 1
    end
    i += 1
  end
  return false
end

count = 0
#(7776...46656).each {|i|
(0...46656).each {|i|
  f = sprintf("%06d", i.to_s(6))
  if fcmp(f)
    printf("%d => %s\n", i, f)
    count += 1
  end
}
p count
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
