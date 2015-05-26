#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################
# Дерево T на рисунке закодировали, затем записали полученный код задом наперёд,
# и декодировали обратно в дерево. Получилось некоторое другое дерево T′.
# Отметьте из перечисленных ниже все рёбра, которых не было в T, но которые есть
# в T′.
#

class Array
  def resize(new_size, value = nil)
    if self.size < new_size
      (self.size...new_size).each { |i|
        if value.kind_of? NilClass or
           value.kind_of? Fixnum
          self << value
        else
          self << value.dup
        end
      }
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

  def initialize( en = 0, vn = 0, im = nil)
    # Edge number
    @en = en
    # Vertex number
    @vn = vn
    # Adjacency matrix
    @am = Array.new(vn){|i| Array.new(vn, 0)}
    # Incidence matrix
    @im = Array.new(vn){|i| Array.new(en, 0)}
    return self if im.nil?
    im.each_index { |i|
      im[i].each_index do |j|
        @im[i][j] = im[i][j]
      end
    }
    if @im.size > 0
      (0...@im[0].size).each { |i|
        pair = []
        (0...@im.size).each do |j|
          if 1 == @im[j][i]
            pair << j
          end
          if 2 == pair.size
            @am[pair[0]][pair[1]] = 1
            @am[pair[1]][pair[0]] = 1
            break
          end
        end
      }
    end
    return self
  end

  def dup
    return Graph.new(@en, @vn, @im)
  end

  def add(a, b, e)
    new_vn = if a > b then a else b end
    if e >= @en
      @en = e + 1
      @im.each { |a| a.resize(@en, 0) }
    end
    if new_vn >= @vn
      @vn = new_vn + 1
      @am.each { |a| a.resize(@vn, 0) }
      @am.resize(@vn, Array.new(@vn, 0))
      @im.resize(@vn, Array.new(@en, 0))
    end
    @am[a][b], @am[b][a], @im[a][e], @im[b][e] = 1, 1, 1, 1
    # p @am
  end
  def add_m_1(a, b, e)
    self.add(a - 1, b - 1, e - 1)
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

  def equal?(g)
    @im.each_index { |i|
      return false if @im[i] != g.im[i]
    }
    true
  end
  alias == equal?

  def not_equal?(g)
    return (not self.equal?(g))
  end
  alias != not_equal?

  def am_equal?(g)
    @am.each_index { |i|
      return false if @am[i] != g.am[i]
    }
    true
  end
  alias =~ am_equal?

  def not_am_equal?(g)
    return (not self.am_equal?(g))
  end
  alias !~ not_am_equal?

  def edge_permutation(pm)
    g = nil
    if pm.kind_of? Array and pm.size == @im[0].size
      g = Graph.new(@en, @vn, @im)
      @im[0].each_index { |i|
        g.swap_edge(i + 1, pm[i]) if i + 1 != (pm[i])
      }
    end
    return g
  end

  def vertex_permutation(pm)
    g = nil
    if pm.kind_of? Array and pm.size == @am.size
      g = Graph.new(@en, @vn, @im)
      @am.each_index { |i|
        #g.swap_vertex(i, pm[i] - 1) if i != (pm[i] - 1)
        if (i + 1) != pm[i]
          printf("before swap_vertex(%d, %d):\n", i + 1, pm[i])
          g.adj_matrix
          g.swap_vertex(i + 1, pm[i])
          printf("after  swap_vertex(%d, %d):\n", i + 1, pm[i])
          g.adj_matrix
        end
      }
    end
    return g
  end
  def degree_of_vertex(n)
    s = 0
    @im[n].each { |e|
      s += e
    }
    return s
  end
  def remove_vertex(n)
    i = 0
    while i < @im.size
      a = 1
      if 1 == @im[n][i]
        p @im[n][i]
        @im.each { |v|
          v.delete_at(i)
        }
        a = 0
      end
      i += a
    end
    @im.delete_at(n)
    @am.each { |v|
      v.delete_at(n)
    }
    @am.delete_at(n)
  end
  def remove_edge(n)
    pair = []
    @im.each_index { |i|
      if 1 == @im[i][n]
        pair << i
      end
      if 2 == pair.size
        @am[pair[0]][pair[1]] = 0
        @am[pair[1]][pair[0]] = 0
        break
      end
    }
    @im.each { |v|
      v.delete_at(n)
    }
  end
  def prufer_encode
    prufer = []
    g = self.dup
    i = 0
    while i < g.am.size
      a = 1
      # printf("i: %d\n", i)
      if 1 == g.degree_of_vertex(i)
        edge = g.im[i].index(1)
        ivertex = g.am[i].index(1)
        # printf("vertex: %2d; edge: %2d; ivertex: %2d; degree: 1\n",
        #        i + 1, edge + 1, ivertex + 1)
        g.remove_edge(edge)
        # printf("prefer: %d\n", ivertex + 1)
        prufer << ivertex
        i = 0
      else
        i += 1
      end
    end
    prufer.pop
    return prufer
  end
  def prufer_decode(a)
    b = (0..(a.size + 1)).to_a
    # printf("a: %p, b: %p\n", a, b)
    i = 0
    while a.size > 0
      e1 = (b - a)[0]
      b.delete_if {|x| x == e1}
      e2 = a.delete_at(0)
      self.add(e1, e2, i)
      # printf("add( %d, %d, %d)\n", e1 + 1, e2 + 1, i + 1)
      i += 1
      # printf("a: %p, b: %p\n", a, b)
    end
    self.add(b[0], b[1], i)
    # printf("add( %d, %d, %d)\n", b[0] + 1, b[1] + 1, i + 1)
  end
end

t = gets.chomp.split(/\s+/)
n, m = t[0].to_i, t[1].to_i
g1 = Graph.new(n, m)
1.upto(n) do |i|
  t = gets.chomp.split(/\s+/)
  g1.add_m_1(t[0].to_i, t[1].to_i, i)
end

puts "g1:"
g1.adj_matrix
g1.inc_matrix
puts "g1.prufer"
prufer = g1.prufer_encode
prufer.each { |e|
  printf("%d ", e + 1)
}
puts
g2 = Graph.new(0, (prufer.size + 2))
# prufer = [1, 1, 2, 0, 3, 4]
g2.prufer_decode(prufer.reverse)
puts("g1")
g1.adj_matrix
puts("g2")
g2.adj_matrix
p g1 =~ g2
puts("g1")
g1.inc_matrix
puts("g2")
g2.inc_matrix

exit
gr = nil
e = g2.im[0].size
(1..e).to_a.permutation(e) { |pm|
  # p pm
  gr = g2.edge_permutation(pm)
  if gr == g1
    puts "gr == g1"
    break
  end
}
__END__
################################################################################
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=2:sw=2:sts=2:et
# EOF
