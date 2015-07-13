#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
(seed = 957781)
Suppose that you time a program as a function of N and produce
the following table.

        N   seconds
-------------------
      512     0.000
     1024     0.001
     2048     0.003
     4096     0.015
     8192     0.069
    16384     0.313
    32768     1.436
    65536     6.440
   131072    29.199
   262144   133.035
   524288   602.118
  1048576  2739.285


Estimate the order of growth of the running time as a function of N.
Assume that the running time obeys a power law T(N) ~ a N^b. For your
answer, enter the constant b. Your answer will be marked as correct
if it is within 1% of the target answer - we recommend using
two digits after the decimal separator, e.g., 2.34.


def f(b)
    a = 0.001/(256**b)
    printf("a = %e\n", a)
    i = 128
    while i < 2097152
        i *= 2
        printf("a*%d**b = %0.4f\n", i, a * i**b)
    end
end

b = 2.03
printf("b = %0.2f\n", b)
f(b)
b = 2.07
printf("b = %0.2f\n", b)
f(b)

################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
# EOF

#The correct answer is: 912
#
#public class MysteryBox {                           //   16 (object overhead)
#    private final boolean x0, x1, x2;               //    3 (3 boolean)
#    private final long y0;                          //    8 (1 long)
#    private final double z0, z1;                    //   16 (2 double)
#    private final int[] a = new int[208];           //    8 (reference to array)
#                                                    //  856 (int array of size 208)
#    ...                                                   5 (padding to round up to a multiple of 8)
#}                                                      ----
#                                                        912

#public class MysteryBox {                           //   16 (object overhead)
#    private final int x0;                           //    4 (1 int)
#    private final double y0, y1, y2, y3;            //   32 (4 double)
#    private final long z0, z1, z2, z3;              //   32 (4 long)
#    private final boolean[] a = new boolean[168];   //    8 (reference to array)
#                                                    //  168 (boolean array of size 168)
#                                                          4 (padding to round up to a multiple of 8)
#}                                                      ----
#                                                        264
The correct answer is: 288

public class MysteryBox {                           //   16 (object overhead)
    private final int x0;                           //    4 (1 int)
    private final double y0, y1, y2, y3;            //   32 (4 double)
    private final long z0, z1, z2, z3;              //   32 (4 long)
    private final boolean[] a = new boolean[168];   //    8 (reference to array)
                                                    //  192 (boolean array of size 168)
    ...                                                   4 (padding to round up to a multiple of 8)
}                                                      ----
                                                        288



(seed = 395624)
Suppose that you time a program as a function of N and produce
the following table.

        N   seconds
-------------------
      256     0.000
      512     0.002
     1024     0.015
     2048     0.091
     4096     0.557
     8192     3.405
    16384    20.789
    32768   128.815
    65536   786.702
   131072  4856.110


Estimate the order of growth of the running time as a function of N.
Assume that the running time obeys a power law T(N) ~ a N^b. For your
answer, enter the constant b. Your answer will be marked as correct
if it is within 1% of the target answer - we recommend using
two digits after the decimal separator, e.g., 2.34.




The theoretical order-of-growth is N ^ (34/13) = 2.62

The empirical order-of-growth is N ^ (log_2 ratio)

                                  log_2
        N   seconds     ratio     ratio
---------------------------------------
      256     0.000         -         -
      512     0.002         -         -
     1024     0.015      7.50      2.91
     2048     0.091      6.07      2.60
     4096     0.557      6.12      2.61
     8192     3.405      6.11      2.61
    16384    20.789      6.11      2.61
    32768   128.815      6.20      2.63
    65536   786.702      6.11      2.61
   131072  4856.110      6.17      2.63

