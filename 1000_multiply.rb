require 'benchmark'
TIMES = 100_000

const = 7**1000 + 1

Benchmark.bm 20 do |r|
  1000.step(10_000, 100) do |i|
    val = 7**i
    title = format('%5d, %5d bits', i, val.bit_length)
    r.report title do
      TIMES.times { val * const }
    end
  end
end
