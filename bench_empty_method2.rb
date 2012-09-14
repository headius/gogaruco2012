require 'benchmark'

def foo; self; end
def bar1; self; end
def bar2; self; end

i = 0
while i < 1_000_000
  bar1; bar1; bar1; bar1; bar1
  bar2; bar2; bar2; bar2; bar2
  i += 1
end

(ARGV[0] || 10).to_i.times do
  t = Time.now
  i = 0
  while i < 10_000_000
    foo; foo; foo; foo; foo
    i += 1
  end
  puts Time.now - t
end

