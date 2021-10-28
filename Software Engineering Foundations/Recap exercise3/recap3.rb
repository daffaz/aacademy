# @param [Array] arr
def no_dupes?(arr)
  result = []
  hash = Hash.new(0)
  arr.each do |item|
    hash[item] += 1
  end
  hash.each_pair do |k, v|
    result << k if v < 2
  end
  result
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

# @param [Array] arr
def no_consecutive_repeats?(arr)
  (0...arr.length).each { |i| return false if arr[i] == arr[i + 1] }
  true
end

puts
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
puts

# @param [String] str
def char_indices(str)
  hash = Hash.new { |h, k| h[k] = [] }
  str.each_char.with_index do |char, i|
    hash[char].push(i)
  end
  hash
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts

# @param [String] str
def longest_streak(str)
  hash = Hash.new(0)
  str.each_char { |char| hash[char] += 1 }

  res = hash.sort_by { |_k, v| v }
  res[-1][0] * res[-1][1]
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
