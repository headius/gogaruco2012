require 'benchmark'

def foo; self; end

(ARGV[0] || 10).to_i.times do
  t = Time.now
  i = 0
  while i < 10_000_000
    foo; foo; foo; foo; foo
    i += 1
  end
  puts Time.now - t
end
