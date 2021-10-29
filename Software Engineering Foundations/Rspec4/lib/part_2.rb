# @return [Array<Integer>]
def proper_factors(num)
  (1...num).select { |factor| (num % factor).zero? }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(n)
  res = []
  num = 1
  while res.length < n
    res << num if perfect_number?(num)
    num += 1
  end

  res
end