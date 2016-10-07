require 'benchmark'
TIMES = 100_000

Benchmark.bm 20 do |r|
  1000.step(10_000, 100) do |i|
    val = 7**i
    title = format('%5d, %5d bits', i, val.bit_length)
    val2 = val + 1
    r.report title do
      TIMES.times { val * val2 }
    end
  end
end
