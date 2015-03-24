#!/usr/bin/env ruby
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 3$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# 
# Сколькими способами можно распределить 3n различных книг между тремя людьми,
# так, чтобы каждый получил по n книг?
# 
# http://matica.org.ua/metodichki-i-knigi-po-matematike/veroiatnost-i-kombinatorika-novoselov-o-v-skiba-l-p/21-zadachi
# Сколькими способами можно распределить 3n предметов между тремя людьми так,
# чтобы каждый получил n предметов?
# Ответ: Расставим предметы в некотором порядке и отдадим первому человеку
# первые n предметов, второму – вторые n предметов и последнему – оставшиеся
# предметы. Поскольку порядок элементов в группах не играет роли,
#
# C(n, 3*n)*C(n, 2*n)

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

# k-сочетаний без повторений: C(k, n) = n!/((n-k)!∙k!)
def C(k, n)
  return nil if n < 0 or k < 0 or n < k
  n.fact/((n-k).fact*k.fact)
end

n = 3

p C(n, 3*n)*C(n, 2*n)

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
