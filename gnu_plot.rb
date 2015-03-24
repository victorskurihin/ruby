#!/usr/bin/env ruby
def gnuplot(commands)
  IO.popen("gnuplot", "w") {|io| io.puts commands}
end
commands =
%Q(
  set terminal png
  set output "curves.png"
  plot '-' using 1:2 with lines
)
line = DATA.read.chomp
line.split(/[ (,)]/).each { |pair|
  if pair =~ /-?\d+;-?\d+/
    xy = pair.split(";")
    commands = commands + sprintf("%d %d\n", xy[0], xy[1])
  end
}
gnuplot(commands)
__END__
(-4;-13), (-8;-13), (-3;-5), (-3;6), (0;10), (3;6), (3;-5), (8;-13), (4;-13), (3;-8), (1;-8), (2;-13), (-2;-13), (-1;-8) (-3;-8), (-3;-13)
