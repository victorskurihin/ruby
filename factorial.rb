#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 2.1$
# $Revision: 3$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
#

require 'numtheory' # gem install ruby-numtheory
require 'bigdecimal'
require 'bigdecimal/math'

include BigMath

def product(arr)
    def rec_product(n, step, arr)
        return arr[n] if step > n
        newstep = step << 1
        t = rec_product(n, newstep, arr) *
            rec_product(n-step, newstep, arr)
        return t
    end
    rec_product(arr.length-1, 1, arr)
end

$small_odd_swing = [ 1,1,1,3,3,15,5,35,35,315,63,693,231,3003,429,6435,6435,
                     109395,12155,230945,46189,969969,88179,2028117,676039,
                     16900975,1300075, 35102025,5014575,145422675,9694845,
                     300540195,300540195 ]

PRECOMPUTED_ODD_SWINGS_NUM = $small_odd_swing.length

def odd_swing(n)
    return $small_odd_swing[n] if n < PRECOMPUTED_ODD_SWINGS_NUM
    root_n = (Math.sqrt n).floor
    prime_list = []
    a_primes = 3.primes_upto(root_n).to_a
    b_primes = (root_n+1).primes_upto(n / 3).to_a
    a_primes.each do |prime|
        q, p = n, 1
        while true do
            q /= prime
            break if q == 0
            p *= prime if q & 1 == 1
        end
        prime_list << p if p > 1
    end
    b_primes.each do |prime|
        prime_list << prime if (n / prime) & 1 == 1
    end
    product(prime_list) * product(((n/2)+1).primes_upto(n).to_a)
end

def rec_factorial(n)
    return 1 if n < 2
    t = rec_factorial(n/2)
    t *= t
    if n < PRECOMPUTED_ODD_SWINGS_NUM
        return t * $small_odd_swing[n]
    else
        $counter -= 1
        return t * $swings[$counter].value
    end
end

$swings = []
$counter = 0

def factorial_primeswing(n)
    $swings = []
    $counter = 0
    shift = 0
    t = n
    while t > 0 do 
        if t >= PRECOMPUTED_ODD_SWINGS_NUM 
            $swings << Thread.new(t) {|t| odd_swing t }
            $counter += 1
        end
        t /= 2
        shift += t 
    end
    return rec_factorial(n) << shift
end

class Integer
  def slow_fact
    (1..self).reduce(:*) || 1
  end
  # limit for Debian 8 Linux 3.16.0-4-amd64 #1 SMP 3.16.7-2 (2014-11-06) x86_64
  # is 939002
  def unstable_fact
    factorial_primeswing(self)
  end
  alias fact unstable_fact
  alias factorial slow_fact
end

class Float
  # extremum 170.6.fact
  def fact
    Math.sqrt(2*Math::PI*self)*(self/Math::E)**self
  end
  alias factorial fact
  def to_rad
    self*Math::PI/180
  end
  def to_gradus
    (self*180).to_f/Math::PI
  end
end

__END__

for n in (160..170)
  printf("(%d).to_f.fact = %e\n", n, n.to_f.fact)
  r = factorial_primeswing(n)
  printf("factorial_primeswing(%d) = 0.%s*10^%d\n", n, r.to_s[0..9], r.to_s.length)
end
n = 939002
r = factorial_primeswing(n)
puts (BigMath.log(r,1)/BigMath.log(10,1)).to_i
printf("factorial_primeswing(%d) = 0.%s*10^%d\n", n, r.to_s[0..9], r.to_s.length)
for n in (939000..939999)
  r = factorial_primeswing(n)
  printf("factorial_primeswing(%d) = 0.%s*10^%d\n", n, r.to_s[0..9], r.to_s.length)
end

################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
