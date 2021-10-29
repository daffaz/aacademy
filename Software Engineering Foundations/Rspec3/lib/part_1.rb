def is_prime?(num)
  if num < 2
    return false
  elsif num == 2
    return true
  end

  (2...num).each.none? { |n| (num % n).zero? }
end

def nth_prime(n)
  count = 0
  num = 1
  while count < n
    num += 1
    count += 1 if is_prime?(num)
  end
  num
end

# @param [Integer] min
# @param [Integer] max
def prime_range(min, max)
  result = []
  (min..max).each { |num| result << num if is_prime?(num) }
  result
end