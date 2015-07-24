#!/bin/sh
# -*- coding: utf-8 -*-
################################################################################
# $Date$
# $Id$
# $Version: 0.1$
# $Revision: 2$
# $Author: Victor |Stalker| Skurikhin <stalker@quake.ru>$
################################################################################

# Insert shell code here!
printf '%s\n' "Shell running $0"
i=1
for arg do
    printf '  %s\n' "\${$i}: $arg"
    i=`expr $i + 1`
done

# Switch from shell to Ruby.
exec ${RUBY-ruby} -x "$0" --coming-from-sh "$@"

#!ruby

ARGV[0] == "--coming-from-sh" or exec "/bin/sh", $0, *ARGV
ARGV.shift

# Insert Ruby code here!
puts "Ruby running #$0"
ARGV.each_with_index do |arg, i|
    puts "  ARGV[#{i}]: #{arg}"
end



################################################################################
#EOF
# vim: syntax=ruby:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
