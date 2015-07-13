#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# (seed = 957781)
# Suppose that you time a program as a function of N and produce
# the following table.
# 
#         N   seconds
# -------------------
#       512     0.000
#      1024     0.001
#      2048     0.003
#      4096     0.015
#      8192     0.069
#     16384     0.313
#     32768     1.436
#     65536     6.440
#    131072    29.199
#    262144   133.035
#    524288   602.118
#   1048576  2739.285
# 
# 
# Estimate the order of growth of the running time as a function of N.
# Assume that the running time obeys a power law T(N) ~ a N^b. For your
# answer, enter the constant b. Your answer will be marked as correct
# if it is within 1% of the target answer - we recommend using
# two digits after the decimal separator, e.g., 2.34.

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
# The correct answer is: 288
# 
# public class MysteryBox {                           //   16 (object overhead)
#     private final int x0;                           //    4 (1 int)
#     private final double y0, y1, y2, y3;            //   32 (4 double)
#     private final long z0, z1, z2, z3;              //   32 (4 long)
#     private final boolean[] a = new boolean[168];   //    8 (reference to array)
#                                                     //  192 (boolean array of size 168)
#     ...                                                   4 (padding to round up to a multiple of 8)
# }                                                      ----
#                                                         288

public class MysteryBox {                             //   16 (object overhead)
    private final double x0, x1;                      //   16 (2 double)
    private final int y0, y1;                         //    8 (1 int)
    private final boolean z0, z1, z2;                 //    3 (3 boolean)
    private final long[] a = new long[88];            //  728 (long array of size 88)

    ...
}
                                                          776
The correct answer is: 784

public class MysteryBox {                           //   16 (object overhead)
    private final double x0, x1;                    //   16 (2 double)
    private final int y0, y1;                       //    8 (2 int)
    private final boolean z0, z1, z2;               //    3 (3 boolean)
    private final long[] a = new long[88];          //    8 (reference to array)
                                                    //  728 (long array of size 88)
    ...                                                   5 (padding to round up to a multiple of 8)
}                                                      ----
                                                        784




public class MysteryBox {A                          //   16 (object overhead)
    private final int x0, x1;                       //    8 (2 int)
    private final long y0, y1, y2;                  //   24 (3 long)
    private final double z0, z1, z2;                //   24 (3 long)
    private final boolean[] a = new boolean[216];   //    8 (reference to array)
                                                    //  240  (boolean array of size 216)
    ...                                                 ---
}                                                       240


The correct answer is: 320

public class MysteryBox {                           //   16 (object overhead)
    private final int x0, x1;                       //    8 (2 int)
    private final long y0, y1, y2;                  //   24 (3 long)
    private final double z0, z1, z2;                //   24 (3 double)
    private final boolean[] a = new boolean[216];   //    8 (reference to array)
                                                    //  240 (boolean array of size 216)
    ...                                                   0 (padding to round up to a multiple of 8)
}                                                      ----
                                                        320



public class MysteryBox {                           //   16 (object overhead)
    private final boolean x0, x1, x2;               //    3 (3 boolean)
    private final int y0, y1, y2;                   //   12 (3 int)
    private final long z0, z1, z2, z3;              //   32 (4 long)
    private final double[] a = new double[80];      //    8 (reference to array)
                                                    //  664 (double array of size 80)
    ...                                                 
}                                                       ---
                                                        736




public class MysteryBox {                           //   16 (object overhead)
    private final double x0, x1;                    //   16 (2 double)
    private final boolean y0, y1;                   //    2 (2 boolean)
    private final long z0, z1;                      //   16 (2 long)
    private final int[] a = new int[32];            //    8 (reference to array)
                                                    //  152 (int array of size 32)
    ...                                                 210 + 6 
}                                                       ---
                                                        216



(seed = 403083)
What is the order of growth of the worst case running time of the following code fragment
as a function of N?

int sum = 0;
for (int i = 0; i*i < N; i++)
    for (int j = 0; j*j < 4*N; j++)
        for (int k = 0; k < N*N; k++)
            sum++;


The answer is : N^3

The i loop iterates N^(1/2) times; the j loop iterates 2 N^(1/2) times; the k loop iterates N^2 times.









int sum = 0;
for (int i = 0; i*i*i < N; i++)
    for (int j = 0; j*j*j < N; j++)
        for (int k = 0; k*k*k < N; k++)
            sum++;A


The i loop iterates N^(1/3) times; the j loop iterates N^(1/3) times; the k loop iterates N^(1/3) times.
