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
puts

# @param [Integer] num
def helper_is_prime?(num)
  return false if num < 2
  return true if num == 2

  (2...num).each { |fact| return false if (num % fact).zero? }
  true
end

# @param [Integer] num
def bi_prime?(num)
  factorial = []
  (2...num).each { |factor| factorial << factor if (num % factor).zero? && helper_is_prime?(factor) }
  i = 0
  while i < factorial.length
    j = i
    while j < factorial.length
      return true if factorial[i] * factorial[j] == num

      j += 1
    end
    i += 1
  end
  false
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
puts

# @param [String] str
# @param [Array] key
def vigenere_cipher(str, key)
  alphabet = ('a'..'z').to_a
  result = ''
  i = 0
  str.each_char do |char|
    char_index = (alphabet.index(char) + key[i]) % 26
    result += alphabet[char_index]
    i = i + 1 == key.length ? 0 : i + 1
  end
  result
end

p vigenere_cipher('toerrishuman', [1])        # => "upfssjtivnbo"
p vigenere_cipher('toerrishuman', [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher('toerrishuman', [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher('zebra', [3, 0])            # => "ceerd"
p vigenere_cipher('yawn', [5, 1])             # => "dbbo"
puts

# @param [String] str
def vowel_rotate(str)
  vowels = 'aeiou'
  arr_vowels = []
  result = ''
  str.each_char { |char| arr_vowels << char if vowels.include?(char) }
  arr_vowels.unshift(arr_vowels.pop)
  i = 0
  str.each_char do |char|
    if vowels.include?(char)
      result += arr_vowels[i]
      i += 1
    else
      result += char
    end
  end
  result
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
puts

# PART 2

class String
  # @param [Proc] prc
  def select(&prc)
    prc ||= Proc.new { |char| char == '' }
    result = ''
    self.each_char { |char| result += char if prc.call(char) }
    result
  end

  def map!(&prc)
    self.each_char.with_index do |char, i|
      self[i] = prc.call(char, i)
    end
  end
end

p 'app academy'.select { |ch| !'aeiou'.include?(ch) }   # => "pp cdmy"
p 'HELLOworld'.select { |ch| ch == ch.upcase }          # => "HELLO"
p 'HELLOworld'.select          # => ""
puts

word_1 = "Lovelace"
word_1.map! do |ch|
  case ch
  when 'e'
    '3'
  when 'a'
    '4'
  else
    ch
  end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
  if i.even?
    ch.upcase
  else
    ch.downcase
  end
end
p word_2        # => "DiJkStRa"
puts

# @param [Integer] a
# @param [Integer] b
def multiply(a, b)
  return 0 if a.zero? || b.zero?

  if a.negative? && b.negative?
    -a + multiply(-a, -b - 1)
  elsif a.negative? || b.negative?
    -(a + multiply(a, -b - 1))
  else
    a + multiply(a, b - 1)
  end
end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
puts

def lucas_sequence(num)
  case num
  when 0
    []
  when 1
    [2]
  when 2
    [2, 1]
  else
    lucas_sequence(num-1) + [lucas_sequence(num-1)[-1] + lucas_sequence(num-1)[-2]]
  end
end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
puts

def prime_factorization(num)
  if helper_is_prime?(num)
    return [num]
  end
  (2..num).each do |i|
    if (num % i).zero?
      other_fact = num / i
      return [*prime_factorization(i), *prime_factorization(other_fact)]
    end
  end
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
