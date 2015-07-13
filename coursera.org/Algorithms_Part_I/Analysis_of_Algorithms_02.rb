#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 3$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
#
# (seed = 105946)
# Suppose that you time a program as a function of N and produce
# the following table.
# 
#         N   seconds
# -------------------
#        64     0.000
#       128     0.003
#       256     0.044
#       512     0.486
#      1024     5.921
#      2048    73.002
#      4096   883.657
#      8192 10362.720
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

print(f1(0.003, 128, 0.044, 256) + "\n")
print(f1(0.044, 256, 0.486, 512) + "\n")
print(f1(0.486, 512, 5.921, 1024) + "\n")
print(f1(5.921, 1024, 73.002, 2048) + "\n")
print(f1(73.002, 2048, 883.657, 4096) + "\n")
print(f1(883.657, 4096, 10362.720, 8192) + "\n")
#
# log2(0.0030)=b*log2(128)+c, log2(0.0440)=b*log2(256)+c            b ~= 3.874
# log2(0.0440)=b*log2(256)+c, log2(0.4860)=b*log2(512)+c            b ~= 3.465
# log2(0.4860)=b*log2(512)+c, log2(5.9210)=b*log2(1024)+c           b ~= 3.606
# log2(5.9210)=b*log2(1024)+c, log2(73.0020)=b*log2(2048)+c         b ~= 3.624
# log2(73.0020)=b*log2(2048)+c, log2(883.6570)=b*log2(4096)+c       b ~= 3.597
# log2(883.6570)=b*log2(4096)+c, log2(10362.7200)=b*log2(8192)+c    b ~= 3.551
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
# EOF
