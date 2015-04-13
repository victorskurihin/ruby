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

class Array
  def resize(new_size, value = nil)
    if new_size < length
      slice!(new_size, length)
    else
      fill(value, -1, new_size - length)
    end
    self
  end
end

def next_combination(v, n)
  k = v.size
  i = k - 1
  while 0 <= i do
    if v[i] < (n - k + i + 1)
      v[i] += 1
      (i + 1).upto(k - 1) { |j|
        v[j] = v[j - 1] + 1
      }
      return true
    end
    i -= 1
  end
  return false
end

class Graph
  attr_reader :am
  attr_reader :en
  attr_reader :im
  attr_reader :vn
  def initialize( en = 0, vn = 0)
    @en = en
    @vn = vn
    # Adjacency matrix
    @am = Array.new(vn){|i| Array.new(vn, 0)}
    # Incidence matrix
    @im = Array.new(vn){|i| Array.new(en, 0)}
  end
  def add(a, b, e)
    new_vn = if a > b then a else b end
    if e > @en
      @en = e
      @im.each {|a| a.resize(@en + 1, 0)}
    end
    if new_vn >= @vn
      @vn = new_vn + 1
      @am.each {|a| a.resize(@vn + 1, 0) }
      @am.resize(@vn + 1)
      @im.resize(@vn + 1)
      @am.each_index do |i|
        @am[i] = Array.new(@vn, 0) if not @am[i]
        @im[i] = Array.new(@en, 0) if not @im[i]
      end
    end
    @am[a][b] = 1
    @am[b][a] = 1
    @im[a][e] = 1
    @im[b][e] = 1
  end
  def adj_matrix
    printf("   ")
    (1..@am.size).each { |i|
      printf("%2d ", i)
    }
    puts
    @am.each_index { |i|
      printf("%2d ", i + 1)
      @am[i].each do |e|
        printf("%2d ", e)
      end
      puts
    }
  end
  def inc_matrix
    printf("   ")
    (1..@im[0].size).each { |i|
      printf("%2d ", i)
    }
    puts
    @im.each_index { |i|
      printf("%2d ", i + 1)
      @im[i].each do |e|
        printf("%2d ", e)
      end
      puts
    }
  end
  def swap_vertex(from, to)
    to -= 1
    from -= 1
    t = @im[from]
    @im[from] = @im[to]
    @im[to] = t
    t = @am[from]
    @am[from] = @am[to]
    @am[to] = t
    @am.each_index { |i|
      t = @am[i][from]
      @am[i][from] = @am[i][to]
      @am[i][to] = t
    }
  end
  def swap_edge(from, to)
    to -= 1
    from -= 1
    @im.each_index { |i|
      t = @im[i][from]
      @im[i][from] = @im[i][to]
      @im[i][to] = t
    }
  end
  def compare(g)
    @im.each_index { |i|
      return false if @im[i] != g.im[i]
    }
    true
  end
  alias == compare
end

v = [1, 2, 3, 4, 5, 6]
#begin
#  p v
#end while next_combination(v, v.size)

v.permutation(v.size) { |p|
  p p
}
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
