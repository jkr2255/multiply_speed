$counts = Hash.new { |h, k| h[k] = 0 }
$enabled = false

module MultiplyHook
  def *(other)
    $counts[[size, other.size].sort] += 1 if $enabled
    super
  end
end

class Fixnum
  # hook multiply
  prepend MultiplyHook
end

class Bignum
  # hook multiply
  prepend MultiplyHook
end

$enabled = true
arr = [*1..10_000]
loop do
  break if arr.length == 1
  arr = arr.each_slice(2).map { |a, b| b ? a * b : a }
end
$enabled = false

$counts.each do |(a, b), v|
  puts "#{a},#{b},#{v}"
end
