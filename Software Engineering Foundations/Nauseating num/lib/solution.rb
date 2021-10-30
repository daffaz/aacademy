# @param [Array] arr
def strange_sums(arr)
  count = 0
  (0...arr.length).each { |i| (i + 1...arr.length).each { |j| count += 1 if (arr[i] + arr[j]).zero? } }
  count
end

# @param [Array] arr
# @param [Integer] product
# @return [Boolean]
def pair_product(arr, product)
  (0...arr.length).each { |i| (i + 1...arr.length).each { |j| return true if arr[i] * arr[j] == product } }
  false
end

# @param [String] str
# @param [Hash] hash
def rampant_repeats(str, hash)
  result = ''
  str.each_char do |char|
    if hash[char].nil?
      result += char
    else
      result += char * hash[char]
    end
  end
  result
end

puts
p rampant_repeats('taco', {'a' => 3, 'c' => 2})             # 'taaacco'
p rampant_repeats('feverish', {'e' => 2, 'f' => 4, 's' => 3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s' => 2, 'p' => 2})          # 'mississppi'
p rampant_repeats('faarm', {'e' => 3, 'a' => 2})            # 'faaaarm'
puts

def perfect_square(num)
  (1..num).each do |i|
    next unless (num % i).zero?
    return true if i * i == num
  end
  false
end

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false
puts

def num_factors(n)
  (1..n).count { |i| (n % i).zero? }
end

def anti_prime?(n)
  amount = num_factors(n)
  (1...n).all? { |i| amount > num_factors(i) }
end

# @param [Array] arr1
# @param [Array] arr2
def matrix_addition(arr1, arr2)
  result = Array.new(arr1.length) { Array.new([]) }
  (0...arr1.length).each { |i| (0...arr1[i].length).each { |j| result[i] << arr1[i][j] + arr2[i][j] } }
  result
end

# [[11, 6], []]
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def factor_of(num)
  res = []
  (1...num).each { |i| res << i if (num % i).zero? }
  res
end
# @param [Array] num
def mutual_factors(*num)
  num
    .map { |n| factor_of(n) }
    .inject(:&)
end

puts
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
  return 1 if [1, 2].include?(num)
  return 2 if num == 3

  tribonacci_number(num - 1) + tribonacci_number(num - 2) + tribonacci_number(num - 3)
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274
puts

def matrix_addition_reloaded(*arr)
  arr.inject do |arr_total, current_arr|
    return nil if arr_total.length != current_arr.length

    matrix_addition(arr_total, current_arr)
  end
end

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
puts

# @param [Array] arr
def squarocol?(arr)
  return true if arr.any? { |row| row.uniq.length == 1 }
  return true if arr.transpose.any? { |col| col.uniq.length == 1 }
  false
end

# @param [Array<Array>] arr
def squaragonal?(arr)
  diag, anti_diag = [], []
  (0...arr.length).each do |i|
    diag << arr[i][i]
    anti_diag << arr[i][-i - 1]
  end
  return true if diag.uniq.length == 1 || anti_diag.uniq.length == 1
  false
end

def pascals_triangle(num)
  result = Array.new(num) { Array.new([1]) }
  (1...num).each do |i|
    j = 0
    while j < i - 1 # 1..2
      result[i] << result[i - 1][j] + result[i - 1][j + 1]
      j += 1
    end
    result[i] << 1
  end
  result
end

puts
p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]
puts

def is_prime?(num)
  return true if num == 2
  return false if num < 2
  (2...num).all? { |n| num % n != 0}
end

def mersenne_prime(num)
  count = 0
  n = -1
  while count < num
    n += 1
    if is_prime?(2**n - 1)
      count += 1
    end
  end
  2**n - 1
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071
puts

def triangular_sequence(n)
  seq = []
  i = 1
  while i <= n
    seq << (i * (i + 1)) / 2
    i += 1
  end
  seq
end

def triangular_word?(word)
  alpha = ('a'..'z').to_a
  value = word
            .split('')
            .map { |char| alpha.index(char) + 1 }
            .sum
  triangular_nums = triangular_sequence(value)
  triangular_nums.include?(value)
end

def collapse(nums)
  (0...nums.length - 1).each do |i|
    if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i + 1] + 1
      return nums[0...i] + nums[i + 2..-1]
    end
  end

  nums
end

def consecutive_collapse(numbers)
  numbers.each { numbers = collapse(numbers) }
  numbers
end

def next_prime(number, i)
  step = 1
  if i < 0
    i = -(i)
    step = -(step)
  end

  prime_count = 0
  while prime_count < i
    return nil if number < 0
    number += step
    prime_count += 1 if prime?(number)
  end
  number
end

def pretentious_primes(numbers, n)
  numbers.map { |num| next_prime(num, n) }
end