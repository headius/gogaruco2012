require 'benchmark'

def foo; self; end
def bar1; self; end
def bar2; self; end

def invoker1
  i = 0
  while i < 1000
    foo; foo; foo; foo; foo
    i+=1
  end
end
def invoker2
  i = 0
  while i < 1000
    bar1; bar1; bar1; bar1; bar1
    i+=1
  end
end
def invoker3
  i = 0
  while i < 1000
    bar2; bar2; bar2; bar2; bar2
    i+=1
  end
end

5.times do
  i = 0
  while i < 10_000
    invoker2
    invoker3
    bar1; bar1; bar1; bar1; bar1
    bar2; bar2; bar2; bar2; bar2
    i += 1
  end
end

(ARGV[0] || 10).to_i.times do
  t = Time.now
  i = 0
  while i < 10000
    invoker1
    i+=1
  end
  puts Time.now - t
end


