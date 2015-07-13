#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 1$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
#
# (seed = 130450)
# Suppose that you time a program as a function of N and produce
# the following table.
# 
#         N   seconds
# -------------------
#      1024     0.000
#      2048     0.001
#      4096     0.003
#      8192     0.013
#     16384     0.053
#     32768     0.227
#     65536     0.953
#    131072     3.998
#    262144    16.756
#    524288    70.385
#   1048576   295.766
#   2097152  1243.879
# 
# 
# Estimate the order of growth of the running time as a function of N.
# Assume that the running time obeys a power law T(N) ~ a N^b. For your
# answer, enter the constant b. Your answer will be marked as correct
# if it is within 1% of the target answer - we recommend using
# two digits after the decimal separator, e.g., 2.34.

def f(b)
    a = 0.001/(2048**b)
    printf("a = %e\n", a)
    i = 512
    while i < 2097152
        i *= 2
        printf("a*%d**b = %0.4f\n", i, a * i**b)
    end
end

b = 2.02
printf("b = %0.2f\n", b)
f(b)
b = 2.03
printf("b = %0.2f\n", b)
f(b)

################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
# EOF
