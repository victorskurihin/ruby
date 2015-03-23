#!/usr/bin/env ruby
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# http://rosettacode.org/wiki/Circle_sort#Ruby
# Show both the initial, unsorted list and the final sorted list.
# (Intermediate steps during sorting are optional.)
# 
# Optimizations (like doing 0.5 log2(n) iterations and then continue
# with an Insertion sort) are optional.
# 
# Pseudo code:
# 
#  function circlesort (index lo, index hi, swaps)
#  {
#    if lo == hi return (swaps)
#    high := hi
#    low := lo
#    mid := int((hi-lo)/2)
#    while lo < hi {
#      if  (value at lo) > (value at hi) {
#         swap.values (lo,hi)
#         swaps++
#      }
#      lo++
#      hi--
#    }
#    if lo == hi
#      if (value at lo) > (value at hi+1) {
#          swap.values (lo,hi+1)
#          swaps++
#      }
#    swaps := circlesort(low,low+mid,swaps)
#    swaps := circlesort(low+mid+1,high,swaps)
#    return(swaps)
#  }
#  while circlesort (0, sizeof(array)-1, 0)

class Array
  def circle_sort!
    while _circle_sort!(0, size-1) > 0
    end
    self
  end

  private
  def _circle_sort!(lo, hi, swaps=0)
    return swaps if lo == hi
    low, high = lo, hi
    mid = (lo + hi) / 2
    while lo < hi
      if self[lo] > self[hi]
        self[lo], self[hi] = self[hi], self[lo]
        swaps += 1
      end
      lo += 1
      hi -= 1
    end
    if lo == hi && self[lo] > self[hi+1]
      self[lo], self[hi+1] = self[hi+1], self[lo]
      swaps += 1
    end
    swaps + _circle_sort!(low, mid) + _circle_sort!(mid+1, high)
  end
end

ary = [6, 7, 8, 9, 2, 5, 3, 4, 1]
puts "before sort: #{ary}"
puts " after sort: #{ary.circle_sort!}"
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
