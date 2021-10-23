# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

# @param num [Integer]
def largest_prime_factor(num)
  i = num
  while i.positive?
    return i if (num % i).zero? && is_prime?(i)

    i -= 1
  end
end

# @param num [Integer]
# @return [TrueClass, FalseClass]
def is_prime?(num)
  return false if num < 2

  (2...num).each { |n| return false if (num % n).zero? }
  true
end

# @param str [String]
def unique_chars?(str)
  hash = Hash.new(0)

  str.each_char do |char|
    return false if hash[char] == 1

    hash[char] += 1
  end
  true
end

# @param arr [Array]
def dupe_indices(arr)
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each_with_index do |char, i|
    hash[char] = [*hash[char], i]
  end
  hash.select do |_k, v|
    val = v[1..-1]
    val.length > 0
  end
end

# @param arr1 [Array]
# @param arr2 [Array]
def ana_array(arr1, arr2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  arr1.each { |item| hash1[item] += 1 }
  arr2.each { |item| hash2[item] += 1 }

  hash1 == hash2
end
