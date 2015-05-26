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

class Graph
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
        #printf("new_en: %d, \@im: %p\n", e, @im)
        @en = e
        @im.each {|a| a.resize(@en, 0)}
        #printf("new_en: %d, \@im: %p\n", @en, @im)
      end
      if new_vn >= @vn
        @vn = new_vn + 1
        printf("new_vn: %d, \@am: %p\n", new_vn, @am)
        @am.each {|a| a.resize(@vn, 0) }
        @am.resize(@vn)
        printf("  each: \@am: %p\n", @am)
        #@am.map do |a| # {|a| a = Array.new(@vn, 0) }
        #  a = if not a
        #    Array.new(@vn, 0)
        #  end
        #  a
        #end
      end
      printf("ok? \@am: %p\n", @am)
      @am[a][b] = 1
      @am[b][a] = 1
      #@im[a][e] = 1
      #@im[b][e] = 1
    end
end

#n = gets.chomp.to_i
t = gets.chomp.split(/\s+/)
n, m = t[0].to_i, t[1].to_i
g1 = Graph.new
1.upto(n) do |i|
  t = gets.chomp.split(/\s+/)
  g1.add(t[0].to_i - 1, t[1].to_i - 1, i - 1)
end
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
