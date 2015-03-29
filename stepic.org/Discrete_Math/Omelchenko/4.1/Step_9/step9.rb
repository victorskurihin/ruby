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
  f.each_char { |e1|
    f.each_char do |e2|
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
  printf("%d => %s\n", i, f)
  if fcmp(f)
    count += 1
  end
}
p count
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
