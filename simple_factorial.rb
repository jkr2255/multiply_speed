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
(1..10_000).reduce(*:*)
$enabled = false

$counts.each do |(a, b), v|
  puts "#{a},#{b},#{v}"
end
