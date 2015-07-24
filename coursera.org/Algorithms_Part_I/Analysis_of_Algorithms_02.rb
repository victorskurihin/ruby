#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 4$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
#
# (seed = 618758)
# Suppose that you time a program as a function of N and produce
# the following table.
# 
#         N   seconds
# -------------------
#       256     0.000
#       512     0.000
#      1024     0.002
#      2048     0.009
#      4096     0.042
#      8192     0.175
#     16384     0.788
#     32768     3.440
#     65536    15.010
#    131072    65.873
#    262144   290.449
#    524288  1272.816
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

print(f1(0.002, 1024, 0.009, 2048) + "\n")
print(f1(0.009, 2048, 0.042, 4096) + "\n")
print(f1(0.042, 4096, 0.175, 8192) + "\n")
print(f1(0.175, 8192, 0.788, 16384) + "\n")
print(f1(0.788, 16384, 3.440, 32768) + "\n")
print(f1(3.440, 32768, 15.010, 65536) + "\n")
print(f1(15.010, 65536, 65.873, 131072) + "\n")
print(f1(65.873, 131072, 290.449, 262144) + "\n")
print(f1(290.449, 262144, 1272.816, 524288) + "\n")
#
# log2(0.0020)=b*log2(1024)+c, log2(0.0090)=b*log2(2048)+c          b ~= 2.1699
# log2(0.0090)=b*log2(2048)+c, log2(0.0420)=b*log2(4096)+c          b ~= 2.2223
# log2(0.0420)=b*log2(4096)+c, log2(0.1750)=b*log2(8192)+c          b ~= 2.0588
# log2(0.1750)=b*log2(8192)+c, log2(0.7880)=b*log2(16384)+c         b ~= 2.1708
# log2(0.7880)=b*log2(16384)+c, log2(3.4400)=b*log2(32768)+c        b ~= 2.1261
# log2(3.4400)=b*log2(32768)+c, log2(15.0100)=b*log2(65536)+c       b ~= 2.1254
# log2(15.0100)=b*log2(65536)+c, log2(65.8730)=b*log2(131072)+c     b ~= 2.1337
# log2(65.8730)=b*log2(131072)+c, log2(290.4490)=b*log2(262144)+c   b ~= 2.1405
# log2(290.4490)=b*log2(262144)+c, log2(1272.8160)=b*log2(524288)+c b ~= 2.1316
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
# EOF
