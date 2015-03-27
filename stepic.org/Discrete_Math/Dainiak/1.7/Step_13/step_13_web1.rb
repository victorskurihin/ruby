#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 1$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################

# http://rosettacode.org/wiki/Permutations_with_repetitions
rp = [1,2,3].repeated_permutation(2) # an enumerator (generator)
p rp.to_a #=>[[1, 1], [1, 2], [1, 3], [2, 1], [2, 2], [2, 3], [3, 1], [3, 2], [3, 3]]
 
#yield permutations until their sum happens to exceed 4, then quit:
p rp.take_while{|(a, b)| a + b < 5}  #=>[[1, 1], [1, 2], [1, 3], [2, 1], [2, 2]]
