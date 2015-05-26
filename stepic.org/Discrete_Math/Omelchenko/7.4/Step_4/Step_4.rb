#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 6$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Колесо рулетки в равномерно расположенных ячейках имеет числа от 0 до 36.
# Ячейки с чётными номерами в диапазоне от 2 до 36 окрашены в черный цвет,
# ячейки с нечетными номерами в диапазоне от 1 до 35 окрашены в красный цвет.
# Игрок платит доллар и выбирает цвет. Если игрок выигрывает, то он получает
# два доллара, если проигрывает, то не получает ничего. Есть подозрение, что
# в среднем игрок проигрывает казино какую-то сумму, а казино соответствующую
# сумму выигрывает. Подсчитайте величину среднего проигрыша игрока.
# 
# Ответ дайте с точностью до 10−3.

s1 = (18.0/37*(-1+2)+19.0/37*(-1))
s2 = (1.0/37*(-1+2)+36.0/37*(-1))
p (s1*s2).round(3)

__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF