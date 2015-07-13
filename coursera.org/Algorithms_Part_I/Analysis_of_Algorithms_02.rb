#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
#
#
# (seed = 289928)
# Suppose that you time a program as a function of N and produce
# the following table.
# 
#         N   seconds
# -------------------
#       512     0.000
#      1024     0.001
#      2048     0.004
#      4096     0.017
#      8192     0.063
#     16384     0.238
#     32768     0.915
#     65536     3.482
#    131072    13.297
#    262144    50.890
#    524288   194.159
#   1048576   740.970
#   2097152  2835.331
# 
# 
# Estimate the order of growth of the running time as a function of N.
# Assume that the running time obeys a power law T(N) ~ a N^b. For your
# answer, enter the constant b. Your answer will be marked as correct
# if it is within 1% of the target answer - we recommend using
# two digits after the decimal separator, e.g., 2.34.

def f1(t1, n1, t2, n2)
  return sprintf("log2(%0.4f)=b*log2(%d)+c, log2(%0.4f)=b*log2(%d)+c",
                  t1, n1, t2, n2)
end

print(f1(0.001, 1024, 0.004, 2048) + "\n")
print(f1(0.004, 2048, 0.017, 4096) + "\n")
print(f1(0.017, 4096, 0.063, 8192) + "\n")
print(f1(0.063, 8192, 0.238, 16384) + "\n")
print(f1(0.238, 16384, 0.915, 32768) + "\n")
print(f1(0.915, 32768, 3.482, 65536) + "\n")
print(f1(3.482, 65536, 13.297, 131072) + "\n")
print(f1(13.297, 131072, 50.890, 262144) + "\n")
print(f1(50.890, 262144, 194.159, 524288) + "\n")
print(f1(194.159, 524288, 740.970, 1048576) + "\n")
print(f1(740.970, 1048576, 2835.331, 2097152) + "\n")

# log2(0.0010)=b*log2(1024)+c, log2(0.0040)=b*log2(2048)+c          b ~= 2
# log2(0.0040)=b*log2(2048)+c, log2(0.0170)=b*log2(4096)+c          b ~= 2.610
# log2(0.0170)=b*log2(4096)+c, log2(0.0630)=b*log2(8192)+c          b ~= 1.889
# log2(0.0630)=b*log2(8192)+c, log2(0.2380)=b*log2(16384)+c         b ~= 1.917
# log2(0.2380)=b*log2(16384)+c, log2(0.9150)=b*log2(32768)+c        b ~= 1.942
# log2(0.9150)=b*log2(32768)+c, log2(3.4820)=b*log2(65536)+c        b ~= 1.928
# log2(3.4820)=b*log2(65536)+c, log2(13.2970)=b*log2(131072)+c      b ~= 1.933
# log2(13.2970)=b*log2(131072)+c, log2(50.8900)=b*log2(262144)+c    b ~= 1.936
# log2(50.8900)=b*log2(262144)+c, log2(194.1590)=b*log2(524288)+c   b ~= 1.931
# log2(194.1590)=b*log2(524288)+c, log2(740.9700)=b*log2(1048576)+c b ~= 1.932
# log2(740.9700)=b*log2(1048576)+c, log2(2835.3310)=b*log2(2097152)+c b = 1.93
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
# EOF
