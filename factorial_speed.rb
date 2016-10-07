require 'benchmark'
values = [100, 1_000, 10_000, 20_000]

def factorial1(n)
  (1..n).reduce(&:*)
end

def factorial2(n)
  arr = [*1..n]
  loop do
    return arr[0] if arr.length == 1
    arr = arr.each_slice(2).map { |a, b| b ? a * b : a }
  end
end

TIMES = 1_000

Benchmark.bm 10 do |r|
  values.each do |size|
    puts "Time for #{size}! (#{TIMES} times)"
    r.report 'simple' do
      TIMES.times { factorial1 size }
    end
    r.report 'divided' do
      TIMES.times { factorial2 size }
    end
    puts ''
  end
end
