#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Понятие последовательности де Брёйна естественно обобщается на недвоичный
# случай, когда последовательности не из нулей и единиц, а из символов из
# какого-то множества мощности q. Какая длина должна быть у q-ичной
# последовательности де Брёйна порядка n?

def de_bruijn(k, n):
    """
    De Bruijn sequence for alphabet k
    and subsequences of length n.
    """
    try:
        # let's see if k can be cast to an integer;
        # if so, make our alphabet a list
        _ = int(k)
        alphabet = list(map(str, range(k)))

    except (ValueError, TypeError):
        alphabet = k
        k = len(k)

    a = [0] * k * n
    sequence = []

    def db(t, p):
        if t > n:
            if n % p == 0:
                sequence.extend(a[1:p + 1])
        else:
            a[t] = a[t - p]
            db(t + 1, p)
            for j in range(a[t - p] + 1, k):
                a[t] = j
                db(t + 1, t)
    db(1, 1)
    return "".join(alphabet[i] for i in sequence)

print(de_bruijn(2, 4))
print
print(de_bruijn(3, 4))
print
print(de_bruijn(4, 4))
print
print(de_bruijn("101", 4))

# vim: syntax=python:paste:ff=unix:textwidth=76:ts=4:sw=4:sts=4:et
# EOF
